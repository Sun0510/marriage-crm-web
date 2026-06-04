# VM8 DB 서버 구축 가이드

이 문서는 침해사고 대응 실습 환경의 VM8 DB 서버를 구축하는 절차입니다.

## 1. 기준 구성

| 항목 | 값 |
| --- | --- |
| 역할 | CRM 고객정보 DB 서버 |
| VM | VM8 |
| OS | Ubuntu Server 22.04 LTS |
| DBMS | Microsoft SQL Server 2022 Developer Edition |
| IP | `10.10.30.30/24` |
| Gateway | `10.10.30.1` |
| DB 포트 | TCP `1433` |
| DB 이름 | `MarriageCrm` |
| CRM 웹서버 | VM5 `10.10.30.20` |
| 보안관제 서버 | VM6 Wazuh `10.10.40.10` |

실습 VM 권장 자원은 vCPU 2개, RAM 4GB 이상, 디스크 30GB 이상입니다. SQL Server의 최소 메모리는 2GB입니다.

## 2. Ubuntu 네트워크 설정

Ubuntu 설치 후 인터페이스 이름을 확인합니다.

```bash
ip -br link
ip -br address
```

예를 들어 인터페이스가 `ens33`이라면 `/etc/netplan/01-crm-db.yaml`을 생성합니다.

```yaml
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: false
      addresses:
        - 10.10.30.30/24
      routes:
        - to: default
          via: 10.10.30.1
      nameservers:
        addresses:
          - 10.10.30.1
          - 1.1.1.1
```

적용 후 주소와 게이트웨이를 확인합니다.

```bash
sudo netplan apply
ip -br address
ip route
```

폐쇄형 실습망에서 외부 DNS를 사용하지 않는 경우 `1.1.1.1`은 제거합니다.

## 3. SQL Server 2022 설치

패키지 목록과 기본 도구를 준비합니다.

```bash
sudo apt-get update
sudo apt-get install -y curl ca-certificates gnupg ufw
```

Microsoft 서명 키와 SQL Server 2022 저장소를 등록합니다.

```bash
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
  | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc > /dev/null

curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list \
  | sudo tee /etc/apt/sources.list.d/mssql-server-2022.list
```

SQL Server를 설치합니다.

```bash
sudo apt-get update
sudo apt-get install -y mssql-server
sudo /opt/mssql/bin/mssql-conf setup
```

설정 과정에서는 다음과 같이 선택합니다.

```text
Edition: Developer
Language: 원하는 언어
SA password: 실습 전용 강력한 비밀번호
```

서비스 상태를 확인합니다.

```bash
systemctl status mssql-server --no-pager
sudo ss -lntp | grep 1433
```

## 4. sqlcmd 설치

SQL Server 관리용 명령줄 도구를 설치합니다.

```bash
curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/prod.list \
  | sudo tee /etc/apt/sources.list.d/mssql-release.list

sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18 unixodbc-dev

echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc
```

연결을 확인합니다. `-C`는 실습 환경의 자체 서명 인증서를 신뢰하도록 지정합니다.

```bash
sqlcmd -S localhost -U sa -C -Q "SELECT @@VERSION;"
```

비밀번호는 명령행에 직접 넣지 마세요. `-P`를 생략하면 입력 프롬프트가 표시됩니다.

## 5. 방화벽 설정

CRM 웹서버인 VM5에서만 SQL Server에 접근하도록 제한합니다.

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow proto tcp from 10.10.30.20 to any port 1433 comment 'VM5 CRM to MSSQL'
sudo ufw enable
sudo ufw status numbered
```

SSH를 사용하는 경우 UFW 활성화 전에 관리자 PC만 허용합니다.

```bash
sudo ufw allow proto tcp from <ADMIN_IP> to any port 22 comment 'Admin SSH'
```

pfSense에도 다음 정책을 적용합니다.

| 출발지 | 목적지 | 포트 | 처리 |
| --- | --- | --- | --- |
| VM5 `10.10.30.20` | VM8 `10.10.30.30` | TCP `1433` | 허용 |
| 나머지 모든 장비 | VM8 `10.10.30.30` | TCP `1433` | 차단 |

## 6. DB 스크립트 전송

다음 아홉 파일을 VM8의 `~/crm-db` 디렉터리로 전송합니다.

```text
init.sql
migration-sensitive-500.sql
migration-add-gender.sql
migration-add-app-users.sql
migration-update-counselor-accounts.sql
migration-add-more-counselors.sql
audit.sql
verify.sql
audit-report.sql
```

Windows 호스트에서 실행하는 예시는 다음과 같습니다.

```powershell
scp ".\database\init.sql" `
    ".\database\migration-sensitive-500.sql" `
    ".\database\migration-add-gender.sql" `
    ".\database\migration-add-app-users.sql" `
    ".\database\migration-update-counselor-accounts.sql" `
    ".\database\migration-add-more-counselors.sql" `
    ".\database\audit.sql" `
    ".\database\verify.sql" `
    ".\database\audit-report.sql" `
    <UBUNTU_USER>@10.10.30.30:~/crm-db/
```

## 7. DB 및 초기 데이터 생성

VM8에서 작업 디렉터리로 이동합니다.

```bash
cd ~/crm-db
```

`init.sql`의 `CHANGE_ME_CRM_APP_PASSWORD`를 실습 전용 비밀번호로 변경합니다.

```bash
nano init.sql
```

예시 비밀번호를 그대로 사용하지 말고 별도로 정한 값을 사용합니다. 변경 후 DB를 생성합니다.

```bash
sqlcmd -S localhost -U sa -C -b -i init.sql
```

`init.sql`은 다음 작업을 수행합니다.

- `MarriageCrm` 데이터베이스 생성
- 업무 테이블 5개 생성
- 인덱스 4개 생성
- 성별, 회사, 소득, 주소, 신체조건, 종교, 가족, 자산, 과거 이력, 내부등급을 포함한 가상 고객 500명 이상 적재
- CRM 전용 로그인 `crm_app` 생성
- `crm_app`에 조회 권한과 첨부파일 기록 추가 권한 부여

주의: `init.sql`을 다시 실행하면 기존 업무 테이블과 내부 데이터가 삭제된 후 다시 만들어집니다. 최초 구축 또는 실습 초기화 때만 실행하세요.

이미 운영 중인 `MarriageCrm` DB에 민감 프로필 컬럼과 500명 가상 데이터를 추가하는 경우에는 `init.sql` 대신 다음 파일을 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -b -d master -i migration-sensitive-500.sql
```

`migration-sensitive-500.sql`은 기존 테이블을 삭제하지 않고 부족한 고객 수만 500명까지 채웁니다.

이미 500명 데이터가 들어간 DB에 성별 컬럼만 추가해야 한다면 다음 파일만 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -b -d master -i migration-add-gender.sql
```

상담사와 관리자 계정을 DB에서 관리하도록 바꾸려면 다음 파일을 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -b -d master -i migration-add-app-users.sql
```

기존 `counselor01`, `counselor02`, `counselor03` 계정을 회사 계정 형태로 변경하려면 다음 파일을 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -b -d master -i migration-update-counselor-accounts.sql
```

기본 실습 계정은 `kim.hana`, `lee.doyoon`, `park.seoyeon`, `admin`이며 비밀번호는 평문이 아니라 PBKDF2-SHA256 해시로 저장됩니다.

상담사 계정을 10명으로 확장하려면 다음 파일을 추가 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -b -d master -i migration-add-more-counselors.sql
```

## 8. SQL Server Audit 설정

감사 로그 디렉터리를 준비합니다.

```bash
sudo mkdir -p /var/opt/mssql/audit
sudo chown mssql:mssql /var/opt/mssql/audit
sudo chmod 750 /var/opt/mssql/audit
```

감사 정책을 적용합니다.

```bash
sqlcmd -S localhost -U sa -C -b -i audit.sql
```

기록 대상은 다음과 같습니다.

| 로그 | 목적 |
| --- | --- |
| 로그인 성공·실패 | 정상 CRM 연결과 비정상 인증 시도 분석 |
| 로그아웃 | 세션 종료 시점 확인 |
| `dbo` 스키마 `SELECT` | 고객정보 대량 조회 분석 |
| `INSERT`, `UPDATE`, `DELETE` | DB 데이터 변경 분석 |

최근 감사 로그를 확인합니다.

```bash
sqlcmd -S localhost -U sa -C -d master -y 120 -Y 40 -w 220 -i audit-report.sql
```

감사 파일은 `/var/opt/mssql/audit/*.sqlaudit`에 저장됩니다.

## 9. 구축 결과 검증

검증 SQL을 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -i verify.sql
```

초기 데이터 건수는 다음과 같아야 합니다.

| 테이블 | 건수 |
| --- | ---: |
| `customers` | 500 |
| `consulting_notes` | 500 이상 |
| `contracts` | 500 |
| `matching_history` | 500 이상 |
| `uploaded_files` | 0 |
| `app_users` | 18 |

CRM 계정으로도 조회가 가능한지 확인합니다.

```bash
sqlcmd -S localhost -U crm_app -C -d MarriageCrm \
  -Q "SELECT COUNT(*) AS customer_count FROM dbo.customers;"
```

## 10. VM5 CRM 연결

VM5의 `C:\inetpub\MarriageCrm\appsettings.Production.json`에 DB 연결 문자열을 설정합니다.

```json
{
  "ConnectionStrings": {
    "CrmDatabase": "Server=10.10.30.30,1433;Database=MarriageCrm;User ID=crm_app;Password=<CRM_DB_PASSWORD>;Encrypt=True;TrustServerCertificate=True"
  }
}
```

VM5에서 TCP 연결을 확인합니다.

```powershell
Test-NetConnection -ComputerName 10.10.30.30 -Port 1433
```

`TcpTestSucceeded`가 `True`이면 IIS CRM을 재시작합니다.

```powershell
Restart-WebItem "IIS:\Sites\MarriageCrm"
```

## 11. Wazuh 수집 대상

VM8에 Wazuh Agent를 설치한 뒤 최소한 다음 로그를 수집합니다.

| 로그 | 위치 | 분석 목적 |
| --- | --- | --- |
| SQL Server Error Log | `/var/opt/mssql/log/errorlog` | 서버 시작, 오류, 인증 관련 정황 |
| SQL Server Audit | `/var/opt/mssql/audit/*.sqlaudit` | 로그인, 대량 조회, 데이터 변경 분석 |
| Ubuntu 인증 로그 | `/var/log/auth.log` | SSH 로그인 분석 |
| UFW 로그 | `/var/log/ufw.log` | 차단된 DB 접근 분석 |

`.sqlaudit` 파일은 SQL Server 전용 형식입니다. `sys.fn_get_audit_file`로 조회하거나 별도 수집 파이프라인에서 텍스트 또는 JSON으로 변환하여 SIEM에 전달합니다.

## 12. 운영 전 추가 권고

이 프로젝트는 폐쇄형 실습 환경이므로 구축 절차에서 `sa`를 초기 관리자 계정으로 사용합니다. 실제 운영 환경에서는 별도 관리자 로그인을 생성하고 연결을 검증한 뒤 `sa`를 비활성화하세요. Microsoft도 최초 설치 후 `sa` 비활성화를 권고합니다.

```sql
USE master;
GO
CREATE LOGIN crm_admin
    WITH PASSWORD = '<ADMIN_PASSWORD>',
         CHECK_POLICY = ON;
GO
ALTER SERVER ROLE sysadmin ADD MEMBER crm_admin;
GO
ALTER LOGIN sa DISABLE;
GO
```

운영 환경에서는 신뢰 가능한 서버 인증서를 구성하고, VM5 연결 문자열의 `TrustServerCertificate=True`도 제거합니다.

## 13. 공식 참고 문서

- [SQL Server on Ubuntu 설치](https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver17)
- [SQL Server Linux 지원 플랫폼](https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-setup?view=sql-server-ver17)
- [sqlcmd 설치](https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-setup-tools?view=sql-server-ver17)
- [SQL Server Audit](https://learn.microsoft.com/en-us/sql/relational-databases/security/auditing/sql-server-audit-database-engine?view=sql-server-ver17)
