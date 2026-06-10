# 연수(延繡) CRM

결혼정보회사 연수(延繡)의 내부 상담 업무를 가정한 ASP.NET Core 기반 CRM 웹 애플리케이션입니다.
보안 사고 원인 분석 및 대응 방안 도출 프로젝트에서 VM5 CRM 웹 서버와 VM8 MSSQL DB 서버를 구성하기 위해 사용합니다.

## 개요

- 회사명: 연수(延繡)
- 서비스 성격: 결혼정보회사 고객 상담 및 매칭 관리 CRM
- 웹 서버: VM5, Windows Server 2019 + IIS, `10.10.30.20`
- DB 서버: VM8, Ubuntu 22.04 + Microsoft SQL Server, `10.10.30.30`
- 데이터베이스: `MarriageCrm`
- 웹 접속 URL: `http://10.10.30.20`

## 주요 기능

- 직원 로그인
- 상담사, 선임 상담사, 부장급, 관리자 권한 구분
- 고객 목록 조회, 검색, 필터링, 페이지 이동
- 고객 상세정보 조회
- 고객 신규 등록 및 정보 수정
- 상담 기록, 계약 정보, 매칭 이력 조회
- 고객별 Word 문서 다운로드
- 자료 첨부 및 업로드 파일 이력 확인
- 업로드 파일 다운로드
- 자료 추출 페이지에서 고객 검색 결과 기반 문서 다운로드
- 관리자 페이지에서 계정, 업로드, 주요 현황 확인
- JSONL 형식 감사 로그 기록

## 주요 URL

| 경로 | 설명 |
| --- | --- |
| `/login` | 직원 로그인 |
| `/dashboard` | 업무 현황 대시보드 |
| `/customers` | 고객 관리 |
| `/customers/new` | 고객 신규 등록 |
| `/customers/{id}` | 고객 상세정보 |
| `/customers/{id}/edit` | 고객 정보 수정 |
| `/customers/{id}/export` | 고객 Word 문서 다운로드 |
| `/attachments` | 자료 첨부 및 업로드 이력 |
| `/attachments/{id}/download` | 업로드 파일 다운로드 |
| `/reports` | 자료 추출 |
| `/admin` | 관리자 페이지 |

## 저장소 경로

운영 환경 기준 저장소 설정은 다음과 같습니다.

```json
"Storage": {
  "UploadPath": "C:\\crm-data\\uploads",
  "CustomerDocumentPath": "customer-documents",
  "AuditLogPath": "C:\\crm-data\\logs\\crm-audit.jsonl"
}
```

| 항목 | 경로 | 설명 |
| --- | --- | --- |
| 업로드 파일 | `C:\crm-data\uploads` | 자료 첨부 페이지에서 업로드한 파일 저장 |
| 고객 Word 문서 | `C:\inetpub\MarriageCrm\customer-documents` | 고객별 사전 생성 Word 문서 저장 |
| CRM 감사 로그 | `C:\crm-data\logs\crm-audit.jsonl` | 로그인, 다운로드, 업로드 등 감사 이벤트 |
| IIS 로그 | `C:\inetpub\logs\LogFiles` | IIS 접근 로그 |

자료 첨부 페이지의 URL은 `/attachments`를 사용합니다. 실제 저장 폴더 이름인 `uploads`와 URL 경로가 충돌하지 않도록 분리했습니다.

## DB 구성

주요 테이블은 다음과 같습니다.

| 테이블 | 설명 |
| --- | --- |
| `dbo.customers` | 고객 기본정보, 직업, 회사, 소득, 주소, 신체조건, 종교, 취미, 성격, 가족, 자산, 과거 이력, 고객 등급 |
| `dbo.consulting_notes` | 고객별 상담 기록 |
| `dbo.contracts` | 계약일, 종료일, 회원 등급, 결제 금액, 계약 상태 |
| `dbo.matching_history` | 고객 간 매칭 이력 |
| `dbo.uploaded_files` | 첨부파일 업로드 이력 |
| `dbo.app_users` | CRM 직원 계정, 권한, 로그인 이력 |
| `dbo.customer_portal_accounts` | 실습용 고객 포털 계정 데이터 |

상세 DB 명세는 아래 문서를 참고합니다.

```text
database\DB_SPECIFICATION.md
```

## DB 초기화 및 추가 데이터

기본 DB 생성:

```bash
sqlcmd -S localhost -U sa -C -i init.sql
```

500명 고객 데이터 재설정:

```bash
sqlcmd -S localhost -U sa -C -d MarriageCrm -i customer-data-reset.sql
```

추가 요청 고객 및 매칭 데이터 반영:

```bash
sqlcmd -S localhost -U sa -C -d MarriageCrm -i add-requested-customers.sql
```

DB 상태 확인:

```bash
sqlcmd -S localhost -U sa -C -d MarriageCrm -i verify.sql
```

고객 수 확인:

```bash
sqlcmd -S localhost -U sa -C -d MarriageCrm -Q "SELECT COUNT(*) AS customer_count FROM dbo.customers;"
```

## IIS 배포

VM5 Windows Server 2019에서 관리자 PowerShell로 실행합니다.

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\publish.ps1
.\scripts\deploy-iis.ps1
Restart-WebAppPool -Name "MarriageCrm"
Restart-WebItem "IIS:\Sites\MarriageCrm"
```

배포 스크립트는 다음 작업을 수행합니다.

- IIS 사이트 `MarriageCrm` 구성
- 앱 풀 `MarriageCrm` 구성
- `C:\crm-data\uploads` 생성
- `C:\crm-data\logs` 생성
- 사이트 루트 아래 `customer-documents` 생성
- 앱 풀 계정에 필요한 폴더 권한 부여
- Windows 방화벽 HTTP 80 포트 허용

## appsettings.Production.json 예시

운영 서버에는 `appsettings.Production.example.json`을 참고하여 `appsettings.Production.json`을 생성합니다.

```json
{
  "ConnectionStrings": {
    "CrmDatabase": "Server=10.10.30.30,1433;Database=MarriageCrm;User ID=crm_app;Password=YOUR_PASSWORD;Encrypt=True;TrustServerCertificate=True"
  },
  "Storage": {
    "UploadPath": "C:\\crm-data\\uploads",
    "CustomerDocumentPath": "customer-documents",
    "AuditLogPath": "C:\\crm-data\\logs\\crm-audit.jsonl"
  },
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```

## 네트워크 조건

| 출발지 | 목적지 | 포트 | 목적 |
| --- | --- | --- | --- |
| `10.10.20.0/24` | `10.10.30.20` | TCP 80 | 상담사 PC에서 CRM 웹 접속 |
| `10.10.30.20` | `10.10.30.30` | TCP 1433 | CRM 웹 서버에서 MSSQL DB 접속 |
| `10.10.30.20` | `10.10.40.10` | TCP 1514, 1515 | Wazuh Agent 로그 전송 및 등록 |

## 로그 수집 포인트

Wazuh에서 수집 대상으로 삼기 좋은 로그는 다음과 같습니다.

| 로그 | 위치 |
| --- | --- |
| CRM 감사 로그 | `C:\crm-data\logs\crm-audit.jsonl` |
| IIS 접근 로그 | `C:\inetpub\logs\LogFiles` |
| Windows 이벤트 로그 | Application, System, Security |

CRM 감사 로그에는 로그인, 로그아웃, 고객 생성/수정, 파일 업로드, 파일 다운로드, 자료 추출 이벤트가 기록됩니다.

## 로컬 개발

로컬 Docker 기반 MSSQL 테스트 환경을 구성할 때는 다음 스크립트를 사용할 수 있습니다.

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\scripts\setup-local-db.ps1 -ResetDatabase
.\scripts\run-local.ps1
```

`setup-local-db.ps1`은 `database/init.sql`의 `CHANGE_ME_CRM_APP_PASSWORD` 값을 실행 시 입력된 앱 계정 비밀번호로 치환한 뒤 DB 초기화 스크립트를 실행합니다.

## 관련 스크립트

| 파일 | 설명 |
| --- | --- |
| `scripts\publish.ps1` | ASP.NET Core 앱 publish |
| `scripts\deploy-iis.ps1` | IIS 사이트, 앱 풀, 권한, 방화벽 설정 |
| `scripts\setup-local-db.ps1` | 로컬 Docker MSSQL 초기화 |
| `scripts\run-local.ps1` | 로컬 실행 |
| `scripts\generate-customer-data-package.ps1` | 고객 데이터 및 문서 패키지 생성 |
| `scripts\create-application-form.ps1` | 상담 신청서 Word 양식 생성 |

## 주의 사항

- 고객 데이터는 프로젝트 실습용 가상 데이터입니다.
- 운영 형태를 흉내 내기 위해 민감정보처럼 보이는 항목을 포함하지만 실제 개인정보를 사용하지 않습니다.
- 업로드 파일은 `/attachments/{id}/download` 라우트를 통해 다운로드합니다.
- `/upload-files` 같은 IIS 가상 디렉터리를 추가하면 파일 URL 접근이 가능하지만, 문서 열람 용도로만 사용해야 합니다.
