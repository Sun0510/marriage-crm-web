/*
  Move CRM employee accounts into the MarriageCrm database.

  Default lab credentials:
    kim.hana      / Hana.Kim@CRM26!
    lee.doyoon    / Doyoon.Lee@CRM26!
    park.seoyeon  / Seoyeon.Park@CRM26!
    admin         / LabOnly-Admin-2026!

  Passwords are stored as PBKDF2-SHA256 salt/hash values, not plaintext.

  Run on VM8:
    sqlcmd -S localhost -U sa -C -b -d master -i migration-add-app-users.sql
*/

USE MarriageCrm;
GO

IF OBJECT_ID(N'dbo.app_users', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.app_users
    (
        id                   int IDENTITY(1, 1) PRIMARY KEY,
        username             nvarchar(80)  NOT NULL,
        display_name         nvarchar(80)  NOT NULL,
        role                 nvarchar(30)  NOT NULL,
        department           nvarchar(80)  NOT NULL CONSTRAINT DF_app_users_department DEFAULT N'고객상담팀',
        password_salt        varbinary(16) NOT NULL,
        password_hash        varbinary(32) NOT NULL,
        password_iterations  int           NOT NULL CONSTRAINT DF_app_users_password_iterations DEFAULT 100000,
        is_active            bit           NOT NULL CONSTRAINT DF_app_users_is_active DEFAULT 1,
        created_at           datetime2(0)  NOT NULL CONSTRAINT DF_app_users_created_at DEFAULT SYSUTCDATETIME(),
        last_login_at        datetime2(0)  NULL,
        last_failed_login_at datetime2(0)  NULL,
        failed_login_count   int           NOT NULL CONSTRAINT DF_app_users_failed_login_count DEFAULT 0,
        password_changed_at  datetime2(0)  NOT NULL CONSTRAINT DF_app_users_password_changed_at DEFAULT SYSUTCDATETIME(),
        CONSTRAINT UQ_app_users_username UNIQUE (username),
        CONSTRAINT CK_app_users_role CHECK (role IN (N'Counselor', N'SeniorCounselor', N'Manager', N'Admin')),
        CONSTRAINT CK_app_users_password_iterations CHECK (password_iterations >= 100000),
        CONSTRAINT CK_app_users_failed_login_count CHECK (failed_login_count >= 0)
    );

    CREATE INDEX IX_app_users_role ON dbo.app_users(role);
END;
GO

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'kim.hana')
BEGIN
    INSERT INTO dbo.app_users
        (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES
        (N'kim.hana', N'김하나', N'Counselor', N'고객상담팀', 0x7FF5D0B16CFC2A46F5107C30A9A1B216, 0xAFBBB8A9A89BDAFB38C019B22DB260D8F5D150B8178994420A76C7AFE02051B1, 100000, 1);
END;

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'lee.doyoon')
BEGIN
    INSERT INTO dbo.app_users
        (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES
        (N'lee.doyoon', N'이도윤', N'Counselor', N'고객상담팀', 0x31BE553425DDD93719F2CB496ACB1DE4, 0x20D1E10B7C65BB4F453C62BE7511C5E66E7AC57E637452DE412803EB5483FDF4, 100000, 1);
END;

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'park.seoyeon')
BEGIN
    INSERT INTO dbo.app_users
        (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES
        (N'park.seoyeon', N'박서연', N'Counselor', N'고객상담팀', 0xAA21558D59BBB792C6FF51020A3883F6, 0x392566000B328A84BC12FB6FE8545785C918E66171857343B4BE477D4961437C, 100000, 1);
END;

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'choi.minjae')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'choi.minjae', N'최민재', N'Counselor', N'고객상담팀', 0xA8011E77187FCF613161780D43AEF7AB, 0xF007A0C5817E1372EBBBA4ACF1356554E38862CB46AB9547E8AAF984B0E33C07, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'jung.subin')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'jung.subin', N'정수빈', N'Counselor', N'고객상담팀', 0xAE30BD4DE7523E44B7BBACCB9F577288, 0x3562838BF0B818102C06B2F0F8996AABFB38DB32FA083E02602A8BFAC3F6B661, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'kang.doyoon')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'kang.doyoon', N'강도윤', N'Counselor', N'고객상담팀', 0x19D44D261F7821D6E59B4181EF77231C, 0xC6B11CD8BDDA9B4F0CF924823C63C26A4C421DA729A18C86FBEBEC8D5BA59A64, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'yoon.chaewon')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'yoon.chaewon', N'윤채원', N'Counselor', N'고객상담팀', 0xD1008A85F48BFC5BC561322641E6CD4C, 0x582450C236D352EBA23A99F19F447AAA89774F9E7E6B2E4352D8A714452A3CE2, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'han.jiho')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'han.jiho', N'한지호', N'Counselor', N'고객상담팀', 0x0B47E0AE038CA5D4EA458E67CA5D2827, 0x85EC13513E3FB97D12EDA4DD6147309B9CD94BDB738768CA315543A8EF19D661, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'oh.jihoon')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'oh.jihoon', N'오지훈', N'Counselor', N'고객상담팀', 0x211A7CAA28310C136E0933006EF9FAA9, 0x1BBF93408415B04DE54A8C54F569404E7690BD0D5EF26D091A81954929558C5B, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'lim.yuna')
    INSERT INTO dbo.app_users (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES (N'lim.yuna', N'임유나', N'Counselor', N'고객상담팀', 0x42F41C99D41615563E7AD9BF36AE3C1E, 0x15C0584F2FA85C0E555DF2E534B1D847B2F551A0C9F7DFBF64AB8E01ECB25F2E, 100000, 1);

IF NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'admin')
BEGIN
    INSERT INTO dbo.app_users
        (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES
        (N'admin', N'관리자', N'Admin', N'운영관리팀', 0xC19476AA3C6D4834CEB4A06232CB1DC9, 0xE888DFD8B02A6BDE0BBD7E49F16F7BD42DE84576D24D49DB2071333ED72007FF, 100000, 1);
END;
GO

GRANT SELECT ON SCHEMA::dbo TO crm_app;
GRANT UPDATE ON dbo.app_users TO crm_app;
GO

SELECT id, username, display_name, role, department, is_active, created_at, last_login_at, failed_login_count
FROM dbo.app_users
ORDER BY role, username;
GO
