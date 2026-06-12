# VM8 MSSQL 통합 구축 안내

## 최종 SQL

DB 구축에는 아래 파일 하나만 사용합니다.

```text
database/yeonsu-crm-all-in-one.sql
```

이 파일에는 다음 내용이 모두 포함됩니다.

- `MarriageCrm` 데이터베이스와 테이블 생성
- `crm_app` 로그인과 권한 생성
- CRM 직원 계정
- 회사 설립일과 보안 사고 정보
- 고객 2,000명
- 상담 기록 10,000건
- 계약 정보 2,000건
- 매칭 이력 4,018건
- 업로드 파일 이력 1,311건
- 구축 결과 검증 쿼리

## sqlcmd 없이 VM5에서 원격 실행

VM5 관리자 PowerShell에서 CRM 프로젝트 폴더로 이동합니다.

```powershell
cd "C:\crm-web"
```

실행합니다.

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\run-all-in-one-remote.ps1
```

기본 DB 서버는 `10.10.30.30,1433`이며, `sa` 비밀번호를 입력합니다.

다른 서버를 지정하려면 다음과 같이 실행합니다.

```powershell
.\scripts\run-all-in-one-remote.ps1 -Server "10.10.30.30,1433" -User "sa"
```

`crm_app`은 데이터베이스, 로그인, 테이블을 생성할 권한이 없으므로 초기 구축에는 사용할 수 없습니다.

## 네트워크 확인

```powershell
Test-NetConnection 10.10.30.30 -Port 1433
```

`TcpTestSucceeded : True`여야 합니다.

## VM8 확인

VM8에서 MSSQL 서비스 상태를 확인합니다.

```bash
sudo systemctl status mssql-server
sudo ss -lntp | grep 1433
```

통합 SQL을 다시 실행하면 기존 CRM 업무 데이터와 테이블을 다시 생성합니다. 필요한 데이터가 있다면 먼저 백업해야 합니다.
