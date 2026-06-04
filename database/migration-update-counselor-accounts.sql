/*
  Rename lab counselor accounts to more realistic employee-style usernames.

  New counselor credentials:
    kim.hana     / Hana.Kim@CRM26!
    lee.doyoon   / Doyoon.Lee@CRM26!
    park.seoyeon / Seoyeon.Park@CRM26!

  Run on VM8:
    sqlcmd -S localhost -U sa -C -b -d master -i migration-update-counselor-accounts.sql
*/

USE MarriageCrm;
GO

IF OBJECT_ID(N'dbo.app_users', N'U') IS NULL
BEGIN
    THROW 51000, 'dbo.app_users does not exist. Run migration-add-app-users.sql first.', 1;
END;
GO

IF EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'counselor01')
   AND NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'kim.hana')
BEGIN
    UPDATE dbo.app_users
    SET username = N'kim.hana',
        display_name = N'김하나',
        role = N'Counselor',
        department = N'고객상담팀',
        password_salt = 0x7FF5D0B16CFC2A46F5107C30A9A1B216,
        password_hash = 0xAFBBB8A9A89BDAFB38C019B22DB260D8F5D150B8178994420A76C7AFE02051B1,
        password_iterations = 100000,
        is_active = 1,
        failed_login_count = 0,
        password_changed_at = SYSUTCDATETIME()
    WHERE username = N'counselor01';
END
ELSE IF EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'kim.hana')
BEGIN
    UPDATE dbo.app_users
    SET display_name = N'김하나',
        password_salt = 0x7FF5D0B16CFC2A46F5107C30A9A1B216,
        password_hash = 0xAFBBB8A9A89BDAFB38C019B22DB260D8F5D150B8178994420A76C7AFE02051B1,
        password_iterations = 100000,
        is_active = 1,
        failed_login_count = 0,
        password_changed_at = SYSUTCDATETIME()
    WHERE username = N'kim.hana';
END
ELSE
BEGIN
    INSERT INTO dbo.app_users
        (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES
        (N'kim.hana', N'김하나', N'Counselor', N'고객상담팀', 0x7FF5D0B16CFC2A46F5107C30A9A1B216, 0xAFBBB8A9A89BDAFB38C019B22DB260D8F5D150B8178994420A76C7AFE02051B1, 100000, 1);
END;
GO

IF EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'counselor02')
   AND NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'lee.doyoon')
BEGIN
    UPDATE dbo.app_users
    SET username = N'lee.doyoon',
        display_name = N'이도윤',
        role = N'Counselor',
        department = N'고객상담팀',
        password_salt = 0x31BE553425DDD93719F2CB496ACB1DE4,
        password_hash = 0x20D1E10B7C65BB4F453C62BE7511C5E66E7AC57E637452DE412803EB5483FDF4,
        password_iterations = 100000,
        is_active = 1,
        failed_login_count = 0,
        password_changed_at = SYSUTCDATETIME()
    WHERE username = N'counselor02';
END
ELSE IF EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'lee.doyoon')
BEGIN
    UPDATE dbo.app_users
    SET display_name = N'이도윤',
        password_salt = 0x31BE553425DDD93719F2CB496ACB1DE4,
        password_hash = 0x20D1E10B7C65BB4F453C62BE7511C5E66E7AC57E637452DE412803EB5483FDF4,
        password_iterations = 100000,
        is_active = 1,
        failed_login_count = 0,
        password_changed_at = SYSUTCDATETIME()
    WHERE username = N'lee.doyoon';
END
ELSE
BEGIN
    INSERT INTO dbo.app_users
        (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES
        (N'lee.doyoon', N'이도윤', N'Counselor', N'고객상담팀', 0x31BE553425DDD93719F2CB496ACB1DE4, 0x20D1E10B7C65BB4F453C62BE7511C5E66E7AC57E637452DE412803EB5483FDF4, 100000, 1);
END;
GO

IF EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'counselor03')
   AND NOT EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'park.seoyeon')
BEGIN
    UPDATE dbo.app_users
    SET username = N'park.seoyeon',
        display_name = N'박서연',
        role = N'Counselor',
        department = N'고객상담팀',
        password_salt = 0xAA21558D59BBB792C6FF51020A3883F6,
        password_hash = 0x392566000B328A84BC12FB6FE8545785C918E66171857343B4BE477D4961437C,
        password_iterations = 100000,
        is_active = 1,
        failed_login_count = 0,
        password_changed_at = SYSUTCDATETIME()
    WHERE username = N'counselor03';
END
ELSE IF EXISTS (SELECT 1 FROM dbo.app_users WHERE username = N'park.seoyeon')
BEGIN
    UPDATE dbo.app_users
    SET display_name = N'박서연',
        password_salt = 0xAA21558D59BBB792C6FF51020A3883F6,
        password_hash = 0x392566000B328A84BC12FB6FE8545785C918E66171857343B4BE477D4961437C,
        password_iterations = 100000,
        is_active = 1,
        failed_login_count = 0,
        password_changed_at = SYSUTCDATETIME()
    WHERE username = N'park.seoyeon';
END
ELSE
BEGIN
    INSERT INTO dbo.app_users
        (username, display_name, role, department, password_salt, password_hash, password_iterations, is_active)
    VALUES
        (N'park.seoyeon', N'박서연', N'Counselor', N'고객상담팀', 0xAA21558D59BBB792C6FF51020A3883F6, 0x392566000B328A84BC12FB6FE8545785C918E66171857343B4BE477D4961437C, 100000, 1);
END;
GO

UPDATE dbo.app_users
SET is_active = 0
WHERE username IN (N'counselor01', N'counselor02', N'counselor03');
GO

SELECT username, display_name, role, department, is_active, password_changed_at
FROM dbo.app_users
WHERE role = N'Counselor'
ORDER BY username;
GO
