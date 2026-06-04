SET NOCOUNT ON;

SELECT
    @@SERVERNAME AS server_name,
    CAST(SERVERPROPERTY('ProductVersion') AS nvarchar(100)) AS product_version,
    CAST(SERVERPROPERTY('Edition') AS nvarchar(100)) AS edition;

USE MarriageCrm;

SELECT N'customers' AS table_name, COUNT(*) AS row_count FROM dbo.customers
UNION ALL SELECT N'consulting_notes', COUNT(*) FROM dbo.consulting_notes
UNION ALL SELECT N'contracts', COUNT(*) FROM dbo.contracts
UNION ALL SELECT N'matching_history', COUNT(*) FROM dbo.matching_history
UNION ALL SELECT N'uploaded_files', COUNT(*) FROM dbo.uploaded_files
UNION ALL SELECT N'app_users', COUNT(*) FROM dbo.app_users;

SELECT
    COUNT(*) AS enriched_customer_count,
    SUM(CASE WHEN customer_grade = N'S' THEN 1 ELSE 0 END) AS grade_s_count,
    SUM(CASE WHEN customer_grade = N'A' THEN 1 ELSE 0 END) AS grade_a_count,
    SUM(CASE WHEN customer_grade = N'B' THEN 1 ELSE 0 END) AS grade_b_count,
    SUM(CASE WHEN gender = N'남성' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = N'여성' THEN 1 ELSE 0 END) AS female_count
FROM dbo.customers
WHERE company_name <> N'비공개'
  AND asset_summary <> N'예금 및 적금 보유'
  AND past_history <> N'특이 과거 이력 없음';

SELECT
    username,
    display_name,
    role,
    department,
    is_active,
    last_login_at,
    failed_login_count
FROM dbo.app_users
ORDER BY role, username;

SELECT
    dp.name AS database_user,
    dp.type_desc,
    perm.state_desc,
    perm.permission_name,
    perm.class_desc,
    CASE
        WHEN perm.class_desc = N'OBJECT_OR_COLUMN'
            THEN OBJECT_SCHEMA_NAME(perm.major_id) + N'.' + OBJECT_NAME(perm.major_id)
        WHEN perm.class_desc = N'SCHEMA'
            THEN SCHEMA_NAME(perm.major_id)
        ELSE N'-'
    END AS securable
FROM sys.database_principals AS dp
LEFT JOIN sys.database_permissions AS perm
    ON perm.grantee_principal_id = dp.principal_id
WHERE dp.name = N'crm_app'
ORDER BY perm.permission_name;

USE master;

SELECT
    name,
    status_desc,
    audit_file_path
FROM sys.dm_server_audit_status
WHERE name = N'MarriageCrm_Audit';
