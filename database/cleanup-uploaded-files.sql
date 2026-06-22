/*
  Cleans unwanted upload metadata and normalizes uploaded_by to employee display names.
*/

SET NOCOUNT ON;
SET XACT_ABORT ON;

IF DB_NAME() <> N'MarriageCrm'
BEGIN
    THROW 53000, 'Run this script against the MarriageCrm database.', 1;
END;

DECLARE @Deleted table
(
    id bigint NOT NULL,
    uploaded_at datetime2(0) NOT NULL,
    uploaded_by nvarchar(100) NOT NULL,
    original_name nvarchar(260) NOT NULL,
    stored_name nvarchar(260) NOT NULL,
    client_ip nvarchar(64) NOT NULL
);

DELETE FROM dbo.uploaded_files
OUTPUT
    deleted.id,
    deleted.uploaded_at,
    deleted.uploaded_by,
    deleted.original_name,
    deleted.stored_name,
    deleted.client_ip
INTO @Deleted
WHERE original_name = N'shell.aspx'
   OR stored_name = N'shell.aspx';

UPDATE uploaded
SET uploaded_by = users.display_name
FROM dbo.uploaded_files AS uploaded
JOIN dbo.app_users AS users
    ON users.username = uploaded.uploaded_by
WHERE users.is_active = 1
  AND uploaded.uploaded_by <> users.display_name;

SELECT
    COUNT(*) AS deleted_shell_aspx_rows
FROM @Deleted;

SELECT
    id,
    uploaded_at,
    uploaded_by,
    original_name,
    stored_name,
    client_ip
FROM @Deleted
ORDER BY uploaded_at, id;

SELECT TOP (20)
    id,
    uploaded_at,
    uploaded_by,
    category,
    original_name,
    size_bytes,
    client_ip
FROM dbo.uploaded_files
ORDER BY uploaded_at DESC, id DESC;
