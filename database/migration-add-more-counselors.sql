/*
  Add additional realistic counselor accounts.

  Run on VM8:
    sqlcmd -S localhost -U sa -C -b -d master -i migration-add-more-counselors.sql
*/

USE MarriageCrm;
GO

IF OBJECT_ID(N'dbo.app_users', N'U') IS NULL
BEGIN
    THROW 51000, 'dbo.app_users does not exist. Run migration-add-app-users.sql first.', 1;
END;
GO

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
GO

SELECT username, display_name, role, department, is_active
FROM dbo.app_users
WHERE role = N'Counselor'
ORDER BY username;
GO
