/*
  SQL Server Audit configuration for the Marriage CRM lab.
  Before running this script on VM8:
    sudo mkdir -p /var/opt/mssql/audit
    sudo chown mssql:mssql /var/opt/mssql/audit
    sudo chmod 750 /var/opt/mssql/audit
*/

USE MarriageCrm;
GO

IF EXISTS (SELECT 1 FROM sys.database_audit_specifications WHERE name = N'MarriageCrm_Database_Audit_Spec')
BEGIN
    ALTER DATABASE AUDIT SPECIFICATION MarriageCrm_Database_Audit_Spec WITH (STATE = OFF);
    DROP DATABASE AUDIT SPECIFICATION MarriageCrm_Database_Audit_Spec;
END;
GO

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.server_audit_specifications WHERE name = N'MarriageCrm_Server_Audit_Spec')
BEGIN
    ALTER SERVER AUDIT SPECIFICATION MarriageCrm_Server_Audit_Spec WITH (STATE = OFF);
    DROP SERVER AUDIT SPECIFICATION MarriageCrm_Server_Audit_Spec;
END;
GO

IF EXISTS (SELECT 1 FROM sys.server_audits WHERE name = N'MarriageCrm_Audit')
BEGIN
    ALTER SERVER AUDIT MarriageCrm_Audit WITH (STATE = OFF);
    DROP SERVER AUDIT MarriageCrm_Audit;
END;
GO

CREATE SERVER AUDIT MarriageCrm_Audit
TO FILE
(
    FILEPATH = N'/var/opt/mssql/audit/',
    MAXSIZE = 100 MB,
    MAX_ROLLOVER_FILES = 20,
    RESERVE_DISK_SPACE = OFF
)
WITH
(
    QUEUE_DELAY = 1000,
    ON_FAILURE = CONTINUE
);
GO

ALTER SERVER AUDIT MarriageCrm_Audit WITH (STATE = ON);
GO

CREATE SERVER AUDIT SPECIFICATION MarriageCrm_Server_Audit_Spec
FOR SERVER AUDIT MarriageCrm_Audit
    ADD (FAILED_LOGIN_GROUP),
    ADD (SUCCESSFUL_LOGIN_GROUP),
    ADD (LOGOUT_GROUP)
WITH (STATE = ON);
GO

USE MarriageCrm;
GO

CREATE DATABASE AUDIT SPECIFICATION MarriageCrm_Database_Audit_Spec
FOR SERVER AUDIT MarriageCrm_Audit
    ADD (SELECT ON SCHEMA::dbo BY public),
    ADD (INSERT ON SCHEMA::dbo BY public),
    ADD (UPDATE ON SCHEMA::dbo BY public),
    ADD (DELETE ON SCHEMA::dbo BY public)
WITH (STATE = ON);
GO
