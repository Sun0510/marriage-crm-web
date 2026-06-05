# VM8 DB 서버 구축 가이드

이 문서는 현재 최종 CRM 데이터 기준으로 VM8 Ubuntu + MSSQL 서버를 준비하는 절차입니다.

## 1. VM 정보

| 항목 | 값 |
| --- | --- |
| 역할 | CRM DB 서버 |
| OS | Ubuntu 22.04 |
| IP | `10.10.30.30` |
| DBMS | Microsoft SQL Server |
| 서비스 포트 | TCP `1433` |
| CRM 웹 서버 | VM5 `10.10.30.20` |

## 2. 최종 SQL 파일

현재 사용하는 SQL 파일은 다음만 남깁니다.

| 파일 | 용도 |
| --- | --- |
| `init.sql` | `MarriageCrm` DB, 테이블, 인덱스, DB 로그인, 기본 권한 생성 |
| `customer-data-reset.sql` | 최종 한글 고객 데이터 500명, 상담 이력, 계약, 매칭 이력 재적재 |
| `audit.sql` | SQL Server Audit 설정 |
| `audit-report.sql` | 감사 로그 조회 |
| `verify.sql` | 구축 결과 검증 |

이전 단계별 `migration-*.sql` 파일들은 최종 데이터 리셋 파일에 흡수되었으므로 사용하지 않습니다.

## 3. SQL 파일 전송

Windows의 `crm-web` 폴더에서 실행합니다.

```powershell
scp ".\database\init.sql" `
    ".\database\customer-data-reset.sql" `
    ".\database\audit.sql" `
    ".\database\audit-report.sql" `
    ".\database\verify.sql" `
    ubuntu@10.10.30.30:~/crm-db/
```

VM8에서 작업 폴더를 준비합니다.

```bash
mkdir -p ~/crm-db
cd ~/crm-db
```

## 4. DB 초기화

`init.sql`의 앱 계정 비밀번호 자리표시자를 실제 실습 비밀번호로 바꿉니다.

```bash
sed -i "s/CHANGE_ME_CRM_APP_PASSWORD/P@ssw0rd/g" init.sql
```

처음 구축하거나 DB를 초기화할 때는 다음 순서로 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -b -i init.sql
sqlcmd -S localhost -U sa -C -b -d MarriageCrm -i customer-data-reset.sql
```

주의: `init.sql`은 기존 `MarriageCrm` 데이터베이스를 삭제한 뒤 다시 만들 수 있습니다. 이미 운영 중인 데이터를 보존해야 하는 상황에서는 먼저 백업하세요.

`customer-data-reset.sql`은 업무 데이터만 최종본으로 다시 채웁니다.

- 고객 번호를 `1`부터 다시 부여
- 고객 500명 적재
- 고객별 상담 이력 1~3건 적재
- 계약 정보 500건 적재
- 매칭 이력 500건 적재
- 고객 정보와 Word 파일 이름이 매핑되도록 고객 번호를 고정

## 5. 감사 설정

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

최근 감사 로그는 다음으로 확인합니다.

```bash
sqlcmd -S localhost -U sa -C -d master -y 120 -Y 40 -w 220 -i audit-report.sql
```

## 6. 검증

구축 후 다음을 실행합니다.

```bash
sqlcmd -S localhost -U sa -C -i verify.sql
```

정상 기준은 다음과 같습니다.

| 테이블 | 기대값 |
| --- | ---: |
| `customers` | 500 |
| `consulting_notes` | 500 이상 |
| `contracts` | 500 |
| `matching_history` | 500 이상 |
| `uploaded_files` | 0 |
| `app_users` | 회사 계정 존재 |

CRM 웹 서버에서 DB 연결도 확인합니다.

```powershell
Test-NetConnection -ComputerName 10.10.30.30 -Port 1433
```

웹 서버의 `appsettings.json` 연결 문자열은 다음 형식을 사용합니다.

```json
{
  "ConnectionStrings": {
    "CrmDatabase": "Server=10.10.30.30,1433;Database=MarriageCrm;User ID=crm_app;Password=P@ssw0rd;Encrypt=True;TrustServerCertificate=True"
  }
}
```

## 7. 남겨둘 파일 기준

DB 폴더에는 현재 구축과 검증에 필요한 파일만 유지합니다.

```text
audit-report.sql
audit.sql
customer-data-reset.sql
DB_SPECIFICATION.md
init.sql
verify.sql
VM8_SETUP_GUIDE.md
```
