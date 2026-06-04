/*
  View recent Marriage CRM audit records.
  Run as an administrative account.
*/

SELECT TOP (200)
    CONVERT(nvarchar(33), event_time, 126) AS event_time,
    CONVERT(nvarchar(8), action_id) AS action_id,
    succeeded,
    CONVERT(nvarchar(128), session_server_principal_name) AS session_principal,
    CONVERT(nvarchar(128), database_name) AS database_name,
    CONVERT(nvarchar(128), schema_name) AS schema_name,
    CONVERT(nvarchar(128), object_name) AS object_name,
    CONVERT(nvarchar(1000), statement) AS statement,
    CONVERT(nvarchar(64), client_ip) AS client_ip
FROM sys.fn_get_audit_file(N'/var/opt/mssql/audit/*.sqlaudit', DEFAULT, DEFAULT)
ORDER BY event_time DESC;
