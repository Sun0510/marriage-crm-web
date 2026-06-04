/*
  Add fictional gender information to existing MarriageCrm customers.

  Run on VM8:
    sqlcmd -S localhost -U sa -C -b -d master -i migration-add-gender.sql
*/

USE MarriageCrm;
GO

IF COL_LENGTH(N'dbo.customers', N'gender') IS NULL
BEGIN
    ALTER TABLE dbo.customers
        ADD gender nvarchar(10) NOT NULL
            CONSTRAINT DF_customers_gender DEFAULT N'비공개' WITH VALUES;
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_customers_gender')
BEGIN
    ALTER TABLE dbo.customers WITH CHECK
        ADD CONSTRAINT CK_customers_gender CHECK (gender IN (N'남성', N'여성', N'비공개'));
END;
GO

;WITH numbered AS
(
    SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn
    FROM dbo.customers
)
UPDATE c
SET gender = CASE WHEN n.rn % 2 = 0 THEN N'남성' ELSE N'여성' END
FROM dbo.customers c
JOIN numbered n ON n.id = c.id
WHERE c.gender = N'비공개'
   OR c.gender IS NULL;
GO

SELECT
    COUNT(*) AS customer_count,
    SUM(CASE WHEN gender = N'남성' THEN 1 ELSE 0 END) AS male_count,
    SUM(CASE WHEN gender = N'여성' THEN 1 ELSE 0 END) AS female_count,
    SUM(CASE WHEN gender = N'비공개' THEN 1 ELSE 0 END) AS undisclosed_count
FROM dbo.customers;
GO
