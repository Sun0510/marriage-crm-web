# VM8 대용량 회사형 더미 데이터 생성

이 기능은 기존 CRM 화면이 사용하는 `dbo` 테이블 구조를 바꾸지 않고, VM8 MSSQL에 회사 운영에서 볼 수 있는 대용량 데이터를 추가한다.

## 생성되는 스키마

| 스키마 | 용도 |
|---|---|
| `company_ops` | CRM 애플리케이션 로그, 웹 접근 로그, 배치 작업 이력, 시스템 메트릭 |
| `company_archive` | 메일 아카이브, 문서 저장소 |
| `company_finance` | 청구/결제 아카이브 |
| `company_security` | 엔드포인트 보안 이벤트, 네트워크 플로우 로그 |

## 기본 실행

VM5 또는 SQL Server에 접근 가능한 Windows PowerShell에서 실행한다.

```powershell
cd C:\crm-web
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\scripts\run-vm8-enterprise-bulk-data-remote.ps1 -TargetGb 10
```

기본값:

- 서버: `10.10.30.30,1433`
- DB: `MarriageCrm`
- 계정: `sa`
- 기존 대용량 더미 테이블은 삭제 후 다시 생성
- 복구 모델은 대량 적재 중 로그 폭증을 줄이기 위해 `SIMPLE`로 변경

## 50GB 또는 100GB 생성

```powershell
.\scripts\run-vm8-enterprise-bulk-data-remote.ps1 -TargetGb 50
```

```powershell
.\scripts\run-vm8-enterprise-bulk-data-remote.ps1 -TargetGb 100
```

## 기존 데이터에 추가 적재

이미 생성된 대용량 더미 테이블을 유지하고 목표 용량까지 추가 적재하려면 `-Append`를 사용한다.

```powershell
.\scripts\run-vm8-enterprise-bulk-data-remote.ps1 -TargetGb 30 -Append
```

## 복구 모델을 유지하고 싶은 경우

```powershell
.\scripts\run-vm8-enterprise-bulk-data-remote.ps1 -TargetGb 10 -KeepRecoveryModel
```

단, `FULL` 복구 모델에서는 트랜잭션 로그 파일이 매우 커질 수 있다.

## 용량 확인 SQL

```sql
SELECT
    s.name AS schema_name,
    t.name AS table_name,
    SUM(CASE WHEN p.index_id IN (0, 1) THEN p.row_count ELSE 0 END) AS row_count,
    CONVERT(decimal(18,2), SUM(p.reserved_page_count) * 8.0 / 1024.0 / 1024.0) AS reserved_gb
FROM sys.dm_db_partition_stats p
JOIN sys.tables t ON p.object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name IN (N'company_ops', N'company_archive', N'company_security', N'company_finance')
GROUP BY s.name, t.name
ORDER BY reserved_gb DESC;
```

