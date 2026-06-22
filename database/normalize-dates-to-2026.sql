/*
  Yeonsu CRM date normalization script.
  Rewrites scenario record timestamps to the 2026-06-01 through 2026-06-22 window.
  Lower identity values are placed earlier in the window.
*/

SET NOCOUNT ON;
SET XACT_ABORT ON;

IF DB_NAME() <> N'MarriageCrm'
BEGIN
    THROW 52000, 'Run this script against the MarriageCrm database.', 1;
END;

DECLARE @TimelineStart datetime2(0) = CONVERT(datetime2(0), '2026-06-01T08:00:00');
DECLARE @TimelineEnd datetime2(0) = CONVERT(datetime2(0), '2026-06-22T23:59:59');
DECLARE @TimelineSeconds bigint = DATEDIFF(second, @TimelineStart, @TimelineEnd);

IF OBJECT_ID(N'dbo.company_profile', N'U') IS NOT NULL
BEGIN
    UPDATE dbo.company_profile
    SET founded_date = CONVERT(date, @TimelineStart);
END;

IF OBJECT_ID(N'dbo.security_incidents', N'U') IS NOT NULL
BEGIN
    UPDATE dbo.security_incidents
    SET
        occurred_at = CONVERT(datetime2(0), '2026-06-22T09:00:00'),
        discovered_at = CONVERT(datetime2(0), '2026-06-22T09:00:00'),
        confirmed_at = CONVERT(datetime2(0), '2026-06-22T11:00:00');
END;

IF OBJECT_ID(N'dbo.customers', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM dbo.customers
    )
    UPDATE target
    SET created_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM dbo.customers AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'dbo.customer_portal_accounts', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY customer_id, id) AS rn, COUNT(*) OVER () AS total_count
        FROM dbo.customer_portal_accounts
    )
    UPDATE target
    SET created_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM dbo.customer_portal_accounts AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'dbo.consulting_notes', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM dbo.consulting_notes
    )
    UPDATE target
    SET consulted_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM dbo.consulting_notes AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'dbo.contracts', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM dbo.contracts
    ),
    normalized AS
    (
        SELECT
            id,
            DATEADD(second, CASE WHEN total_count <= 1 THEN 0 ELSE ((rn - 1) * @TimelineSeconds) / (total_count - 1) END, @TimelineStart) AS normalized_at
        FROM ordered
    )
    UPDATE target
    SET
        contract_date = CONVERT(date, normalized.normalized_at),
        end_date = CASE
            WHEN target.end_date IS NULL THEN NULL
            WHEN DATEADD(day, 1 + (target.id % 5), normalized.normalized_at) > @TimelineEnd THEN CONVERT(date, @TimelineEnd)
            ELSE CONVERT(date, DATEADD(day, 1 + (target.id % 5), normalized.normalized_at))
        END
    FROM dbo.contracts AS target
    JOIN normalized ON normalized.id = target.id;
END;

IF OBJECT_ID(N'dbo.matching_history', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM dbo.matching_history
    )
    UPDATE target
    SET matched_at = CONVERT(date, DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart))
    FROM dbo.matching_history AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'dbo.uploaded_files', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM dbo.uploaded_files
    )
    UPDATE target
    SET uploaded_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM dbo.uploaded_files AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'dbo.app_users', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM dbo.app_users
    ),
    normalized AS
    (
        SELECT
            id,
            DATEADD(second, CASE WHEN total_count <= 1 THEN 0 ELSE ((rn - 1) * @TimelineSeconds) / (total_count - 1) END, @TimelineStart) AS normalized_at
        FROM ordered
    )
    UPDATE target
    SET
        created_at = normalized.normalized_at,
        password_changed_at = normalized.normalized_at,
        last_login_at = CASE WHEN target.last_login_at IS NULL THEN NULL ELSE IIF(DATEADD(hour, 1, normalized.normalized_at) > @TimelineEnd, @TimelineEnd, DATEADD(hour, 1, normalized.normalized_at)) END,
        last_failed_login_at = CASE WHEN target.last_failed_login_at IS NULL THEN NULL ELSE IIF(DATEADD(minute, 30, normalized.normalized_at) > @TimelineEnd, @TimelineEnd, DATEADD(minute, 30, normalized.normalized_at)) END
    FROM dbo.app_users AS target
    JOIN normalized ON normalized.id = target.id;
END;

IF OBJECT_ID(N'company_ops.employee_workstations', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_ops.employee_workstations
    )
    UPDATE target
    SET assigned_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_ops.employee_workstations AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_ops.crm_application_logs', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_ops.crm_application_logs
    )
    UPDATE target
    SET occurred_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_ops.crm_application_logs AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_ops.web_access_logs', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_ops.web_access_logs
    )
    UPDATE target
    SET accessed_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_ops.web_access_logs AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_ops.batch_job_history', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_ops.batch_job_history
    ),
    normalized AS
    (
        SELECT id, DATEADD(second, CASE WHEN total_count <= 1 THEN 0 ELSE ((rn - 1) * @TimelineSeconds) / (total_count - 1) END, @TimelineStart) AS normalized_at
        FROM ordered
    )
    UPDATE target
    SET
        started_at = normalized.normalized_at,
        finished_at = IIF(DATEADD(minute, 5 + (target.id % 30), normalized.normalized_at) > @TimelineEnd, @TimelineEnd, DATEADD(minute, 5 + (target.id % 30), normalized.normalized_at))
    FROM company_ops.batch_job_history AS target
    JOIN normalized ON normalized.id = target.id;
END;

IF OBJECT_ID(N'company_ops.system_metrics', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_ops.system_metrics
    )
    UPDATE target
    SET measured_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_ops.system_metrics AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_archive.email_messages', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_archive.email_messages
    )
    UPDATE target
    SET sent_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_archive.email_messages AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_archive.document_repository', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_archive.document_repository
    )
    UPDATE target
    SET created_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_archive.document_repository AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_finance.invoice_archive', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_finance.invoice_archive
    )
    UPDATE target
    SET issued_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_finance.invoice_archive AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_security.endpoint_events', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_security.endpoint_events
    )
    UPDATE target
    SET detected_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_security.endpoint_events AS target
    JOIN ordered ON ordered.id = target.id;
END;

IF OBJECT_ID(N'company_security.network_flow_logs', N'U') IS NOT NULL
BEGIN
    ;WITH ordered AS
    (
        SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn, COUNT(*) OVER () AS total_count
        FROM company_security.network_flow_logs
    )
    UPDATE target
    SET observed_at = DATEADD(second, CASE WHEN ordered.total_count <= 1 THEN 0 ELSE ((ordered.rn - 1) * @TimelineSeconds) / (ordered.total_count - 1) END, @TimelineStart)
    FROM company_security.network_flow_logs AS target
    JOIN ordered ON ordered.id = target.id;
END;

SELECT N'dbo.customers.created_at' AS date_field, MIN(created_at) AS min_value, MAX(created_at) AS max_value, COUNT(*) AS row_count FROM dbo.customers
UNION ALL SELECT N'dbo.consulting_notes.consulted_at', MIN(consulted_at), MAX(consulted_at), COUNT(*) FROM dbo.consulting_notes
UNION ALL SELECT N'dbo.uploaded_files.uploaded_at', MIN(uploaded_at), MAX(uploaded_at), COUNT(*) FROM dbo.uploaded_files
UNION ALL SELECT N'dbo.app_users.created_at', MIN(created_at), MAX(created_at), COUNT(*) FROM dbo.app_users;

IF OBJECT_ID(N'company_ops.crm_application_logs', N'U') IS NOT NULL
BEGIN
    SELECT N'company_ops.crm_application_logs.occurred_at' AS date_field, MIN(occurred_at) AS min_value, MAX(occurred_at) AS max_value, COUNT(*) AS row_count FROM company_ops.crm_application_logs
    UNION ALL SELECT N'company_ops.web_access_logs.accessed_at', MIN(accessed_at), MAX(accessed_at), COUNT(*) FROM company_ops.web_access_logs
    UNION ALL SELECT N'company_archive.email_messages.sent_at', MIN(sent_at), MAX(sent_at), COUNT(*) FROM company_archive.email_messages
    UNION ALL SELECT N'company_security.network_flow_logs.observed_at', MIN(observed_at), MAX(observed_at), COUNT(*) FROM company_security.network_flow_logs;
END;
