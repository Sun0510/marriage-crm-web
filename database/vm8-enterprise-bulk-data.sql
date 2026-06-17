/*
  Yeonsu CRM VM8 enterprise-scale dummy data generator.

  This script keeps the existing CRM tables and web-site-facing structure intact.
  It adds separate company-like schemas and fills them until the generated tables
  reserve approximately the requested amount of database space.

  Placeholders are replaced by scripts/run-vm8-enterprise-bulk-data-remote.ps1:
    __TARGET_GB__
    __RESET_EXISTING__
    __SET_SIMPLE_RECOVERY__
*/

SET NOCOUNT ON;
SET XACT_ABORT ON;

DECLARE @TargetGb int = __TARGET_GB__;
DECLARE @ResetExisting bit = __RESET_EXISTING__;
DECLARE @SetSimpleRecovery bit = __SET_SIMPLE_RECOVERY__;

IF DB_NAME() <> N'MarriageCrm'
BEGIN
    THROW 51000, 'Run this script against the MarriageCrm database.', 1;
END;

IF @TargetGb < 1 OR @TargetGb > 100
BEGIN
    THROW 51001, 'TargetGb must be between 1 and 100.', 1;
END;

IF @SetSimpleRecovery = 1
BEGIN
    DECLARE @recoverySql nvarchar(max) =
        N'ALTER DATABASE ' + QUOTENAME(DB_NAME()) + N' SET RECOVERY SIMPLE WITH NO_WAIT;';
    EXEC (@recoverySql);
END;

IF SCHEMA_ID(N'company_ops') IS NULL EXEC(N'CREATE SCHEMA company_ops');
IF SCHEMA_ID(N'company_archive') IS NULL EXEC(N'CREATE SCHEMA company_archive');
IF SCHEMA_ID(N'company_security') IS NULL EXEC(N'CREATE SCHEMA company_security');
IF SCHEMA_ID(N'company_finance') IS NULL EXEC(N'CREATE SCHEMA company_finance');

IF @ResetExisting = 1
BEGIN
    DROP TABLE IF EXISTS company_security.network_flow_logs;
    DROP TABLE IF EXISTS company_security.endpoint_events;
    DROP TABLE IF EXISTS company_finance.invoice_archive;
    DROP TABLE IF EXISTS company_archive.document_repository;
    DROP TABLE IF EXISTS company_archive.email_messages;
    DROP TABLE IF EXISTS company_ops.system_metrics;
    DROP TABLE IF EXISTS company_ops.batch_job_history;
    DROP TABLE IF EXISTS company_ops.web_access_logs;
    DROP TABLE IF EXISTS company_ops.crm_application_logs;
END;

IF @ResetExisting = 0
   AND OBJECT_ID(N'company_ops.crm_application_logs', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_ops.web_access_logs', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_ops.batch_job_history', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_ops.system_metrics', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_archive.email_messages', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_archive.document_repository', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_finance.invoice_archive', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_security.endpoint_events', N'U') IS NOT NULL
   AND OBJECT_ID(N'company_security.network_flow_logs', N'U') IS NOT NULL
BEGIN
    GOTO EnsureEnterpriseIndexes;
END;

CREATE TABLE company_ops.crm_application_logs
(
    id             bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_crm_application_logs PRIMARY KEY,
    occurred_at    datetime2(0) NOT NULL,
    log_level      nvarchar(20) NOT NULL,
    source_service nvarchar(80) NOT NULL,
    actor          nvarchar(80) NOT NULL,
    source_ip      varchar(45) NOT NULL,
    request_path   nvarchar(300) NOT NULL,
    message        nvarchar(1000) NOT NULL,
    payload        nvarchar(max) NOT NULL
);

CREATE TABLE company_ops.web_access_logs
(
    id             bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_web_access_logs PRIMARY KEY,
    accessed_at    datetime2(0) NOT NULL,
    source_ip      varchar(45) NOT NULL,
    user_agent     nvarchar(400) NOT NULL,
    method         varchar(10) NOT NULL,
    uri_path       nvarchar(500) NOT NULL,
    status_code    int NOT NULL,
    elapsed_ms     int NOT NULL,
    request_bytes  int NOT NULL,
    response_bytes int NOT NULL,
    raw_line       nvarchar(max) NOT NULL
);

CREATE TABLE company_ops.batch_job_history
(
    id             bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_batch_job_history PRIMARY KEY,
    started_at     datetime2(0) NOT NULL,
    finished_at    datetime2(0) NOT NULL,
    job_name       nvarchar(120) NOT NULL,
    job_status     nvarchar(30) NOT NULL,
    processed_rows int NOT NULL,
    summary        nvarchar(max) NOT NULL
);

CREATE TABLE company_ops.system_metrics
(
    id              bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_system_metrics PRIMARY KEY,
    measured_at     datetime2(0) NOT NULL,
    host_name       nvarchar(80) NOT NULL,
    cpu_percent     decimal(5,2) NOT NULL,
    memory_percent  decimal(5,2) NOT NULL,
    disk_queue      decimal(8,2) NOT NULL,
    metric_payload  nvarchar(max) NOT NULL
);

CREATE TABLE company_archive.email_messages
(
    id             bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_email_messages PRIMARY KEY,
    sent_at        datetime2(0) NOT NULL,
    mailbox        nvarchar(120) NOT NULL,
    sender_address nvarchar(200) NOT NULL,
    recipient      nvarchar(200) NOT NULL,
    subject        nvarchar(300) NOT NULL,
    body           nvarchar(max) NOT NULL,
    attachment_count int NOT NULL,
    retention_tag  nvarchar(80) NOT NULL
);

CREATE TABLE company_archive.document_repository
(
    id              bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_document_repository PRIMARY KEY,
    created_at      datetime2(0) NOT NULL,
    customer_id     int NULL,
    document_type   nvarchar(80) NOT NULL,
    file_name       nvarchar(260) NOT NULL,
    owner_department nvarchar(80) NOT NULL,
    content_sha256  varbinary(32) NOT NULL,
    content_blob    varbinary(max) NOT NULL
);

CREATE TABLE company_finance.invoice_archive
(
    id             bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_invoice_archive PRIMARY KEY,
    issued_at      datetime2(0) NOT NULL,
    customer_id    int NULL,
    invoice_no     nvarchar(40) NOT NULL,
    amount         decimal(18,2) NOT NULL,
    payment_status nvarchar(30) NOT NULL,
    invoice_body   nvarchar(max) NOT NULL
);

CREATE TABLE company_security.endpoint_events
(
    id             bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_endpoint_events PRIMARY KEY,
    detected_at    datetime2(0) NOT NULL,
    host_name      nvarchar(80) NOT NULL,
    user_name      nvarchar(80) NOT NULL,
    event_type     nvarchar(80) NOT NULL,
    severity       nvarchar(20) NOT NULL,
    process_name   nvarchar(260) NOT NULL,
    command_line   nvarchar(1000) NOT NULL,
    raw_event      nvarchar(max) NOT NULL
);

CREATE TABLE company_security.network_flow_logs
(
    id             bigint IDENTITY(1,1) NOT NULL CONSTRAINT PK_network_flow_logs PRIMARY KEY,
    observed_at    datetime2(0) NOT NULL,
    src_ip         varchar(45) NOT NULL,
    dst_ip         varchar(45) NOT NULL,
    dst_port       int NOT NULL,
    protocol_name  varchar(10) NOT NULL,
    bytes_sent     bigint NOT NULL,
    bytes_received bigint NOT NULL,
    flow_record    nvarchar(max) NOT NULL
);

EnsureEnterpriseIndexes:

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_crm_application_logs_occurred_at' AND object_id = OBJECT_ID(N'company_ops.crm_application_logs'))
    CREATE INDEX IX_crm_application_logs_occurred_at ON company_ops.crm_application_logs(occurred_at);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_web_access_logs_accessed_at' AND object_id = OBJECT_ID(N'company_ops.web_access_logs'))
    CREATE INDEX IX_web_access_logs_accessed_at ON company_ops.web_access_logs(accessed_at);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_email_messages_sent_at' AND object_id = OBJECT_ID(N'company_archive.email_messages'))
    CREATE INDEX IX_email_messages_sent_at ON company_archive.email_messages(sent_at);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_document_repository_customer_id' AND object_id = OBJECT_ID(N'company_archive.document_repository'))
    CREATE INDEX IX_document_repository_customer_id ON company_archive.document_repository(customer_id);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_endpoint_events_detected_at' AND object_id = OBJECT_ID(N'company_security.endpoint_events'))
    CREATE INDEX IX_endpoint_events_detected_at ON company_security.endpoint_events(detected_at);
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = N'IX_network_flow_logs_observed_at' AND object_id = OBJECT_ID(N'company_security.network_flow_logs'))
    CREATE INDEX IX_network_flow_logs_observed_at ON company_security.network_flow_logs(observed_at);

DECLARE @ScenarioStart datetime2(0) = CONVERT(datetime2(0), '2020-02-03T08:00:00');
DECLARE @ScenarioSeconds int = DATEDIFF(second, @ScenarioStart, CONVERT(datetime2(0), '2022-05-29T23:59:59'));
DECLARE @TargetBytes bigint = CONVERT(bigint, @TargetGb) * 1073741824;
DECLARE @CurrentBytes bigint = 0;
DECLARE @Loop int = 0;
DECLARE @CustomerCount int = ISNULL((SELECT COUNT(*) FROM dbo.customers), 0);

DECLARE @DocumentPayload nvarchar(max) = REPLICATE(N'연수 결혼정보회사 고객 상담 신청서, 신원확인자료, 상담 메모, 계약서, 개인정보 동의서, 매칭 평가자료, 내부 검토 의견. ', 420);
DECLARE @EmailBody nvarchar(max) = REPLICATE(N'상담 일정 조율, 고객 확인 요청, 계약 진행 상황, 내부 승인 요청, 매칭 후보 검토 의견, 재상담 안내. ', 220);
DECLARE @ApplicationPayload nvarchar(max) = REPLICATE(N'CRM 업무 처리 이벤트, 상담사 활동, 고객 조회, 문서 다운로드, 자료 첨부, 관리자 확인, 권한 검토. ', 120);
DECLARE @SecurityPayload nvarchar(max) = REPLICATE(N'보안 관제 이벤트 원문, 프로세스 실행 정보, 네트워크 연결, 파일 생성, 계정 활동, 정책 검사 결과. ', 170);
DECLARE @MetricPayload nvarchar(max) = REPLICATE(N'서버 성능 지표, 디스크 사용량, 메모리 사용량, SQL 대기 이벤트, 백업 상태, 배치 처리 상태. ', 80);

DECLARE @DocumentBatch int = 700;
DECLARE @EmailBatch int = 600;
DECLARE @LogBatch int = 1000;
DECLARE @SecurityBatch int = 900;
DECLARE @FlowBatch int = 900;
DECLARE @MetricBatch int = 500;

DECLARE @Progress table
(
    measured_at datetime2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
    reserved_gb decimal(18,2) NOT NULL
);

WHILE @CurrentBytes < @TargetBytes
BEGIN
    DECLARE @Base bigint = @Loop * 1000000;

    ;WITH n AS
    (
        SELECT TOP (@LogBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_ops.crm_application_logs
        (occurred_at, log_level, source_service, actor, source_ip, request_path, message, payload)
    SELECT
        DATEADD(second, ((@Base + rn) * 7919) % @ScenarioSeconds, @ScenarioStart),
        CHOOSE((rn % 5) + 1, N'INFO', N'INFO', N'INFO', N'WARN', N'ERROR'),
        CHOOSE((rn % 6) + 1, N'crm-web', N'crm-api', N'batch-worker', N'document-service', N'auth-service', N'export-service'),
        CONCAT(N'employee', RIGHT(CONCAT(N'000', rn % 220), 3)),
        CONCAT('10.10.', 20 + (rn % 30), '.', 10 + (rn % 210)),
        CHOOSE((rn % 7) + 1, N'/dashboard', N'/customers', N'/attachments', N'/reports', N'/admin', N'/login', N'/customers/export'),
        CONCAT(N'업무 이벤트 처리 완료 - 추적번호 ', @Base + rn),
        CONCAT(@ApplicationPayload, N' TraceId=', CONVERT(nvarchar(30), @Base + rn))
    FROM n;

    ;WITH n AS
    (
        SELECT TOP (@LogBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_ops.web_access_logs
        (accessed_at, source_ip, user_agent, method, uri_path, status_code, elapsed_ms, request_bytes, response_bytes, raw_line)
    SELECT
        DATEADD(second, ((@Base + rn) * 6151) % @ScenarioSeconds, @ScenarioStart),
        CONCAT('10.10.', 20 + (rn % 30), '.', 20 + (rn % 200)),
        CHOOSE((rn % 4) + 1, N'Mozilla/5.0 Windows', N'Mozilla/5.0 Chrome', N'Edge/120.0', N'InternalBatchClient/1.0'),
        CHOOSE((rn % 4) + 1, 'GET', 'POST', 'GET', 'PUT'),
        CHOOSE((rn % 8) + 1, N'/dashboard', N'/customers', N'/customers/detail', N'/attachments', N'/reports', N'/reports/export', N'/admin', N'/static/site.css'),
        CHOOSE((rn % 12) + 1, 200, 200, 200, 200, 200, 302, 304, 400, 401, 403, 404, 500),
        20 + (rn % 2500),
        300 + (rn % 9000),
        800 + (rn % 180000),
        CONCAT(N'web-access ', @ApplicationPayload, N' request=', CONVERT(nvarchar(30), @Base + rn))
    FROM n;

    ;WITH n AS
    (
        SELECT TOP (@EmailBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_archive.email_messages
        (sent_at, mailbox, sender_address, recipient, subject, body, attachment_count, retention_tag)
    SELECT
        DATEADD(second, ((@Base + rn) * 3571) % @ScenarioSeconds, @ScenarioStart),
        CONCAT(N'counselor', RIGHT(CONCAT(N'000', rn % 80), 3), N'@yeonsu.co.kr'),
        CONCAT(N'employee', RIGHT(CONCAT(N'000', rn % 220), 3), N'@yeonsu.co.kr'),
        CONCAT(N'customer', RIGHT(CONCAT(N'000000', rn % 2000), 6), N'@example.com'),
        CONCAT(N'[연수] 상담/매칭 업무 메일 ', @Base + rn),
        CONCAT(@EmailBody, N' MailRef=', CONVERT(nvarchar(30), @Base + rn)),
        rn % 4,
        CHOOSE((rn % 4) + 1, N'상담', N'계약', N'회계', N'보관')
    FROM n;

    ;WITH n AS
    (
        SELECT TOP (@DocumentBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_archive.document_repository
        (created_at, customer_id, document_type, file_name, owner_department, content_sha256, content_blob)
    SELECT
        DATEADD(second, ((@Base + rn) * 4297) % @ScenarioSeconds, @ScenarioStart),
        CASE WHEN @CustomerCount = 0 THEN NULL ELSE ((rn - 1) % @CustomerCount) + 1 END,
        CHOOSE((rn % 6) + 1, N'상담신청서', N'신원확인자료', N'계약서', N'개인정보동의서', N'매칭평가서', N'내부검토자료'),
        CONCAT(N'YS-', RIGHT(CONCAT(N'00000000', CONVERT(nvarchar(20), (@Base + rn) % 99999999)), 8), N'-document.pdf'),
        CHOOSE((rn % 5) + 1, N'고객관리팀', N'상담운영팀', N'매칭관리팀', N'계약관리팀', N'보안관리팀'),
        HASHBYTES('SHA2_256', CONVERT(varbinary(max), CONCAT(@DocumentPayload, N'/', @Base + rn))),
        CONVERT(varbinary(max), CONCAT(@DocumentPayload, N' 문서일련번호=', CONVERT(nvarchar(30), @Base + rn)))
    FROM n;

    ;WITH n AS
    (
        SELECT TOP (@EmailBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_finance.invoice_archive
        (issued_at, customer_id, invoice_no, amount, payment_status, invoice_body)
    SELECT
        DATEADD(second, ((@Base + rn) * 5227) % @ScenarioSeconds, @ScenarioStart),
        CASE WHEN @CustomerCount = 0 THEN NULL ELSE ((rn - 1) % @CustomerCount) + 1 END,
        CONCAT(N'INV-', RIGHT(CONCAT(N'00000000', CONVERT(nvarchar(20), (@Base + rn) % 99999999)), 8)),
        CONVERT(decimal(18,2), 300000 + ((rn % 120) * 50000)),
        CHOOSE((rn % 4) + 1, N'결제완료', N'청구', N'부분결제', N'환불검토'),
        CONCAT(@EmailBody, N' 청구서번호=', CONVERT(nvarchar(30), @Base + rn))
    FROM n;

    ;WITH n AS
    (
        SELECT TOP (@SecurityBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_security.endpoint_events
        (detected_at, host_name, user_name, event_type, severity, process_name, command_line, raw_event)
    SELECT
        DATEADD(second, ((@Base + rn) * 6899) % @ScenarioSeconds, @ScenarioStart),
        CONCAT(N'VM', rn % 9, N'-HOST-', RIGHT(CONCAT(N'000', rn % 300), 3)),
        CONCAT(N'employee', RIGHT(CONCAT(N'000', rn % 220), 3)),
        CHOOSE((rn % 7) + 1, N'프로세스 실행', N'파일 생성', N'로그온', N'네트워크 연결', N'정책 변경', N'문서 열람', N'권한 확인'),
        CHOOSE((rn % 5) + 1, N'낮음', N'정보', N'주의', N'높음', N'중요'),
        CHOOSE((rn % 6) + 1, N'WINWORD.EXE', N'chrome.exe', N'w3wp.exe', N'sqlservr.exe', N'powershell.exe', N'explorer.exe'),
        CONCAT(N'process activity command line sample --event ', @Base + rn),
        CONCAT(@SecurityPayload, N' EventId=', CONVERT(nvarchar(30), @Base + rn))
    FROM n;

    ;WITH n AS
    (
        SELECT TOP (@FlowBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_security.network_flow_logs
        (observed_at, src_ip, dst_ip, dst_port, protocol_name, bytes_sent, bytes_received, flow_record)
    SELECT
        DATEADD(second, ((@Base + rn) * 7547) % @ScenarioSeconds, @ScenarioStart),
        CONCAT('10.10.', 20 + (rn % 30), '.', 10 + (rn % 210)),
        CONCAT('10.10.', 30 + (rn % 20), '.', 10 + ((rn * 7) % 210)),
        CHOOSE((rn % 6) + 1, 80, 443, 1433, 445, 3389, 1514),
        CHOOSE((rn % 3) + 1, 'TCP', 'UDP', 'TCP'),
        500 + ((@Base + rn) % 5000000),
        700 + ((@Base + rn) % 9000000),
        CONCAT(@SecurityPayload, N' FlowId=', CONVERT(nvarchar(30), @Base + rn))
    FROM n;

    ;WITH n AS
    (
        SELECT TOP (@MetricBatch) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
        FROM sys.all_objects a CROSS JOIN sys.all_objects b
    )
    INSERT INTO company_ops.system_metrics
        (measured_at, host_name, cpu_percent, memory_percent, disk_queue, metric_payload)
    SELECT
        DATEADD(second, ((@Base + rn) * 8161) % @ScenarioSeconds, @ScenarioStart),
        CONCAT(N'YS-SRV-', RIGHT(CONCAT(N'00', rn % 60), 2)),
        CONVERT(decimal(5,2), 10 + (rn % 85)),
        CONVERT(decimal(5,2), 25 + (rn % 70)),
        CONVERT(decimal(8,2), (rn % 300) / 10.0),
        CONCAT(@MetricPayload, N' MetricId=', CONVERT(nvarchar(30), @Base + rn))
    FROM n;

    SET @Loop += 1;

    IF @Loop % 5 = 0
    BEGIN
        SELECT @CurrentBytes = ISNULL(SUM(reserved_page_count) * 8192, 0)
        FROM sys.dm_db_partition_stats p
        JOIN sys.tables t ON p.object_id = t.object_id
        JOIN sys.schemas s ON t.schema_id = s.schema_id
        WHERE s.name IN (N'company_ops', N'company_archive', N'company_security', N'company_finance');

        INSERT INTO @Progress(reserved_gb)
        VALUES (CONVERT(decimal(18,2), @CurrentBytes / 1073741824.0));

        DECLARE @ProgressMessage nvarchar(200) =
            CONCAT(N'Generated enterprise dummy data: ', CONVERT(nvarchar(30), CONVERT(decimal(18,2), @CurrentBytes / 1073741824.0)), N' GB / ', @TargetGb, N' GB');
        RAISERROR(N'%s', 0, 1, @ProgressMessage) WITH NOWAIT;
    END;
END;

SELECT @CurrentBytes = ISNULL(SUM(reserved_page_count) * 8192, 0)
FROM sys.dm_db_partition_stats p
JOIN sys.tables t ON p.object_id = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name IN (N'company_ops', N'company_archive', N'company_security', N'company_finance');

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
ORDER BY reserved_gb DESC, schema_name, table_name;

SELECT
    @TargetGb AS requested_target_gb,
    CONVERT(decimal(18,2), @CurrentBytes / 1073741824.0) AS generated_reserved_gb,
    DB_NAME() AS database_name;
