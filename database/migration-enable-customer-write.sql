/*
  Allow the CRM application account to create and update customer records.

  Run on VM8:
    sqlcmd -S localhost -U sa -C -b -d master -i migration-enable-customer-write.sql
*/

USE MarriageCrm;
GO

GRANT INSERT, UPDATE ON dbo.customers TO crm_app;
GO

SELECT
    pr.name AS principal_name,
    pe.permission_name,
    OBJECT_SCHEMA_NAME(pe.major_id) + N'.' + OBJECT_NAME(pe.major_id) AS object_name
FROM sys.database_permissions pe
JOIN sys.database_principals pr ON pr.principal_id = pe.grantee_principal_id
WHERE pr.name = N'crm_app'
  AND pe.major_id = OBJECT_ID(N'dbo.customers')
ORDER BY pe.permission_name;
GO
