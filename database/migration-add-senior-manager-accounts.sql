/*
  Add senior counselor and manager roles/accounts.

  Run on VM8:
    sqlcmd -S localhost -U sa -C -b -d master -i migration-add-senior-manager-accounts.sql

  Default lab credentials:
    seo.eunji      / Eunji.Seo@CRM26!      SeniorCounselor
    baek.junho     / Junho.Baek@CRM26!     SeniorCounselor
    moon.sora      / Sora.Moon@CRM26!      SeniorCounselor
    shin.yujin     / Yujin.Shin@CRM26!     Counselor
    kwon.taehyun   / Taehyun.Kwon@CRM26!   Counselor
    jang.mirae     / Mirae.Jang@CRM26!     Counselor
    manager.cho    / Cho.Manager@CRM26!    Manager
*/

USE MarriageCrm;
GO

IF OBJECT_ID(N'dbo.app_users', N'U') IS NULL
BEGIN
    THROW 51000, 'dbo.app_users does not exist. Run migration-add-app-users.sql first.', 1;
END;
GO

DECLARE @constraintName sysname;

SELECT @constraintName = cc.name
FROM sys.check_constraints cc
JOIN sys.tables t ON t.object_id = cc.parent_object_id
JOIN sys.schemas s ON s.schema_id = t.schema_id
WHERE s.name = N'dbo'
  AND t.name = N'app_users'
  AND cc.name = N'CK_app_users_role';

IF @constraintName IS NOT NULL
BEGIN
    ALTER TABLE dbo.app_users DROP CONSTRAINT CK_app_users_role;
END;

ALTER TABLE dbo.app_users WITH CHECK
    ADD CONSTRAINT CK_app_users_role
    CHECK (role IN (N'Counselor', N'SeniorCounselor', N'Manager', N'Admin'));
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'seo.eunji')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'seo.eunji', N'서은지', N'SeniorCounselor', N'고객상담1팀', 0x0569489A78B9642042C922EE5ACFA1D6, 0xD148B97FD5B48CF2781DC94E453568C1D0EB7087101132BBD081B155C83F48AB, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'baek.junho')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'baek.junho', N'백준호', N'SeniorCounselor', N'고객상담2팀', 0x66FE6B942A9D9F63795C4F36561012F9, 0x58C990AD5031B9EFDDD717CEC411F097F937067669CA5555CA757E542651B2D7, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'moon.sora')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'moon.sora', N'문소라', N'SeniorCounselor', N'고객상담3팀', 0xB8FE30B5F12AD9A7B13642344A6CE6A7, 0x131033309F23EDB4243BB1E79B73703798FB4967ED165FAF499C890EE28D4318, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'shin.yujin')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'shin.yujin', N'신유진', N'Counselor', N'고객상담1팀', 0xFDA8F43F92FC9912247CBB7E23291025, 0x60890183806EC4B351B41BF753C4F31EA7AE4A85CCA06F7AD4E2BF710A553AB1, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'kwon.taehyun')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'kwon.taehyun', N'권태현', N'Counselor', N'고객상담2팀', 0xB82FD0FC2EFB25AEB7CC566066CEF471, 0xC11C7657BAE4D43199444FAE9D414C7527C540EEED95D7BE1E372C660582CC6A, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'jang.mirae')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'jang.mirae', N'장미래', N'Counselor', N'고객상담3팀', 0x1F9793FC8E85D3CD36A4F29E9F30B16E, 0x9F728245F15B3CF5A09F52C7A7C7B72F99E3D4B0981C713C66D4A3E5FDF90DC8, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'manager.cho')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'manager.cho', N'조현우', N'Manager', N'상담운영부', 0xBE9D4987EA3BE35A50F61AA9DCCB4CC6, 0x68ED9910D7DDD00635CD09EDF5C0CFCFE832745C487C8F5D061A3EA87FB1CE5E, 100000, 1);
GO

SELECT username, display_name, role, department, is_active
FROM dbo.app_users
ORDER BY
    CASE role
        WHEN N'Admin' THEN 1
        WHEN N'Manager' THEN 2
        WHEN N'SeniorCounselor' THEN 3
        ELSE 4
    END,
    username;
GO
