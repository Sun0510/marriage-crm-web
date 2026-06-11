SET NOCOUNT ON;
BEGIN TRANSACTION;

DECLARE @now DATETIME2(0) = SYSUTCDATETIME();

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0001.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0001.docx', N'realistic_batch_application_form_0001.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1681171, 'a288713536a65881a4b20948d400d8086c2cbcd643442d50ab78b08f3d21b641', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -0, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0009.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0009.docx', N'realistic_batch_application_form_0009.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1933601, 'cc6212f2311cebf16c7c34534566e32eda880100bd1ae0b42d7976bc0e26bbc6', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -1, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0017.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0017.docx', N'realistic_batch_application_form_0017.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1014684, '04c59ff0959adaa83fc75b852e3f7fe5cb79628f04e096ec9b0b51884fbd220e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -2, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0025.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0025.docx', N'realistic_batch_application_form_0025.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 759914, '58631548ac540d1d3558dc977fb3e64acb3126fcfd8d35b0db993d1b22672458', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -3, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0033.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0033.docx', N'realistic_batch_application_form_0033.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1200416, '4218965b7dfe7c60e333550183904373e10fdd9583ddcf6af387b218f183a326', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -4, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0041.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0041.docx', N'realistic_batch_application_form_0041.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 937972, '8946a34446ffb615450de27a52d2b721f6bc712d44f1e3ab9e4cde35fc1abfb0', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -5, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0049.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0049.docx', N'realistic_batch_application_form_0049.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 861434, '9ca5c20ca3887911aea4b2d490b3c83fbc37b2c1b7be565f7017a1d668ece78d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -6, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0057.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0057.docx', N'realistic_batch_application_form_0057.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1139321, '9f7c6a07f6e3774fe6a1f1232664f0a20ed8e1f91a6b4e9607af53d633b536be', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -7, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0065.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0065.docx', N'realistic_batch_application_form_0065.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 119370, 'c9d8abcf03354a424bcdedfe08d45f1217335bcae3e4d407f21ef1b2e86fa356', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -8, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0073.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0073.docx', N'realistic_batch_application_form_0073.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1145062, '7829c00050c6786e036a00fb9162ada0483c44e26b02604eea4eaa40dfc3abc1', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -9, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0081.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0081.docx', N'realistic_batch_application_form_0081.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1806195, 'a93cca9566a7cf082722bcca8a2bd16b1997e1509fa58906f183d172f054ecac', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -10, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0089.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0089.docx', N'realistic_batch_application_form_0089.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1352967, '908175a7371adab453eb0d53aa52d02d29481f52683e1dc81c86e59fe9b56744', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -11, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0097.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0097.docx', N'realistic_batch_application_form_0097.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 194228, '87f1ad3f559ec330c93dbdb91b0348ba503ec616b7e09a728fa039d285b32ef8', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -12, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0105.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0105.docx', N'realistic_batch_application_form_0105.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1206136, '55c998eb9656d150d23575d92086957dc10f533f9b67ea410748e0e329f29a13', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -13, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0113.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0113.docx', N'realistic_batch_application_form_0113.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1079347, '4d5adaf4a10698dc046e3def82bd3e0f034806195c5bf6c0f7c3c7b7170ef7f3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -14, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0121.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0121.docx', N'realistic_batch_application_form_0121.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1908843, '951d9247a7b0692d49d4f76b752b3cb7f25a7b1c12e0eb24c31a485cf20e994c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -15, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0129.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0129.docx', N'realistic_batch_application_form_0129.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 861201, 'd0b69369f9298f0f5a8f4e7c790c6e78507d721263829399f946321a5dcc9c61', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -16, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0137.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0137.docx', N'realistic_batch_application_form_0137.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1080910, '86b2279ec37ae9ac04dc1a90d8e27300cc9ef3d49885056e8867cedf2762bd8a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -17, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0145.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0145.docx', N'realistic_batch_application_form_0145.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 536943, 'a5f7488628b7ddc797f57ea2289d9c90b36183cebef6dd3bb84e6424688a7422', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -18, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0153.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0153.docx', N'realistic_batch_application_form_0153.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 89795, 'efe27500ee5a3e5fe3fa4313a525b4ff11414f9113b5325e29d936523a61502e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -19, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0161.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0161.docx', N'realistic_batch_application_form_0161.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1119131, '2b6fb195a526f7efc1cb33e8926d1fe2765764e0f2c56b8ef78c05010f84dd03', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -20, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0169.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0169.docx', N'realistic_batch_application_form_0169.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 224576, '71540ae1242153152ea68d47f1cb57e91fdf731f863078cb243b78e89ebcbf0e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -21, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0177.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0177.docx', N'realistic_batch_application_form_0177.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1484671, '5ea147d69b41bbe825eac3920a89ecfe52d066ea89f6027a3a3f25e43e0ed059', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -22, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0185.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0185.docx', N'realistic_batch_application_form_0185.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1867363, 'b7854a507727bafd858cf0ab54c7a410a4b4200eadca44d6d9fff50796287b94', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -23, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0193.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0193.docx', N'realistic_batch_application_form_0193.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 186531, '8f61e1d3a1fc337d26a050cb75f59086464b839de01103fd0986842264f3d472', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -24, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0201.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0201.docx', N'realistic_batch_application_form_0201.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1914234, 'd01394255753812ae04d410913309b15ce38f45c171e85e7a9dbeee749f9098b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -25, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0209.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0209.docx', N'realistic_batch_application_form_0209.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1597992, '2e2b9bbfab05e92aa0fd180c14480c0e281f22361bbbf5b4c0104293f1622522', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -26, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0217.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0217.docx', N'realistic_batch_application_form_0217.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 359962, 'e5f571d220fb275bfcc4bd3a84bb98ff1f7acc68575ae310d496a0892a9df199', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -27, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0225.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0225.docx', N'realistic_batch_application_form_0225.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 766944, 'b01ecc36e2b7a5dec71da0b1e6722437d05a4f7cb29ed151ff62d29b7827997b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -28, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0233.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0233.docx', N'realistic_batch_application_form_0233.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1917553, '3fb65749fb91e9d3ce4a7d7df52b8717cc976cce41aed4e131334cc1aac34f6e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -29, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0241.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0241.docx', N'realistic_batch_application_form_0241.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 992342, '67d8ff91a9e98b53d4090f1251b0169ca2e6cf47c437e57062bb06791d96a1f7', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -30, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0249.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0249.docx', N'realistic_batch_application_form_0249.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 896874, '9465df47ed993577b176bed265c94602624d638d5518c5318b416093986a068a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -31, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0257.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0257.docx', N'realistic_batch_application_form_0257.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1228642, '07935c7ce629ec3cd28eedb89acdb988af9749ed9aa4b159d00e6b6e6340aa4f', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -32, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0265.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0265.docx', N'realistic_batch_application_form_0265.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1485854, 'bafb97613177431b31d1576b4ffaad730fe73f15db950cfa154115181912768b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -33, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0273.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0273.docx', N'realistic_batch_application_form_0273.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 388263, '3a94a9bdf6d3c774fd2f6c246790e6795807b9f21daa461652765d3b2f169b46', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -34, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0281.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0281.docx', N'realistic_batch_application_form_0281.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 580417, '673389959950c99762954aeca3aaf2717b2747f9701eaf135b5ff0bdaa398a67', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -35, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0289.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0289.docx', N'realistic_batch_application_form_0289.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 651860, '86df05fd689d29fb1fca9d50ebfaefd51f2c186106877c9a3ab1a9a195f77fec', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -36, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0297.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0297.docx', N'realistic_batch_application_form_0297.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 398183, '9ff16c7aad4e5055dc786635a250a0a3ba741e819020ca9bd812ba89dd9d2f6e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -37, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0305.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0305.docx', N'realistic_batch_application_form_0305.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 184783, '75da4bbec82a9e4ebb13b4a3bdff46fc1f9562d02f3beab966815fd0ffa22530', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -38, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0313.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0313.docx', N'realistic_batch_application_form_0313.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 449761, '27d6f0544b80b23f3c9a8541962c248a2091d613d0972e015d544bd7b9498e00', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -39, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0321.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0321.docx', N'realistic_batch_application_form_0321.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1078847, 'e7299c2e80badc13c26681a5c5f656e77fe9e58fff33e93f2485a585b0ccb733', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -40, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0329.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0329.docx', N'realistic_batch_application_form_0329.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 583917, 'c9c93017d731f131138b92b0a905301291f2e9e19ab066a5593790c54fbaa2b0', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -41, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0337.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0337.docx', N'realistic_batch_application_form_0337.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1162913, 'a0224b420509e40ab594450db20c14592de7863c13674796e73d7ed840ea4781', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -42, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0345.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0345.docx', N'realistic_batch_application_form_0345.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 809053, 'b5a19cb89f656906f42400fdb204595cf4dd8c4683eb98fa018146859407dd04', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -43, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0353.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0353.docx', N'realistic_batch_application_form_0353.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1293081, '12811dd17d9a0e1c62fa311249f0d9634bc938e5b00646352e2ad2cdd80c3276', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -44, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0361.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0361.docx', N'realistic_batch_application_form_0361.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1117852, '6f7a136528d1fae7d946521284789711e5e4bee34a1433f55d5ae153331f1739', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -45, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0369.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0369.docx', N'realistic_batch_application_form_0369.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1206573, 'e6050b0e7670ceb78738e191efa784d8a17bf8313eebbd211725356b1822aaf9', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -46, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0377.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0377.docx', N'realistic_batch_application_form_0377.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1047680, '9ec3afd1649fcaf168da730256ea86f6073e550abeb7f1541e52a9fcf3fa799e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -47, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0385.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0385.docx', N'realistic_batch_application_form_0385.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1442604, 'c03e355bf1a122d5a3c3d5f50ed0a3c687938966996bd73087546c6bd9c86687', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -48, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0393.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0393.docx', N'realistic_batch_application_form_0393.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 752804, '3b258f26a174bee005b766c0f15286569a9e5ae7fd5773c630e6bdca5acd1387', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -49, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0401.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0401.docx', N'realistic_batch_application_form_0401.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1826512, '5ce0367c374d8e8435b313f3a40f1d9bf63cad2f8711fa4197a3b051a6f7547d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -50, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0409.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0409.docx', N'realistic_batch_application_form_0409.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 375377, '0b7a3905e865838ecb2cf24e3126a1fa62c23c6dbbb2f3ab1ae21f77112557aa', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -51, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0417.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0417.docx', N'realistic_batch_application_form_0417.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1090240, '74bdd964b4faa9ab898166c6edde1cb69743c93cd5b1d4267ccdedfb2d54aae8', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -52, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0425.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0425.docx', N'realistic_batch_application_form_0425.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 402633, 'a8cccbcc19e7e530ad3d8f1f5cb307b0d9ba82d716195d6fdbb7ccdc3d794cdf', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -53, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0433.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0433.docx', N'realistic_batch_application_form_0433.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 2006951, '28e7086c56238e2c8859967f4da762f493cbbf9a99d622420cfe3f7d25271f89', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -54, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0441.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0441.docx', N'realistic_batch_application_form_0441.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 898092, 'b38c5a37527cb81c5737cf6d154cee9c28797698ac7a1126d8ab113d2125545c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -55, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0449.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0449.docx', N'realistic_batch_application_form_0449.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 962450, '3dc716e6be118565442363c92c90755fce922bd6a4f30e668980bb328969590d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -56, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0457.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0457.docx', N'realistic_batch_application_form_0457.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1468330, 'b7a8aa060e5988b0d4f98584132e151410f9d0d3c0fcb35982da8f60f25dacd7', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -57, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0465.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0465.docx', N'realistic_batch_application_form_0465.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 856724, '0385fa9e4111f2288a10305e68809fd38efc69086bd201bddfbc3143e7bebb3b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -58, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0473.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0473.docx', N'realistic_batch_application_form_0473.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1449903, '957548d99dc44c3f11569991e1006947f873dd927f7bbe05c921e4a3b1ceae73', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -59, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0481.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0481.docx', N'realistic_batch_application_form_0481.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 497141, '4f3b53ff002e40e77ffc60114d0a54035f353c0fe9b37ff8fe32d1061a1c8045', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -60, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0489.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0489.docx', N'realistic_batch_application_form_0489.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1361701, '1557b5aa3e119f11c2a5ddfeae5397a72ffd1c3fba01aa2c5dc3a14d760a7963', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -61, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0497.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0497.docx', N'realistic_batch_application_form_0497.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 632910, '0a34b93aafeca074ddde897f03267998f3ecc088262f20c3b0bf03a54f086f96', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -62, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0505.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0505.docx', N'realistic_batch_application_form_0505.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1565963, 'c582e5380e112c830db38352864c0f3e4bb7cce332cbd8e51385fe1967dd4cc1', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -63, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0513.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0513.docx', N'realistic_batch_application_form_0513.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 492055, '4a49244a8efa4609201846c911317b5d664b469e71603f5eda5e620686adaae6', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -64, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0521.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0521.docx', N'realistic_batch_application_form_0521.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 934493, '67459bfdbde3ab798d73c24d216664628f48d61f072572b400773961bde7f343', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -65, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0529.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0529.docx', N'realistic_batch_application_form_0529.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1431085, 'fbf02ecfe46ab6a68cc9bd69404281c29b48df64f51da737468173ee1bae10e5', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -66, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0537.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0537.docx', N'realistic_batch_application_form_0537.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 126723, '90470dc60d05e3929cc6dc611564a454dbdb48d4f3d2c39686752266804391de', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -67, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0545.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0545.docx', N'realistic_batch_application_form_0545.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 827223, '593106ed2dbb1d59338afc2cff02fbbfec91c95d3d3c4b3b4dd2b5be9070c988', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -68, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0553.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0553.docx', N'realistic_batch_application_form_0553.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1104185, 'c6b4470ca7f94d48d4d79e005f071c0e5974023f6d55df934dbada99bdd312b8', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -69, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0561.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0561.docx', N'realistic_batch_application_form_0561.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 356287, '8667898c54e566e0da90c20d2deb6f591f0cda0b321f21cdcaf34b3c092fa602', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -70, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0569.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0569.docx', N'realistic_batch_application_form_0569.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1363957, '2815c3debbd126a81a2b66a14e8356fbbe48d1a416cd441b4f0319a2e70ddefb', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -71, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0577.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0577.docx', N'realistic_batch_application_form_0577.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 2023535, '0ff8cf2a9234ad31741b7b2c696f44c03bb0f29d46c7e96ebb0bab3c696bd877', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -72, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0585.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0585.docx', N'realistic_batch_application_form_0585.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 858866, '5a58b162ffee4809189c351990b581ed5e223b052b6eee17800c56ae84605d43', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -73, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0593.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0593.docx', N'realistic_batch_application_form_0593.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 720511, '95ce5d0a7d697f0c49995d31c6d77cdf6ec3c419b01dbcc81f4ec6149477596c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -74, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0601.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0601.docx', N'realistic_batch_application_form_0601.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1681171, '69b71dbf5a16e5e4ca2d3bdee3d996e8bd9c4e8c8ed8b4abfe20aa2ae232b4b8', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -75, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0609.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0609.docx', N'realistic_batch_application_form_0609.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1933601, 'c48d22bf0b0caab66ad0f8d26934b81e220dbccc67c07f9b1082bdb50fb98fd9', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -76, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0617.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0617.docx', N'realistic_batch_application_form_0617.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1014684, '6a1e6ea8a974b54ca304df0556d2080b610b73f4ca9e86461c706db30c441237', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -77, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0625.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0625.docx', N'realistic_batch_application_form_0625.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 759914, '1e1739ff862826a0c411ed12d9697480d47508736db875f7e8351f2b6232161f', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -78, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0633.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0633.docx', N'realistic_batch_application_form_0633.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1200416, '7b12a5d460d4462dc99003fccfe600d6c8118c25f03a79c96898d67fdbf550f8', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -79, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0641.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0641.docx', N'realistic_batch_application_form_0641.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 937972, 'c1b15206d257fd9639cca6bb309c0f995b15b3e3f651c9af1333837962eb414b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -80, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0649.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0649.docx', N'realistic_batch_application_form_0649.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 861434, 'e733db119a4abc327e5542e7f58afbbd79df091dce943cd1ac75b276ecef793e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -81, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0657.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0657.docx', N'realistic_batch_application_form_0657.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1139321, 'fd0e83c0d49400ca2ea85bc86cdb7cc7b92a8455769df30a0332341f6c4ff505', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -82, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0665.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0665.docx', N'realistic_batch_application_form_0665.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 119370, 'e136a64f94725be4e8db6dd71d810880544a0ceb72cf5f425e0a66b0ec52098e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -83, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0673.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0673.docx', N'realistic_batch_application_form_0673.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1145062, 'ef495d1f9de1d0cf6181f337e593d10a923259080dfcb51c007e3f0908cc5367', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -84, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0681.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0681.docx', N'realistic_batch_application_form_0681.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1806195, '859bfbaf8d207b7d6a6131d57f1111b73bcaffba02a92612163ca5f09eaf1087', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -85, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0689.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0689.docx', N'realistic_batch_application_form_0689.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1352967, '7897541c8a2ec13ca7c92b156e5d80449469b4c02ff6b4210c090ab54bf7f769', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -86, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0697.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0697.docx', N'realistic_batch_application_form_0697.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 194228, 'f1d61ccf23c35ec9f9384c953ad9211568ac7923da2276dec25c087f46a614fc', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -87, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0705.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0705.docx', N'realistic_batch_application_form_0705.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1206136, '461ab7a94e3ba185c0f621c09294cb97ba5c2151c3544e25fd339712450fd21d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -88, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0713.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0713.docx', N'realistic_batch_application_form_0713.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1079347, 'e8a1d21a9a4f57b5e2e9a076f00d25cd5271cc690f989fc69534a8e6d4eac7ef', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -89, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0721.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0721.docx', N'realistic_batch_application_form_0721.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1908843, '30e06a7a033b7e259bfc78d9ffaf3ec75c6052e987d928612ccc8d1cb951219a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -90, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0729.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0729.docx', N'realistic_batch_application_form_0729.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 861201, '540576514d0742077ae6bf6f3e131202513fb0558653a6c89c9fbbc7200d5dce', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -91, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0737.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0737.docx', N'realistic_batch_application_form_0737.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1080910, '821a585bdd542cdb2f933ba2ccd660541eadbebad464be2587becb97899d85ae', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -92, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0745.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0745.docx', N'realistic_batch_application_form_0745.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 536943, 'ec5241b518223d20f844ea6c2b0be1b89d12b773f20ff76120114ef211cf983c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -93, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0753.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0753.docx', N'realistic_batch_application_form_0753.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 89795, 'a1e7a464d78f3a03b797f7456702af6bb5a22c21d4f72cd92ad13a8ad61d76b6', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -94, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0761.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0761.docx', N'realistic_batch_application_form_0761.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1119131, '28c352b7a1134d23e93578c9ce278b1d7adf2a9b63523f64fc37b82ea8122de7', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -95, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0769.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0769.docx', N'realistic_batch_application_form_0769.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 224576, '11bc9e36341633afa8d29a19b4a54bb7a112d739e80f517555150482c226bd51', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -96, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0777.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0777.docx', N'realistic_batch_application_form_0777.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1484671, 'c5c6479581186eafdace97bc9a0b4a1890af9ba236ad5a4c210a75889b90ac5d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -97, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0785.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0785.docx', N'realistic_batch_application_form_0785.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1867363, 'eda9d544cbb605f5c99f4389284bb28b3ef8f435ae768b5b2cff146ac261d838', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -98, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0793.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0793.docx', N'realistic_batch_application_form_0793.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 186531, '4ad063db450c2a8116a197a4a95b569b789dcffe3ebd918365d1b5aaa236276e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -99, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0801.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0801.docx', N'realistic_batch_application_form_0801.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1914234, '6ba93c66c8de371b28f74c035538ba71b95bd9a745ab745d5b96e0e761fce5a4', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -100, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0809.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0809.docx', N'realistic_batch_application_form_0809.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1597992, 'c6d03598f7bf682d94650b25865529fc69cb122604be14f427d921815b3bdfce', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -101, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0817.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0817.docx', N'realistic_batch_application_form_0817.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 359962, '1a6192f0466e1e570f50c849cdb12676bc8f54737e8e97a9849cd0b0879d7313', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -102, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0825.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0825.docx', N'realistic_batch_application_form_0825.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 766944, 'dcb6619f5ac708afed0fd7d7e2180570ecd464375305b2c35b9b8e6f3fc3e074', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -103, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0833.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0833.docx', N'realistic_batch_application_form_0833.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1917553, 'b044490ee8d50bff5969d8e6930381ad63aee7e6fd2078cce79e1661966e7dd2', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -104, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0841.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0841.docx', N'realistic_batch_application_form_0841.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 992342, '7e3fb9d6cca93c31f919bcdff6234e74c494ec2c5279bc75d60de044b607a7ed', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -105, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0849.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0849.docx', N'realistic_batch_application_form_0849.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 896874, '45c1d37ec312269adea21de1549212a0c15328429c5a90df4b959e6d96007089', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -106, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0857.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0857.docx', N'realistic_batch_application_form_0857.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1228642, 'ed6b068ab5514c64535c3edc3e50b8ff53b05582d88e8d52214e3d89d74aa779', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -107, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0865.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0865.docx', N'realistic_batch_application_form_0865.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1485854, '65a94fb22cc913b9c5ebf544f3abc541cbe888799c4ca18ef4403ebcc3778ffb', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -108, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0873.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0873.docx', N'realistic_batch_application_form_0873.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 388263, '943ece2160e67057959055bc974dc81c2491052f739e8c25977c2b083d4721bd', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -109, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0881.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0881.docx', N'realistic_batch_application_form_0881.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 580417, '2fccec237154e94c2d01786c6341fc845afe3d3db62f2d79b0b8838518297699', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -110, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0889.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0889.docx', N'realistic_batch_application_form_0889.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 651860, '3d6e8293605338cc21c2090e930f7a08ee348236f072bb33883bd9308f748412', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -111, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0897.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0897.docx', N'realistic_batch_application_form_0897.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 398183, '44c43ffaf0f03a61cf6a2052b1157427bbfcf7f709277af5b59623ac0df36450', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -112, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0905.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0905.docx', N'realistic_batch_application_form_0905.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 184783, '5f213b4f777e90ddf90ffb900b75ce45b4715a68ff04c9f91273a5c15fa13be7', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -113, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0913.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0913.docx', N'realistic_batch_application_form_0913.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 449761, '0af77cc231d2a6144a610fbb8e88585ac943ffda1815b2f92cd4fd2996389552', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -114, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0921.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0921.docx', N'realistic_batch_application_form_0921.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1078847, '22257f7e13ec109d94e5b59011eda2c5387c4163d456a864ede24d14c28d4954', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -115, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0929.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0929.docx', N'realistic_batch_application_form_0929.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 583917, 'aab81da99a0b5f92640a944c0c224b87dd875b91eeb01bd9c9beb7c333c2bbac', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -116, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0937.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0937.docx', N'realistic_batch_application_form_0937.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1162913, 'ecfde88e572c152216bf3dae7436c968e822af5dcd4fb41b65cc5f39ffe6cc0b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -117, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0945.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0945.docx', N'realistic_batch_application_form_0945.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 809053, '74aff0466303ca98655a8e350ac878e507cf6ddce1342e29ffa1541791736821', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -118, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0953.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0953.docx', N'realistic_batch_application_form_0953.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1293081, '011aa8785f95cc40f61f3f4db95945f84c7e78490b0d418c27c2d51e67b712ae', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -119, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0961.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0961.docx', N'realistic_batch_application_form_0961.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1117852, '71d9b71e88b885c62026afa28f382173e4e2ebc8783c709288f310d0205ba234', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -120, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0969.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0969.docx', N'realistic_batch_application_form_0969.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1206573, '43ca3206dabf8cfa0572f8a18d2a72d274dabf63febdcdeb8170f76f879f2937', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -121, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0977.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0977.docx', N'realistic_batch_application_form_0977.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1047680, '104eef7ac8c9b467176bb5c3dbfd29bdcc2603dd12904200ed6af17ac9ee4df3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -122, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0985.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0985.docx', N'realistic_batch_application_form_0985.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1442604, '29565eaf1cbe0703ace40b75ceccaf0aa70aba38bade4b06eb8d85900378833e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -123, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_application_form_0993.docx')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_application_form_0993.docx', N'realistic_batch_application_form_0993.docx', N'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 752804, '72e54e40a3630031189d82c857bf7073b805e459bc434ac3ce57322bc9e3a664', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -124, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0006.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0006.zip', N'realistic_batch_archive_package_0006.zip', N'application/zip', 4307031, 'a9bee07cca0e6d6d9ea3d45c76ac32a1058cd8612e5ee7622a827023060400a1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -125, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0014.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0014.zip', N'realistic_batch_archive_package_0014.zip', N'application/zip', 4729216, '1fbbfd55121b0a32465f5a6124b1b6cb1aa395cc7aff7e163df45f6f096e714c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -126, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0022.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0022.zip', N'realistic_batch_archive_package_0022.zip', N'application/zip', 6938839, '8b3df7885d9e2852900f2f6dd1fbc112a231ab9a15843ce60204135afe76a8e7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -127, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0030.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0030.zip', N'realistic_batch_archive_package_0030.zip', N'application/zip', 10436952, '9c316329c521edf24a601307cabcb41701030a0529468c20d96c8dfd6005b180', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -128, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0038.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0038.zip', N'realistic_batch_archive_package_0038.zip', N'application/zip', 16176486, '87bf68d593299e11a507e2a9ba84eb31c9f21f61f18d9a874a4c66e2e2356d0a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -129, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0046.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0046.zip', N'realistic_batch_archive_package_0046.zip', N'application/zip', 18469625, '47f5425b8bd3de73594708d030c37ee86671c280ff09815efdf530a248bf5713', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -130, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0054.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0054.zip', N'realistic_batch_archive_package_0054.zip', N'application/zip', 6330437, '094eb30ef224ff5cffb4a832171cab8ad4531f38adc6d642d1da50d88c2ef1d1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -131, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0062.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0062.zip', N'realistic_batch_archive_package_0062.zip', N'application/zip', 16204737, 'c5442d810dfa6c28b1a4c2843ffb26eddf6fc3d17a416be1144b30b47181e5fa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -132, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0070.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0070.zip', N'realistic_batch_archive_package_0070.zip', N'application/zip', 6372479, '2410599858174c0654072d290e227f0fddf6842fe0aa05a4d85156994378df3d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -133, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0078.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0078.zip', N'realistic_batch_archive_package_0078.zip', N'application/zip', 14034578, 'c6c665f58c4859bdcdcf02c67e067efc97b507f571c5d6d626a345df645fa214', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -134, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0086.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0086.zip', N'realistic_batch_archive_package_0086.zip', N'application/zip', 11046623, 'a1e7480681f3214dce180fe1084a7d5d819d4860464e599933b5f1bdc6503c03', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -135, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0094.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0094.zip', N'realistic_batch_archive_package_0094.zip', N'application/zip', 15809497, '76d91ef2d1039248b02abcbaafd8649188ab4cc6183b5e745d1d8f02145306da', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -136, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0102.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0102.zip', N'realistic_batch_archive_package_0102.zip', N'application/zip', 10519286, '44415e6009490f9dc2248a4e6bce0d5e81da028a8381ab4139f74f47b0bacf07', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -137, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0110.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0110.zip', N'realistic_batch_archive_package_0110.zip', N'application/zip', 16030770, '4c43a3c25e03c01054943e31dec8c14544b22f49e2f5be4e5842804095f674b0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -138, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0118.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0118.zip', N'realistic_batch_archive_package_0118.zip', N'application/zip', 6026220, '547555576400bf39f5ff1944587970607f0652d50d51585341b303f4503f765b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -139, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0126.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0126.zip', N'realistic_batch_archive_package_0126.zip', N'application/zip', 8188599, 'd58e2a6d6fc6413f87b828cee73294f5bc6df3ba630ea0b5ec1f7cfdad776eb0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -140, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0134.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0134.zip', N'realistic_batch_archive_package_0134.zip', N'application/zip', 9574324, 'dbae16ccec494236e4f2d6b24b026f7c662ef859133f773592006751ff52dfae', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -141, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0142.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0142.zip', N'realistic_batch_archive_package_0142.zip', N'application/zip', 6320953, '7297338f30fa94aa4173abb7f2b56a3409f6ea4ba3bd3b16f130fc5969722a2e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -142, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0150.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0150.zip', N'realistic_batch_archive_package_0150.zip', N'application/zip', 7887218, '3a2754a6fe416eee1816924d02f5e41474099426857b1098050a6baec2bcc838', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -143, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0158.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0158.zip', N'realistic_batch_archive_package_0158.zip', N'application/zip', 3429420, '732ab3f10e33cd52e844b8067433f9c210920389c4aa9998e68e79b9224ce6a3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -144, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0166.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0166.zip', N'realistic_batch_archive_package_0166.zip', N'application/zip', 4082002, 'ce61388f551d7cc275187c630c06447c0e3770e6f142b720f6fa3a4606463477', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -145, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0174.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0174.zip', N'realistic_batch_archive_package_0174.zip', N'application/zip', 18650435, 'bfb5914e8eece7e16b25736d37e94fe903d6c5b3db4b2e9727cde6a5803dd060', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -146, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0182.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0182.zip', N'realistic_batch_archive_package_0182.zip', N'application/zip', 16394313, '7e1740fa88d024f0ab4625bb9ad7e431c3642a9460a6730cd4d1aa60bb00e1a0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -147, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0190.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0190.zip', N'realistic_batch_archive_package_0190.zip', N'application/zip', 16130815, '7258a061822fe430172d9af96bee024c2e1a873b17199a2f91df9400fac20ea7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -148, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0198.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0198.zip', N'realistic_batch_archive_package_0198.zip', N'application/zip', 11348198, 'f3db5f696bcbaeb06307bfbdd6755f8af7ef063a4dfc5a4663ae14fadaa505a1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -149, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0206.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0206.zip', N'realistic_batch_archive_package_0206.zip', N'application/zip', 6079328, 'fef916e4dfee0907a0640e7e263c133361d0223e10df51628ec6f25c36ac52ac', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -150, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0214.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0214.zip', N'realistic_batch_archive_package_0214.zip', N'application/zip', 14830538, 'a11da27f0f55838b8c5aed17d34100796ec090f6c8c7fbc15f950fdbdcbcd64d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -151, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0222.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0222.zip', N'realistic_batch_archive_package_0222.zip', N'application/zip', 4565076, '01ad43502cc924dc93ca6d97ee21ef3f0e3d4feae4f4a946f630cefb7bcf5565', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -152, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0230.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0230.zip', N'realistic_batch_archive_package_0230.zip', N'application/zip', 4724534, '566bff1cb7c216ad0e28d7082b020680a8eb1355204932c80efda8d6195c3418', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -153, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0238.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0238.zip', N'realistic_batch_archive_package_0238.zip', N'application/zip', 14211226, '63236ea4d746332cb751263af287d64b37561e18d145fc8c26887a2702121739', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -154, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0246.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0246.zip', N'realistic_batch_archive_package_0246.zip', N'application/zip', 13866660, '8ff32d3c530a215a87bada88da0f5e001fdbe21dbc5f27e15d7961136d838952', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -155, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0254.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0254.zip', N'realistic_batch_archive_package_0254.zip', N'application/zip', 6296571, '9b2fcab100023e602d59c71ff1e0df71f44af6d7708f4dc04d1867101df91fba', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -156, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0262.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0262.zip', N'realistic_batch_archive_package_0262.zip', N'application/zip', 5150239, '590b09c4ca29308ee873dededa73755a0f88e47e4fea25782be985cd1f8d73d8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -157, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0270.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0270.zip', N'realistic_batch_archive_package_0270.zip', N'application/zip', 14051254, 'c790a403ced5250bc44c9210ebd0f736a9feed13e9f0b6b82a5202aaa9b1e0e9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -158, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0278.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0278.zip', N'realistic_batch_archive_package_0278.zip', N'application/zip', 14932773, 'f8d39cc50ab86361b93ef27e1814d575c7179e501baac195848d0ea23a20c37f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -159, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0286.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0286.zip', N'realistic_batch_archive_package_0286.zip', N'application/zip', 13975450, '402c79fb7d52c0ea44138318b83f01b185eb798bdfcac5c02af2fedfaad4df2f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -160, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0294.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0294.zip', N'realistic_batch_archive_package_0294.zip', N'application/zip', 9663289, '5761b867c6baad64bf768322b749ddb3c782e9da09b64b72c42bb655005371aa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -161, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0302.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0302.zip', N'realistic_batch_archive_package_0302.zip', N'application/zip', 5206049, '9543632cc3dafbb377502c05902989f4a5cf8703226006f9ddd9d9a59d640849', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -162, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0310.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0310.zip', N'realistic_batch_archive_package_0310.zip', N'application/zip', 6562837, '72e4eacd5f78c16b2a74009a2be34e5ce802e48a385b9c805bc43d81d2257382', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -163, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0318.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0318.zip', N'realistic_batch_archive_package_0318.zip', N'application/zip', 17931444, 'decfeb6c387d696ce5cadc449e4f2683ec10996792a71a369a5511fb207a5b0e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -164, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0326.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0326.zip', N'realistic_batch_archive_package_0326.zip', N'application/zip', 13337090, '51179d18596992c907c42d9207b08bf844f904f95051e1423b81228f66bf087b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -165, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0334.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0334.zip', N'realistic_batch_archive_package_0334.zip', N'application/zip', 15457395, 'a6bcb801d874175008d845d86951cf312d05a0498ab145ca9b9e8717d14620bf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -166, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0342.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0342.zip', N'realistic_batch_archive_package_0342.zip', N'application/zip', 16174128, 'dd2701be374fc34b65607f59759d8b29f1ade7cb39417a2da4fe6f39e5200d3b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -167, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0350.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0350.zip', N'realistic_batch_archive_package_0350.zip', N'application/zip', 3603430, '58b0656ea3c345156611811690f83095c3c2dce0cb7e2ecee37eec6500680517', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -168, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0358.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0358.zip', N'realistic_batch_archive_package_0358.zip', N'application/zip', 15434467, 'db87525871a8c5ab397d1953b577a2a0b28867afddd32ed12cab0e7d11e1b767', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -169, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0366.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0366.zip', N'realistic_batch_archive_package_0366.zip', N'application/zip', 3742952, 'cb64c19d30379595eb305337ab6167005fe47f428a778a72c538951ffd737111', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -170, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0374.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0374.zip', N'realistic_batch_archive_package_0374.zip', N'application/zip', 13442707, '92e7404d7b5e03f148de1d1c067810753c4d65a41bc503b714f4f95700ad6869', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -171, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0382.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0382.zip', N'realistic_batch_archive_package_0382.zip', N'application/zip', 18383269, '768287e75c8d5b1f46f5cfd91afb1f2d40113c96f5e96990e10e90c7c34714e9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -172, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0390.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0390.zip', N'realistic_batch_archive_package_0390.zip', N'application/zip', 12661526, '601c5bf06b8684ce36dcc8b9dae4b33ad2b64abe51930f08ee3702343a3486ad', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -173, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0398.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0398.zip', N'realistic_batch_archive_package_0398.zip', N'application/zip', 17396205, '421db84716c6b4c7f803af9d93fae40a1ae94d3c63f3c9f8dfa6dfda05431faf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -174, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0406.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0406.zip', N'realistic_batch_archive_package_0406.zip', N'application/zip', 13992362, 'c2ce9f25c1a03dd89744e5fa7d07cb49a45f1d1ca4c1997f0e0e4be8b47cbaf5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -175, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0414.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0414.zip', N'realistic_batch_archive_package_0414.zip', N'application/zip', 13385178, '4a0e87bff47c566635179a1b0d911deae70475cb4547e17ac4cd403c0278b678', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -176, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0422.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0422.zip', N'realistic_batch_archive_package_0422.zip', N'application/zip', 6170792, '5610e4caee52836afeaa895bdec386161fc5fbf2dc5ebccefd5d78e8ce78a242', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -177, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0430.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0430.zip', N'realistic_batch_archive_package_0430.zip', N'application/zip', 8698464, '419bc5a26322c557ae86ce07d837c85b359e27886e7885e332b6b67550f575f7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -178, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0438.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0438.zip', N'realistic_batch_archive_package_0438.zip', N'application/zip', 12085511, 'dd8177c21ad6c72b75c542d11957e67ae6d8fdc4c6f4e590279ddac26082e930', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -179, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0446.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0446.zip', N'realistic_batch_archive_package_0446.zip', N'application/zip', 15445378, '90b40b395e77726e0621ee7b495922b8c6b76dc89be8aabe177e69765273088a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -180, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0454.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0454.zip', N'realistic_batch_archive_package_0454.zip', N'application/zip', 15728626, '41cac7899ede94ce87601e233d062702fce191753d692721b6ce1d4641ec9cf1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -181, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0462.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0462.zip', N'realistic_batch_archive_package_0462.zip', N'application/zip', 12950208, '9125c176c2b4ebe5283a9777257fecd27313ca42d274f770e2ac54a7014bb5f4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -182, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0470.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0470.zip', N'realistic_batch_archive_package_0470.zip', N'application/zip', 12764634, '061b8e0f050c42ce87f3919eebcce6829b65121fc0e2c10f8ab8ea8c7df0d380', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -183, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0478.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0478.zip', N'realistic_batch_archive_package_0478.zip', N'application/zip', 18209695, 'f1b8db0bd1c6dafbf85d1df20cd566532f0657e9a2f318ad2a25e90ddf239614', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -184, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0486.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0486.zip', N'realistic_batch_archive_package_0486.zip', N'application/zip', 17504163, '4a086ffefeb26d8b1eb928d267f051c6e47d71270964cac7b86283c246c765b2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -185, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0494.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0494.zip', N'realistic_batch_archive_package_0494.zip', N'application/zip', 7245732, '1b4d836819f5d9a8aa2d104f342f74e75617c3636a1c60166c362c58d471f560', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -186, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0502.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0502.zip', N'realistic_batch_archive_package_0502.zip', N'application/zip', 17596189, 'c883a30a1c7f99cf03a094be1f7a661de97a94b0b2a6e1484ed7b19c0455ffbb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -187, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0510.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0510.zip', N'realistic_batch_archive_package_0510.zip', N'application/zip', 12917796, 'b484089f7472d8e3d3b6eb275262a4fb7c866c642325635f74baef638af82a30', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -188, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0518.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0518.zip', N'realistic_batch_archive_package_0518.zip', N'application/zip', 16958275, '7fedbd948a690d1d7d98be8d85dc7e8d6714d0fbe61d2f57c98a4a71bcffd5a8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -189, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0526.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0526.zip', N'realistic_batch_archive_package_0526.zip', N'application/zip', 16775046, 'e965cf229ef76865395f3e9b17ceee962511268bc564697f8298f865a274cbdc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -190, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0534.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0534.zip', N'realistic_batch_archive_package_0534.zip', N'application/zip', 16793937, 'be1a7a473ad888091f651c515e9d0b697ac314dd311731972ef5025b3eab9bcb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -191, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0542.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0542.zip', N'realistic_batch_archive_package_0542.zip', N'application/zip', 10743392, '8cfb39d05542ff1b7727a2f649840dd80c19c7bed26a598ffcc8db0a769b61a1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -192, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0550.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0550.zip', N'realistic_batch_archive_package_0550.zip', N'application/zip', 15394884, 'a088916cda6371aedabfab0c9b0fa5d7015abdb166d155e9ab6c5413a777a366', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -193, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0558.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0558.zip', N'realistic_batch_archive_package_0558.zip', N'application/zip', 8741137, '46eb0befe9981752756d88c9953d566d90fe708b6151e6ee51eb3ae2259406ed', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -194, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0566.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0566.zip', N'realistic_batch_archive_package_0566.zip', N'application/zip', 12151904, '641929f609db4688d374b1c5f4e8be0e1e2995b600077238631f55554abe6891', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -195, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0574.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0574.zip', N'realistic_batch_archive_package_0574.zip', N'application/zip', 3346840, 'd78e20f56b3eb655573ceac4931e4f610ad2db2440d8be8e601f3f0e469586ae', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -196, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0582.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0582.zip', N'realistic_batch_archive_package_0582.zip', N'application/zip', 18577963, 'b18d74add09781c7cc23d6720872d9f2063efc86cf0ea1bfb7b30e73c368caa8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -197, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0590.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0590.zip', N'realistic_batch_archive_package_0590.zip', N'application/zip', 9367111, '45c1e088e90ac0eaedda10b0cbdd47c7c344a9920c0a512775d7433ecd92741e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -198, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0598.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0598.zip', N'realistic_batch_archive_package_0598.zip', N'application/zip', 4551020, '967fff9f7fb52fbb1ae0c782871b571690c0c4671bc97620ecabc120985a5105', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -199, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0606.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0606.zip', N'realistic_batch_archive_package_0606.zip', N'application/zip', 4307031, '3db28bbafd9d9213ffdbc31fd27da57c1c59c218e69382f6dfa8a49e5d5bf50e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -200, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0614.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0614.zip', N'realistic_batch_archive_package_0614.zip', N'application/zip', 4729216, '98f373ca071f9a698d6ec1a71d66105feb307c783202b94503f088e7dffc04ad', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -201, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0622.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0622.zip', N'realistic_batch_archive_package_0622.zip', N'application/zip', 6938839, '5ab653919386b4c203b977d1dbeb41975fb95ba5f458a219c8e2df0ea4c4418d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -202, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0630.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0630.zip', N'realistic_batch_archive_package_0630.zip', N'application/zip', 10436952, '42a55ecc920e916772f89ce7f9aa7b67d408e061b09fe1f9b2ecd1af8cd463ee', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -203, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0638.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0638.zip', N'realistic_batch_archive_package_0638.zip', N'application/zip', 16176486, '36fadafbd4feeae6c57cb7b87d56e66b5af5c240663104b927e5b28acc71c0ab', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -204, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0646.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0646.zip', N'realistic_batch_archive_package_0646.zip', N'application/zip', 18469625, '0f60c10c8fd6807f7b5836ce2a6f51e315d24cbdf98b7f8a6007aad42aee1421', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -205, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0654.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0654.zip', N'realistic_batch_archive_package_0654.zip', N'application/zip', 6330437, '1037d0c39e9d39fcc34d30e92d9454acf0d2f202b516d9b8de7fa5a491085443', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -206, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0662.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0662.zip', N'realistic_batch_archive_package_0662.zip', N'application/zip', 16204737, 'bff6460c308cc195f32d216a1e7b50d94a8fac62630a647505e0f8ba9b44102f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -207, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0670.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0670.zip', N'realistic_batch_archive_package_0670.zip', N'application/zip', 6372479, '981583f16fe6385d55d346dcd29a99c347f2a4ec96063f8d7f4fa9dbd7d84f8d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -208, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0678.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0678.zip', N'realistic_batch_archive_package_0678.zip', N'application/zip', 14034578, 'fee5662396280f4ccf4a3fb3158df65ecf3c783632d0eca0f1daa3b0147bfc5f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -209, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0686.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0686.zip', N'realistic_batch_archive_package_0686.zip', N'application/zip', 11046623, 'e2b084bf2815364714fe474c9d5b626fd59e0ad0d54ecff8c80543f5c9094213', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -210, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0694.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0694.zip', N'realistic_batch_archive_package_0694.zip', N'application/zip', 15809497, '87784cdb6387730613b3e62f0497c4155b65a6df17494de6015cc66b6aa103d3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -211, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0702.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0702.zip', N'realistic_batch_archive_package_0702.zip', N'application/zip', 10519286, 'ae2a64a0f6382bc5f56dad0769037be2ae961055bb92a1b99682efad89af92b8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -212, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0710.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0710.zip', N'realistic_batch_archive_package_0710.zip', N'application/zip', 16030770, 'b5b7cad89aecf3658a734c169cb49681045950c1c74914ac39745ab9195614a9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -213, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0718.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0718.zip', N'realistic_batch_archive_package_0718.zip', N'application/zip', 6026220, 'dd04e2fffc1e197b8105d1a3ae0a0fdce99b2279bc9be68ae2bf72f7925beb98', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -214, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0726.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0726.zip', N'realistic_batch_archive_package_0726.zip', N'application/zip', 8188599, '80ad5ac9e2cd287691be4595606958eb53c59f9eb50c99648338093630c73af4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -215, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0734.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0734.zip', N'realistic_batch_archive_package_0734.zip', N'application/zip', 9574324, '86a6f25f9cb60a41021bf3df306cd5309797896ee9efc2fbc89d8f103e7a0bd1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -216, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0742.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0742.zip', N'realistic_batch_archive_package_0742.zip', N'application/zip', 6320953, '0096c659819645c15110526d8b596c784ccff1143b6e6f01200c6c00f84b806a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -217, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0750.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0750.zip', N'realistic_batch_archive_package_0750.zip', N'application/zip', 7887218, 'c0631aff66085a37b981b8f9e428187377edbf230f7de6d3cde261b88512d0c0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -218, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0758.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0758.zip', N'realistic_batch_archive_package_0758.zip', N'application/zip', 3429420, '3a557de414c2b15cd07764d6b01520597cf698f8b283fd5899183a4135ad764a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -219, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0766.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0766.zip', N'realistic_batch_archive_package_0766.zip', N'application/zip', 4082002, 'd7742bc10c164fa2b961cf6efbc5473aad60cc67581484259f90ef66e4007c56', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -220, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0774.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0774.zip', N'realistic_batch_archive_package_0774.zip', N'application/zip', 18650435, '7b4f4b632ea6dedda14cd9f4146702d2392fc66da8ada87bc3e8805ed3da4fab', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -221, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0782.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0782.zip', N'realistic_batch_archive_package_0782.zip', N'application/zip', 16394313, '407b0d3bf06ac1e635e810bf1599f9e7cb923be205d7da14bc6b9883e6636fac', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -222, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0790.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0790.zip', N'realistic_batch_archive_package_0790.zip', N'application/zip', 16130815, 'b0aea71cf85f18661fb20db5a83b518396fafe71112934925efb9973a60a09a7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -223, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0798.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0798.zip', N'realistic_batch_archive_package_0798.zip', N'application/zip', 11348198, '7df0281be10268c843d3abe2e9f6c93177084b17a9bf97c8b55adbd0f6463987', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -224, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0806.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0806.zip', N'realistic_batch_archive_package_0806.zip', N'application/zip', 6079328, 'ee60dc5c7e331a51761d0043b3c9c1b5ddec7cb06b5250511c879d934dc9494c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -225, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0814.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0814.zip', N'realistic_batch_archive_package_0814.zip', N'application/zip', 14830538, '84bff616641653ae988f49aab9d77241e8abebe0490b5171e505019fed6a2afd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -226, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0822.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0822.zip', N'realistic_batch_archive_package_0822.zip', N'application/zip', 4565076, 'c448bc99f55bd6d189312fe9d85b9ec846eaeafe758516136fa671d99e89041c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -227, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0830.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0830.zip', N'realistic_batch_archive_package_0830.zip', N'application/zip', 4724534, 'fba90f02c225b5839b388c37cddbf6f2dcfdd5eb20045a9e0d50dcfc15831eb1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -228, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0838.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0838.zip', N'realistic_batch_archive_package_0838.zip', N'application/zip', 14211226, '39277c6dd29150809b694b507bad5c302420ae23d6b134cab9989afd39e44a59', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -229, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0846.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0846.zip', N'realistic_batch_archive_package_0846.zip', N'application/zip', 13866660, 'd18b746913c3a2b73c96f9edc8ba14a47f990f635ba9e19dfa100400eb7c538e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -230, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0854.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0854.zip', N'realistic_batch_archive_package_0854.zip', N'application/zip', 6296571, '4e9c8549dc3650e790748629c47a16281a3a4023c954ec6e81d2ba104015a2c2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -231, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0862.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0862.zip', N'realistic_batch_archive_package_0862.zip', N'application/zip', 5150239, '865ef92fe92589bf539b82615ad10647970ab0d0c43304f8257f2452d2fa77aa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -232, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0870.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0870.zip', N'realistic_batch_archive_package_0870.zip', N'application/zip', 14051254, '2ba939a4e61e7aa0fb10616240ca9a95909a3b11fcf671bb21432f465d2edab7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -233, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0878.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0878.zip', N'realistic_batch_archive_package_0878.zip', N'application/zip', 14932773, '94bc5c3f094ff06b4873a11b6d8a9b46c1271a0362884c3d526a505898abc479', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -234, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0886.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0886.zip', N'realistic_batch_archive_package_0886.zip', N'application/zip', 13975450, '03c9d473b5d6761d0382ffc72e455ecca7e0c88ed7fbc33bf84acaf1ab7758e1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -235, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0894.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0894.zip', N'realistic_batch_archive_package_0894.zip', N'application/zip', 9663289, '710b95bbd100c5c7083bd1d1836f58f0a78c7ae4b5e85d7562cf452359de7254', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -236, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0902.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0902.zip', N'realistic_batch_archive_package_0902.zip', N'application/zip', 5206049, '53d6eca8d2d28c44d31cb77352c987cf88f1e92a39e4e5867226a958cd6477fa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -237, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0910.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0910.zip', N'realistic_batch_archive_package_0910.zip', N'application/zip', 6562837, '6beaf283f2d3c1ad80fdd8eaae99ea0d03017129a5ce2203d5fd89319eea57f4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -238, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0918.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0918.zip', N'realistic_batch_archive_package_0918.zip', N'application/zip', 17931444, '59ff59039217b37050abd1b772a36faad8223448d3cae26eadcc50547a199300', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -239, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0926.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0926.zip', N'realistic_batch_archive_package_0926.zip', N'application/zip', 13337090, 'f42846e22cefbb0f306ccce453ef0f24980a716e6adf6d2d1a2ecdd739b06cd2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -240, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0934.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0934.zip', N'realistic_batch_archive_package_0934.zip', N'application/zip', 15457395, '9b1043610c29b971d389cfd45102f0d64b9daf145494a23634f049b4d958190c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -241, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0942.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0942.zip', N'realistic_batch_archive_package_0942.zip', N'application/zip', 16174128, '971cf508fdf685d66f1f9fa70e32ad81df8fb83a80a7703eae5305043d13ef34', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -242, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0950.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0950.zip', N'realistic_batch_archive_package_0950.zip', N'application/zip', 3603430, '818df4782c41412b5dd317439659d1cf5aeeb0b282e16483af085887bbd502bd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -243, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0958.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0958.zip', N'realistic_batch_archive_package_0958.zip', N'application/zip', 15434467, '0c39e0af7541fd250ee3d97d6efa2cdc7e3cec061bcf18698d00086b31145826', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -244, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0966.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0966.zip', N'realistic_batch_archive_package_0966.zip', N'application/zip', 3742952, '6456843de7d5c60d188d0078c5be7b02c77ed4bb34973c34faa8d59b46026241', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -245, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0974.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0974.zip', N'realistic_batch_archive_package_0974.zip', N'application/zip', 13442707, 'db5c4bc2c0e8d1c22f340364b313d3d2d97adb7746d80d3308c4d3b41e26d711', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -246, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0982.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0982.zip', N'realistic_batch_archive_package_0982.zip', N'application/zip', 18383269, 'b1cf957bc6d866a039ba665a7d746261a360f4f881f336350ebff59b1701ed3b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -247, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0990.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0990.zip', N'realistic_batch_archive_package_0990.zip', N'application/zip', 12661526, '1127e34a707e2d7c287c98a6d0db40ac42dbef95e8ef27e3704326b01dcab164', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -248, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_archive_package_0998.zip')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_archive_package_0998.zip', N'realistic_batch_archive_package_0998.zip', N'application/zip', 17396205, 'c1ab87628905bdd32a00abf56d7ab66d82006f5263844d7244d9ad8ef9228c0b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -249, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0003.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0003.txt', N'realistic_batch_consulting_note_0003.txt', N'text/plain', 285212, 'b2497cf5bd86ffda5fec89478a7c66f4bc07fae243d967b7f8a48157a2d47599', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -250, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0011.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0011.txt', N'realistic_batch_consulting_note_0011.txt', N'text/plain', 488343, 'fc4b678276ad7b173480ff9146470e8a7c3873e49053c12a2c893b5908d13f14', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -251, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0019.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0019.txt', N'realistic_batch_consulting_note_0019.txt', N'text/plain', 134426, 'bb0d874cef63c3afb6a81c92b1c99b1eae90521312588ac70bbb593b96109067', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -252, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0027.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0027.txt', N'realistic_batch_consulting_note_0027.txt', N'text/plain', 223286, 'c3adc1a530eb594ecad898bd817cb90530b39e1b53bcec678f6a17a056de32d4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -253, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0035.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0035.txt', N'realistic_batch_consulting_note_0035.txt', N'text/plain', 474938, '3977f66e6aa429d4c43527c788ccc7d3ca3b95327a79c1aec5a1aeb8148f9ad8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -254, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0043.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0043.txt', N'realistic_batch_consulting_note_0043.txt', N'text/plain', 428759, '6d3cc0ddbe88ebd0b6652b8a75348bb79c4b0c9421f5a7d7cfde41be999a063d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -255, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0051.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0051.txt', N'realistic_batch_consulting_note_0051.txt', N'text/plain', 196050, '8e1905afc61b016f83da26a365b0990d8ead16b5033f6955a13ed52e4d982a4c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -256, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0059.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0059.txt', N'realistic_batch_consulting_note_0059.txt', N'text/plain', 219284, 'fe0c3a0869485610025770f43753c3be1f90effceec6ddf123db52096fb0ef53', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -257, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0067.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0067.txt', N'realistic_batch_consulting_note_0067.txt', N'text/plain', 311738, 'f5593d807526ff8663d9e9a629c174285569ee3591858806c9f9c5573f42462d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -258, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0075.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0075.txt', N'realistic_batch_consulting_note_0075.txt', N'text/plain', 209200, '6232d2fa935db29c68f7acb4e0a6f9bd7587377036c41b91ab5b7abe374db9e6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -259, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0083.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0083.txt', N'realistic_batch_consulting_note_0083.txt', N'text/plain', 82886, '565bf27ac635422eae1a5a1b9d8de3f3e3c1ca286f1b1f734f79e7aec654dd49', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -260, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0091.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0091.txt', N'realistic_batch_consulting_note_0091.txt', N'text/plain', 490561, 'f263b1929b2e939994b47103c3a37b77d24cee512f9a4ff21b14036e99b646fe', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -261, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0099.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0099.txt', N'realistic_batch_consulting_note_0099.txt', N'text/plain', 35489, '17d583d7f9186bb4728a5eb5cc8ccad8ad1e641b428451c749cbc89d961546c0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -262, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0107.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0107.txt', N'realistic_batch_consulting_note_0107.txt', N'text/plain', 405789, '55cf281e57545b06f9e1eac19b4fc0c973f70fad48d377cdf9d04d23599747d9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -263, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0115.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0115.txt', N'realistic_batch_consulting_note_0115.txt', N'text/plain', 520540, '67380c3849383739f0a0b1975ac1adf2daf0e0d221d889df17fe584a82e8070f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -264, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0123.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0123.txt', N'realistic_batch_consulting_note_0123.txt', N'text/plain', 187776, '4b04e1f19047371765d138ec46ec58b6d071a3ff0f1178d553bfadd955a5d46d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -265, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0131.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0131.txt', N'realistic_batch_consulting_note_0131.txt', N'text/plain', 335022, '236e4c4a92988afe283f01ff3886034ebd2ee707bb970cb11b65e58b47c18f05', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -266, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0139.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0139.txt', N'realistic_batch_consulting_note_0139.txt', N'text/plain', 327890, '4a7e24a9674cd313f8a8426cbbbc37f885c052ea377bb2a3f492787735ccbd3b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -267, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0147.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0147.txt', N'realistic_batch_consulting_note_0147.txt', N'text/plain', 39772, 'da05853b357ae289e785e2efcc622ab08e82ce264a8c0ced79eff9663e707f7a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -268, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0155.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0155.txt', N'realistic_batch_consulting_note_0155.txt', N'text/plain', 384132, '89bbb20d659d5600875d9fcfdd8e4435bd4822bac9e6430a2c1e3574d6e36612', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -269, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0163.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0163.txt', N'realistic_batch_consulting_note_0163.txt', N'text/plain', 433600, '908ab8f3c503067883c28f5b04690e80ceec5813159485c73d5dbc9b3c215829', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -270, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0171.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0171.txt', N'realistic_batch_consulting_note_0171.txt', N'text/plain', 422742, 'afad1b45f24b4026c596d2e1a1ae5374ebc9dd18af2dd8f867adfad9f85cb6c2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -271, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0179.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0179.txt', N'realistic_batch_consulting_note_0179.txt', N'text/plain', 327422, 'd6f53f6bce36cf7dc411aa81014bbbd4b0a961d627650fd5611c075abfeea17f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -272, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0187.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0187.txt', N'realistic_batch_consulting_note_0187.txt', N'text/plain', 40566, '8319079d9a729d9c09d9336e843f1cf6e6304cc4ccd3ae999651b6af2189ca54', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -273, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0195.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0195.txt', N'realistic_batch_consulting_note_0195.txt', N'text/plain', 449590, '55c3386ab88bcc1be3de934dda33a70a0a0f14530be565de4eb5e13027feed5d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -274, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0203.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0203.txt', N'realistic_batch_consulting_note_0203.txt', N'text/plain', 163958, '3c729f55914e3e0ad6beb8791e563224786729358c39b9e1180108a8e0879b40', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -275, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0211.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0211.txt', N'realistic_batch_consulting_note_0211.txt', N'text/plain', 242714, 'c3514db28e32ece116437d98fb74fedf89784326350a104ad8474305b1485c0d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -276, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0219.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0219.txt', N'realistic_batch_consulting_note_0219.txt', N'text/plain', 76352, 'b32c0781fcd51d8ffea39a994a0011fc9faaf796ee57b63dec9c1eccff4d7bb2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -277, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0227.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0227.txt', N'realistic_batch_consulting_note_0227.txt', N'text/plain', 354264, '1c5019595762789c5569bf6f62237feb84ac526e6f753c5f8e84e7089a2ffafa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -278, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0235.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0235.txt', N'realistic_batch_consulting_note_0235.txt', N'text/plain', 141874, '6d408aea862d0edf94919a1d4874c0ee5c1a2c5f7cf6ddfb4d734ee0fc8a1bc5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -279, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0243.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0243.txt', N'realistic_batch_consulting_note_0243.txt', N'text/plain', 189063, '2b2a6ce9c8603ed149649e55a4fe9bddd072fde8a1bdf1f248fcc76c7e243d79', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -280, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0251.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0251.txt', N'realistic_batch_consulting_note_0251.txt', N'text/plain', 289969, 'bcaa7705cb579c1a0cdeff1bb99a647843382e9e66d87fec0a13484f0ba2826f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -281, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0259.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0259.txt', N'realistic_batch_consulting_note_0259.txt', N'text/plain', 455421, '01fca28ece11b6f9a78a1e136e15b4780515fec39664954124c247d570c33593', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -282, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0267.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0267.txt', N'realistic_batch_consulting_note_0267.txt', N'text/plain', 355780, '50f51d4626a35bd95e9053926eeb610132867704db255ba1a8e1e9e45fbaace9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -283, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0275.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0275.txt', N'realistic_batch_consulting_note_0275.txt', N'text/plain', 510601, '7fb8e9017f34f1338ed2284a3ece4c4dfe48e66873b75ba599e643e2c1d16e44', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -284, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0283.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0283.txt', N'realistic_batch_consulting_note_0283.txt', N'text/plain', 409235, 'b5b627e0bc576b494993b4b455212c7b1520c0eca8d7671cb9fdd75633fdeb16', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -285, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0291.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0291.txt', N'realistic_batch_consulting_note_0291.txt', N'text/plain', 377424, '5cd52b8a9ba8ddaa5ad01f120e989e6996588ac0e097ae65693355c84fe2cdf2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -286, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0299.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0299.txt', N'realistic_batch_consulting_note_0299.txt', N'text/plain', 503580, 'eb1e84236a882ae28a2e789b7ed51cdf6f7a5545233034efac7335dbfa2840fa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -287, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0307.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0307.txt', N'realistic_batch_consulting_note_0307.txt', N'text/plain', 259292, '896c1ef2618d423b24d000000ffbbef2fcab26fe7a54b43141e2ef312c3dfaa9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -288, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0315.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0315.txt', N'realistic_batch_consulting_note_0315.txt', N'text/plain', 485728, '25ebc6dd3bf9d5546bdbbff4da067beec6518cdc8af28e251f368aa523d88b4b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -289, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0323.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0323.txt', N'realistic_batch_consulting_note_0323.txt', N'text/plain', 351079, 'b83858b9e6bab6a5e507a8b4308d501c42cc3119950da9cda1488ca2ce7af8ec', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -290, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0331.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0331.txt', N'realistic_batch_consulting_note_0331.txt', N'text/plain', 418631, 'bb3c8bb584a8c8ec6bd4cf80f74365bcce17c5e13128fa3a9264d29e287bd4b0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -291, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0339.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0339.txt', N'realistic_batch_consulting_note_0339.txt', N'text/plain', 470899, '590ca807c6c435ca650103130868e980935553e8b1e1f425ba7499e6a883858e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -292, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0347.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0347.txt', N'realistic_batch_consulting_note_0347.txt', N'text/plain', 163732, '4b86f1f93a1dbf1a2deb92f5f4b3473ade96296f65d4c414926d61a83694d5e3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -293, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0355.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0355.txt', N'realistic_batch_consulting_note_0355.txt', N'text/plain', 316103, '33ff3d8497036d571c2d2036dae3b821ca70a2c9c8e456a9a8118f1a4072a41a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -294, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0363.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0363.txt', N'realistic_batch_consulting_note_0363.txt', N'text/plain', 373443, '74caa3845c2aa9b99eb57fd47c56347768a4425ae988cb9b9e80195baa9f8e1e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -295, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0371.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0371.txt', N'realistic_batch_consulting_note_0371.txt', N'text/plain', 327136, 'b350ab7d9e5f97b43fd5e182311f15be46c2bb7721881243027eb200705ecb1a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -296, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0379.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0379.txt', N'realistic_batch_consulting_note_0379.txt', N'text/plain', 360696, '2956ce25444e5e2e39b498af1678d5a15c8af12a6ec2a0430eb1ad9d1a5b16be', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -297, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0387.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0387.txt', N'realistic_batch_consulting_note_0387.txt', N'text/plain', 235398, '21d3980928b496423e5e0e3a9098b647e350195de74d38f09a976c31495ca658', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -298, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0395.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0395.txt', N'realistic_batch_consulting_note_0395.txt', N'text/plain', 487549, 'e1fb71047250f3989f9ee451f0def77dcfffdd60d1e4429a85172df1737363ea', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -299, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0403.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0403.txt', N'realistic_batch_consulting_note_0403.txt', N'text/plain', 44643, '09425335f534659394d5e2c0853617b07948f312f91a03caad207007aa6f3c62', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -300, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0411.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0411.txt', N'realistic_batch_consulting_note_0411.txt', N'text/plain', 300277, '50dec0364e35ba7bce968403036da60fcdc57f1c27a70f6a91eb7acfdc82d840', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -301, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0419.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0419.txt', N'realistic_batch_consulting_note_0419.txt', N'text/plain', 473963, '6b7aed9358279ad0caeacf06d7f76eb87b357489727fa0a08e448f7081205342', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -302, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0427.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0427.txt', N'realistic_batch_consulting_note_0427.txt', N'text/plain', 499224, 'a23969de292cf5c4e56d484f29dea1386ab4fd0586ee79c974879988294080f2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -303, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0435.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0435.txt', N'realistic_batch_consulting_note_0435.txt', N'text/plain', 119881, '3e615aca07b2a936253e14813a40fd247a0bcb28a7f9078f3e449e59231e38f4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -304, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0443.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0443.txt', N'realistic_batch_consulting_note_0443.txt', N'text/plain', 365410, 'a1c11cb206c08a6da3c151d74a36bf17991c49b44b01bc89630e171a92b48c28', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -305, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0451.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0451.txt', N'realistic_batch_consulting_note_0451.txt', N'text/plain', 499900, '2721178a86d622de9502434d708cea3f5a30828dfc95d48c63822ec8c0e6eaf0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -306, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0459.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0459.txt', N'realistic_batch_consulting_note_0459.txt', N'text/plain', 277093, '75baa60707ea819d29644d706a000dcae87a8da9867cbce2131736e29ab0f8f8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -307, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0467.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0467.txt', N'realistic_batch_consulting_note_0467.txt', N'text/plain', 479149, 'c63370794ee30e6e09a6f7d546314d8aa16eede7fe0f1b394b844fe91598081f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -308, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0475.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0475.txt', N'realistic_batch_consulting_note_0475.txt', N'text/plain', 234543, '9ff990e63d346ed1eb248ef46eea9962eea3469a5a8bf23ee8ecee91084382eb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -309, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0483.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0483.txt', N'realistic_batch_consulting_note_0483.txt', N'text/plain', 66562, '568e5c95f0da874321b46a3ddf5cb3316470a8497542c57079f72f34c1a723cb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -310, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0491.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0491.txt', N'realistic_batch_consulting_note_0491.txt', N'text/plain', 398878, 'ad9f69bb8747f93c437edda495a29bb3fbcfbed8a66d09d5da1be16b1cce7176', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -311, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0499.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0499.txt', N'realistic_batch_consulting_note_0499.txt', N'text/plain', 457929, '797c50607aaeeac72cd5adf56c519ba540b4c1d5481bc339fa68b091671cc199', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -312, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0507.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0507.txt', N'realistic_batch_consulting_note_0507.txt', N'text/plain', 500579, '194c9dc3cd328638e9d12d3bc6c620ece89e3ed41a45e0b3f146d8144e4e4960', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -313, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0515.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0515.txt', N'realistic_batch_consulting_note_0515.txt', N'text/plain', 184791, '4a52768fdd0232f3716236ead8e51c259a66c7b3ed4cf3e9d9e2d0708a45ccdd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -314, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0523.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0523.txt', N'realistic_batch_consulting_note_0523.txt', N'text/plain', 61375, '6188aeb531fe797d62b7d7c66271eebc1cd5b63e3144659e6accb83b16eecc39', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -315, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0531.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0531.txt', N'realistic_batch_consulting_note_0531.txt', N'text/plain', 436765, '306f1b87dbcf92effafc8635d5a49587d0666d765292a51a6dcab8292f0eb9e7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -316, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0539.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0539.txt', N'realistic_batch_consulting_note_0539.txt', N'text/plain', 320893, '94072ec152b7d5d8587ee8889e2b3b83ea695adcbfe00d9cfb195dc33ba33ff6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -317, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0547.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0547.txt', N'realistic_batch_consulting_note_0547.txt', N'text/plain', 306020, '59a2f32a4438d149ab6e170b9913e12c30ec1f0268697091ff4d3eae5bb9dfc8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -318, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0555.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0555.txt', N'realistic_batch_consulting_note_0555.txt', N'text/plain', 329842, '671c88565b6460ea2ae78142204d4b47892f627ed214383f29d63e7cafb0fb68', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -319, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0563.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0563.txt', N'realistic_batch_consulting_note_0563.txt', N'text/plain', 223480, 'de7423720ecf6b08e71dd576c604dcfb0e259f9cb0c2e67031fb21ee2a289a13', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -320, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0571.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0571.txt', N'realistic_batch_consulting_note_0571.txt', N'text/plain', 238579, '5c16fe2ac42dc0bf48dc43b1efb2848ac1e9e2078d0244828d6ba121674095ab', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -321, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0579.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0579.txt', N'realistic_batch_consulting_note_0579.txt', N'text/plain', 277451, 'ab02bb9c36ab15a225f2cf41516a115285e2f0ff4d5aeda935476c80fb8b604e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -322, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0587.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0587.txt', N'realistic_batch_consulting_note_0587.txt', N'text/plain', 56361, '5cd409f21c8963707ad19e934f5eed0afd3bab57b662a69973082a587dadfb45', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -323, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0595.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0595.txt', N'realistic_batch_consulting_note_0595.txt', N'text/plain', 133792, 'e8977cc8abc4b8302f677603db012df5b171de7a2fa99900801fbdc85e531697', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -324, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0603.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0603.txt', N'realistic_batch_consulting_note_0603.txt', N'text/plain', 285212, 'ceeb1d8b8387121579c3680309fc67e06b563bb7ad8f74e111c3acd97f51cde4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -325, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0611.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0611.txt', N'realistic_batch_consulting_note_0611.txt', N'text/plain', 488343, '39bcef2cc0812c9dcdfb73be0be75c2d54b14d1ac586dfb3af22077826350b85', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -326, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0619.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0619.txt', N'realistic_batch_consulting_note_0619.txt', N'text/plain', 134426, 'c1363662f6c5ed9524f05732df7bd83dbbdc33a2ebdf11e78f277082cd15fefe', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -327, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0627.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0627.txt', N'realistic_batch_consulting_note_0627.txt', N'text/plain', 223286, 'c846f5612f1a63d67e39f7cbca3358b42414a88fce1286afd12438f09d8e8d30', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -328, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0635.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0635.txt', N'realistic_batch_consulting_note_0635.txt', N'text/plain', 474938, 'ab9c1a2c4f5c9827f0941802fc1bc7306d81185b79f09fe9155727bfc0b482a1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -329, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0643.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0643.txt', N'realistic_batch_consulting_note_0643.txt', N'text/plain', 428759, 'ccb3c1836a46eb0863c0c1fda213bfabc0295159dc677c912a931fe0fcc18447', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -330, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0651.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0651.txt', N'realistic_batch_consulting_note_0651.txt', N'text/plain', 196050, 'ecc94a219de29a3f3e8854374cef07fd2250c6f1c786ad69f892c0c2da4fd9c8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -331, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0659.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0659.txt', N'realistic_batch_consulting_note_0659.txt', N'text/plain', 219284, '911d23040434b32859f396b4a479422b5fa306ccb2db8ac6756ad424ac153918', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -332, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0667.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0667.txt', N'realistic_batch_consulting_note_0667.txt', N'text/plain', 311738, 'ef0de8dc2439f3c7e242c10845315f525741abc55858b91db7ba4302a054afd9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -333, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0675.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0675.txt', N'realistic_batch_consulting_note_0675.txt', N'text/plain', 209200, 'e214632ad1bcaf4f14ff51cc9273069380b077c0ea693e9548d5cfc2613c8171', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -334, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0683.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0683.txt', N'realistic_batch_consulting_note_0683.txt', N'text/plain', 82886, '4d57fb4583fdc63359502280ff47d78b33994595deb64b5949757ded3a6617e7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -335, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0691.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0691.txt', N'realistic_batch_consulting_note_0691.txt', N'text/plain', 490561, '8a596eb0641ab344d7faedabcce83179b34567f2c4ccaeeca9942c47a118dcaa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -336, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0699.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0699.txt', N'realistic_batch_consulting_note_0699.txt', N'text/plain', 35489, '96c46efb1fde74c425e1b9870824a0517082e3101bce258499eb2b81056ad540', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -337, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0707.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0707.txt', N'realistic_batch_consulting_note_0707.txt', N'text/plain', 405789, 'bb6ebba130e165279312ab3d63c1d60b92ab573d0e509b6d99fbf5c69391ca96', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -338, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0715.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0715.txt', N'realistic_batch_consulting_note_0715.txt', N'text/plain', 520540, 'a183f4e57d3ad3bd70a8aebf884692b9b9f7d8fe062e0aebf8f14f1debb3fa1d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -339, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0723.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0723.txt', N'realistic_batch_consulting_note_0723.txt', N'text/plain', 187776, '83b4c93a71cd1499ad23e0f55601e565289a722a3e173a7609521281d9f05e04', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -340, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0731.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0731.txt', N'realistic_batch_consulting_note_0731.txt', N'text/plain', 335022, '2ec921b8813ed3b3280ba00c7c95baa876bb7da53d97c12b675b17ad4a77eb3a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -341, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0739.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0739.txt', N'realistic_batch_consulting_note_0739.txt', N'text/plain', 327890, '28973f563ec56f2a1032bce8e3c96ad6bfb3dc50992dbc51f4254af1e17fa8fd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -342, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0747.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0747.txt', N'realistic_batch_consulting_note_0747.txt', N'text/plain', 39772, '135ca94eb23f151e984d727c742f943a1a258ef8bcad51afcfa2284b13f2a3ce', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -343, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0755.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0755.txt', N'realistic_batch_consulting_note_0755.txt', N'text/plain', 384132, '22f0a42ed502529eaae47ca55853ccd26c0027ef43e7f6ab98f54952a0ca88ef', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -344, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0763.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0763.txt', N'realistic_batch_consulting_note_0763.txt', N'text/plain', 433600, '3f1b06364bb6ddd5a37e4f93674da8357410e4521728ab2ca79a81bf348b6f1b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -345, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0771.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0771.txt', N'realistic_batch_consulting_note_0771.txt', N'text/plain', 422742, 'ec5285217bb641abe69563157e20675bb3635b0113123ff8bd76c85c23885387', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -346, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0779.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0779.txt', N'realistic_batch_consulting_note_0779.txt', N'text/plain', 327422, '2cd5abfab3fb5cf2857c34117079d9f8121897e9c03a1b4881e6720b069b51f5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -347, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0787.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0787.txt', N'realistic_batch_consulting_note_0787.txt', N'text/plain', 40566, '1c2b4b6a745428f7cfb55b974c8a0e141b2831f231d6186c32a148ebc6e67566', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -348, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0795.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0795.txt', N'realistic_batch_consulting_note_0795.txt', N'text/plain', 449590, 'cdf2d31e76905ae84a8019b1aaa0f0b6370587d0a15b037ee0adba4b6648011c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -349, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0803.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0803.txt', N'realistic_batch_consulting_note_0803.txt', N'text/plain', 163958, 'd5d417b19d98173c863885206b3647d3fbd4be3517f108e001c89da63dbcb487', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -350, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0811.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0811.txt', N'realistic_batch_consulting_note_0811.txt', N'text/plain', 242714, '64213a2829abae69d7eadb0daeedc3a7969218755dae99f883455991180015c9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -351, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0819.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0819.txt', N'realistic_batch_consulting_note_0819.txt', N'text/plain', 76352, '245c398610473972d289201221168fdc91fd8d0c87ec909ca2a268ce4858866e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -352, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0827.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0827.txt', N'realistic_batch_consulting_note_0827.txt', N'text/plain', 354264, 'f37810ff2aa28c3ae699e569558cf4f396866a5d60fd3357be19b85169ff8f6a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -353, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0835.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0835.txt', N'realistic_batch_consulting_note_0835.txt', N'text/plain', 141874, 'b04b03f31fa53d9294c12719f3085c7ce40d8bd24fb7efcd06c794ab00fae15d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -354, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0843.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0843.txt', N'realistic_batch_consulting_note_0843.txt', N'text/plain', 189063, '8b2dfeb251a7a7c79e8a7f896f3d888585dc3e49f06b109bdb60097d79d5d96b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -355, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0851.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0851.txt', N'realistic_batch_consulting_note_0851.txt', N'text/plain', 289969, 'be943edce7be415d85a3ab0995280b2d9d372dbae0ff2595b283018978dac0df', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -356, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0859.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0859.txt', N'realistic_batch_consulting_note_0859.txt', N'text/plain', 455421, '72af3c888803a79445fea71c46aff063e0ffc8cadef6cb4c6c9545b9eca2159a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -357, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0867.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0867.txt', N'realistic_batch_consulting_note_0867.txt', N'text/plain', 355780, '835f0153008ba660490e536cbf284a49f4edffb6eda939608caf8b971eacce7b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -358, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0875.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0875.txt', N'realistic_batch_consulting_note_0875.txt', N'text/plain', 510601, '79e08da7815136a4bbc71f203fcf6cf53bceba32fdc3bd7041398b0330d9befc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -359, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0883.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0883.txt', N'realistic_batch_consulting_note_0883.txt', N'text/plain', 409235, '8fd80f829901d5336620ab607567c29db82c47320306737e00fcb32900461064', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -360, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0891.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0891.txt', N'realistic_batch_consulting_note_0891.txt', N'text/plain', 377424, 'a40f21ec51835dfbbd1e7cfb7a2ac87df9e0bb78bba81b26580ce93758d6c933', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -361, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0899.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0899.txt', N'realistic_batch_consulting_note_0899.txt', N'text/plain', 503580, '7ef357736243b34414448ba566e5901e6e238c31da984466a08e2252aa27c3d8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -362, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0907.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0907.txt', N'realistic_batch_consulting_note_0907.txt', N'text/plain', 259292, '22fabadd6a8080296ccaa9cbfefe9c31150b5d9464bbc7677ee4c855f5cd65ef', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -363, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0915.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0915.txt', N'realistic_batch_consulting_note_0915.txt', N'text/plain', 485728, '88af6dac8a8fdae201e3d8627adaae3e931173acbcfd10997b08463868f4b81c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -364, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0923.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0923.txt', N'realistic_batch_consulting_note_0923.txt', N'text/plain', 351079, '318c85001aec642f7acbe9408b0cf9ffc6f30a6f46bcce88160cca1a818a248f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -365, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0931.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0931.txt', N'realistic_batch_consulting_note_0931.txt', N'text/plain', 418631, '196a8f1dba3ae41166356f4e8e232e9f3b0c9ce94e1e6e7e802c605fce09308c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -366, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0939.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0939.txt', N'realistic_batch_consulting_note_0939.txt', N'text/plain', 470899, '6cd6a5e9538ea9bc656d5efbdc4a29fa070771ddf0b0d988c532355c676c90b8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -367, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0947.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0947.txt', N'realistic_batch_consulting_note_0947.txt', N'text/plain', 163732, '4f9e9ed333b5ee6c08bcd84448eb17e841ef3af38497cb21c9982997b8549738', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -368, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0955.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0955.txt', N'realistic_batch_consulting_note_0955.txt', N'text/plain', 316103, '0c2baf504c45bf5416dc05575627a13ddd6acd3e015cc1ef1855981159407785', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -369, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0963.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0963.txt', N'realistic_batch_consulting_note_0963.txt', N'text/plain', 373443, 'df65db1dfe2c281afd9b2cdf4ba57bcb9a9b73c78a49f88a150b29582a2a413a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -370, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0971.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0971.txt', N'realistic_batch_consulting_note_0971.txt', N'text/plain', 327136, 'c5b17b8537317fdbf42fd71c7fc9b5cd73e59c5e133e6f4b1364da956d8fde4d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -371, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0979.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0979.txt', N'realistic_batch_consulting_note_0979.txt', N'text/plain', 360696, '6f836c05fdc59415b2590dda23c818b296dab91829e6279d1e4b94df2c8b902d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -372, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0987.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0987.txt', N'realistic_batch_consulting_note_0987.txt', N'text/plain', 235398, '2f1edc4d86a49143e94b8f7e09ccea1d5c4df7012041410fd17b9ab852750f70', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -373, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_consulting_note_0995.txt')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_consulting_note_0995.txt', N'realistic_batch_consulting_note_0995.txt', N'text/plain', 487549, 'c3c151172ba0c48197f7c96e839a05d602c8f9cf9e99bf80a4519df1c9d34804', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -374, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0005.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0005.pdf', N'realistic_batch_contract_scan_0005.pdf', N'application/pdf', 2033133, '556cd2efe0c9568171bfd9ea1c5bf206b841a74cc7acf3586da83b2f16fb075e', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -375, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0013.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0013.pdf', N'realistic_batch_contract_scan_0013.pdf', N'application/pdf', 1695967, 'dd90442a0271ebab9e2bf53dc4930de08048e1394b6059248deda6a3a1568555', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -376, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0021.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0021.pdf', N'realistic_batch_contract_scan_0021.pdf', N'application/pdf', 1572095, 'ddb2cbfd57a9380ac4c84efe2943f1435a9f4d7a42a2084cfdede970e5bef759', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -377, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0029.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0029.pdf', N'realistic_batch_contract_scan_0029.pdf', N'application/pdf', 6619977, '1bfde18b256b15aef7054ce3afe5c7cc55512898f2f66c83b772d0e896cbffdd', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -378, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0037.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0037.pdf', N'realistic_batch_contract_scan_0037.pdf', N'application/pdf', 1468516, '297768d8479f56f025a51dbe2040c0fbfc11cb982af2ce6467a44929bbfdbd06', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -379, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0045.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0045.pdf', N'realistic_batch_contract_scan_0045.pdf', N'application/pdf', 10031507, '1b87eef41a3bbac0952e2d3ae7144f6cf632f8878e14883c0314ed919097447a', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -380, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0053.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0053.pdf', N'realistic_batch_contract_scan_0053.pdf', N'application/pdf', 2497569, '9f871cce341bcea14dacc9ef619d6b8d8b3f299e1f862cfbad5c2ec8ab154e5f', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -381, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0061.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0061.pdf', N'realistic_batch_contract_scan_0061.pdf', N'application/pdf', 7069582, '5a883005cc3e200f749afe2eba5b33a50e39f3f2f5453d0c6c0df76a3b9360ba', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -382, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0069.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0069.pdf', N'realistic_batch_contract_scan_0069.pdf', N'application/pdf', 2479695, '31fa754e2b67c39cf2b952314bf3a37d2c775f4478c9ba54e5922508317e787b', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -383, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0077.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0077.pdf', N'realistic_batch_contract_scan_0077.pdf', N'application/pdf', 4770452, '71fe89e577790703f7a064d3d1364feac62132f668d489be024075b514046954', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -384, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0085.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0085.pdf', N'realistic_batch_contract_scan_0085.pdf', N'application/pdf', 1516105, 'd7ff1cd45abb8fbc5449cbbf4c7c761ee2aafc47809c13dc8e53a7b7028d081b', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -385, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0093.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0093.pdf', N'realistic_batch_contract_scan_0093.pdf', N'application/pdf', 4702682, '982608fd0a426d3130972ec49290dc111b8b839f7aef53bbc0dc9c3087e599c2', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -386, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0101.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0101.pdf', N'realistic_batch_contract_scan_0101.pdf', N'application/pdf', 4370488, 'ca6f6d922f335fa9cc8e7218c384b46df2c822830a36ce758088f111b4f708fa', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -387, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0109.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0109.pdf', N'realistic_batch_contract_scan_0109.pdf', N'application/pdf', 8622966, '538d891489788d8bc0c2b08736f5c1845f8472bfda2255b9254adc3161f219cb', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -388, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0117.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0117.pdf', N'realistic_batch_contract_scan_0117.pdf', N'application/pdf', 7353267, '56d8c223a06c3acca2fc9e47447160535394c01204d45312b839f1487ef9a095', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -389, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0125.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0125.pdf', N'realistic_batch_contract_scan_0125.pdf', N'application/pdf', 3218869, '90544c09f450e7ca9c7e99e7f1ceb11ea8d344f69ccc51cac34fbfdec2660105', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -390, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0133.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0133.pdf', N'realistic_batch_contract_scan_0133.pdf', N'application/pdf', 6893674, 'd1b5bc7e1295609cb76b61ea013f3966a005b590f34c2edd2bc8aefef7a5c9ae', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -391, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0141.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0141.pdf', N'realistic_batch_contract_scan_0141.pdf', N'application/pdf', 7815400, '7ea51d7a057d7060475635c63dace4e15f9c56ced1e7cb9c623488b463553ec0', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -392, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0149.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0149.pdf', N'realistic_batch_contract_scan_0149.pdf', N'application/pdf', 8617002, 'deb6108864622ac9a34a59f685bb8ea9fadd96597f7a0de8593ca598645e2975', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -393, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0157.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0157.pdf', N'realistic_batch_contract_scan_0157.pdf', N'application/pdf', 1727939, 'd98934707ae7b0b342445669683dcb14b2fcf538570c901e7541ce8e9492856e', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -394, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0165.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0165.pdf', N'realistic_batch_contract_scan_0165.pdf', N'application/pdf', 2376463, '2350a844d9b9486861c7f0aa680699ba85a9fed9277c57570f6c5372bad8f672', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -395, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0173.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0173.pdf', N'realistic_batch_contract_scan_0173.pdf', N'application/pdf', 6139383, '535880da0795393ed77b6b4aeee561b68db60731275c58cb26e8b3f78475b77f', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -396, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0181.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0181.pdf', N'realistic_batch_contract_scan_0181.pdf', N'application/pdf', 3108557, '5cbd3a264a3c60a15d95e5e21e6d3d958ddc1658add16353b4657fe36522c381', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -397, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0189.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0189.pdf', N'realistic_batch_contract_scan_0189.pdf', N'application/pdf', 7300951, 'e8370ed47234eba02766e4d194f5cdbdf7637e320d613855f1de3468b363429d', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -398, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0197.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0197.pdf', N'realistic_batch_contract_scan_0197.pdf', N'application/pdf', 4285682, 'e821e0f363e77cdcc4bde288886e03f3e0735f5e8047127084f45fb9531cd0aa', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -399, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0205.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0205.pdf', N'realistic_batch_contract_scan_0205.pdf', N'application/pdf', 5487216, '17eb316f8e7bfb72d8e346fbe88737bf77bd25d59711e6f4bb618e1b0c05594e', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -400, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0213.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0213.pdf', N'realistic_batch_contract_scan_0213.pdf', N'application/pdf', 4503772, '70d659c4b1cd240ce1cd7e3d5f7f6c346e502ef34ec3710597c7a3a94721f196', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -401, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0221.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0221.pdf', N'realistic_batch_contract_scan_0221.pdf', N'application/pdf', 10453859, '7f3bc527d4b84b7108e5b6dabd98c30eed892f53dbccd87beca873a2b0782808', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -402, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0229.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0229.pdf', N'realistic_batch_contract_scan_0229.pdf', N'application/pdf', 1824239, 'a845a517848ea2356fcf799eac0cc1d4612743488ca48d7817bf436ff0668f77', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -403, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0237.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0237.pdf', N'realistic_batch_contract_scan_0237.pdf', N'application/pdf', 5908520, '5b591067b8cd852996164fe415e9f71ecb63b859daa03dd72e418c162e22717d', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -404, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0245.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0245.pdf', N'realistic_batch_contract_scan_0245.pdf', N'application/pdf', 4221519, 'd4fc4d62c1d5539419125ea817380628be74479b0f9d60df59517cb573b69e30', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -405, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0253.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0253.pdf', N'realistic_batch_contract_scan_0253.pdf', N'application/pdf', 4403583, '76764f3f668de1caa641f3a3d5c3dac49ff44af5eba4d3d8294ae06b79ff7fd0', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -406, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0261.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0261.pdf', N'realistic_batch_contract_scan_0261.pdf', N'application/pdf', 5663956, '28d68dba922fbd342f7adaf88a647a57347827530db5cf10e08edcc5ee1af47d', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -407, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0269.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0269.pdf', N'realistic_batch_contract_scan_0269.pdf', N'application/pdf', 5344380, '192dda88ef20e0b02723bcea93e3489b942c9d0f523ebbb0248dddf8f6d93013', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -408, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0277.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0277.pdf', N'realistic_batch_contract_scan_0277.pdf', N'application/pdf', 7893564, '209630e75696eaeb61fb99a94a7ace4c52273c64d07fac0e13cadd2fd5626047', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -409, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0285.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0285.pdf', N'realistic_batch_contract_scan_0285.pdf', N'application/pdf', 6046917, '45f680620471dccf7634ba72abf0feb0f94b66491a9247dd1612c64309201c93', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -410, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0293.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0293.pdf', N'realistic_batch_contract_scan_0293.pdf', N'application/pdf', 8861672, 'd499b82b8b8c1cf5eaee328add5db70aae2ef877037d0252ab0ff43c309ecbce', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -411, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0301.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0301.pdf', N'realistic_batch_contract_scan_0301.pdf', N'application/pdf', 605211, '9f59c84a3f46e3ba19275c36b823966b51f39e323324f890a46b593ff2df90e7', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -412, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0309.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0309.pdf', N'realistic_batch_contract_scan_0309.pdf', N'application/pdf', 2783985, '6656fffc5b5909316017d273683fe3c5301f2d9f3ed9136af08d1f826b2b8711', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -413, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0317.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0317.pdf', N'realistic_batch_contract_scan_0317.pdf', N'application/pdf', 4014513, 'b5ecd99ddde7838efea85cd6cc84f2efb98051ab0b465f1b1b1de342eeda4a0b', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -414, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0325.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0325.pdf', N'realistic_batch_contract_scan_0325.pdf', N'application/pdf', 10265821, '4e616e712c8a9d349fccacfc012f2960653257abae33a62e6cd9d60f66967d2b', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -415, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0333.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0333.pdf', N'realistic_batch_contract_scan_0333.pdf', N'application/pdf', 8389111, 'f81b06f26ac3b8b674a79e8085fd72f2162749357aef53c92a84616a76cd32e8', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -416, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0341.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0341.pdf', N'realistic_batch_contract_scan_0341.pdf', N'application/pdf', 2536470, '645b782d4a3b2901740a738ba66721f5cff65be47336a4526edb4c0102d08987', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -417, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0349.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0349.pdf', N'realistic_batch_contract_scan_0349.pdf', N'application/pdf', 5396327, '8787d82b0a0a028aa3d6b57a8984d47fce262e0ab4ab319fe37fddc0f32bf457', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -418, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0357.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0357.pdf', N'realistic_batch_contract_scan_0357.pdf', N'application/pdf', 5172350, '627b4dfe0fb4c7b7eae80e8e9dd506cf3f2d0194934c6f58b6988d61257e59c3', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -419, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0365.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0365.pdf', N'realistic_batch_contract_scan_0365.pdf', N'application/pdf', 4727799, 'a7741b2033b3f3aee0a91da0966bcc344ec67bc3ad6e696e80f2f7d7f0c39370', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -420, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0373.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0373.pdf', N'realistic_batch_contract_scan_0373.pdf', N'application/pdf', 957581, '084a119f1167ef573355c58bcf30dbd132781dc7deee1f8a87cea064af8c109a', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -421, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0381.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0381.pdf', N'realistic_batch_contract_scan_0381.pdf', N'application/pdf', 3976647, '10dd729155583f8fc08c5b5fcaefbb4c2b3813844718cd2b60c8c2aec232b30c', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -422, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0389.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0389.pdf', N'realistic_batch_contract_scan_0389.pdf', N'application/pdf', 2378505, 'ae79b588b62aee20d190fa8024bf3a83c91119a367c1b0162317fe6576b7425c', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -423, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0397.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0397.pdf', N'realistic_batch_contract_scan_0397.pdf', N'application/pdf', 1725673, 'ca58178f0de66752bfa0d1d962dec9eed9f93dad6dc2fe677d7d1f86a5319563', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -424, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0405.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0405.pdf', N'realistic_batch_contract_scan_0405.pdf', N'application/pdf', 4619501, 'bd989cacc281c4a20da4dc1c6cc360a0897f869565bea7c1feba582b550bccdd', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -425, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0413.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0413.pdf', N'realistic_batch_contract_scan_0413.pdf', N'application/pdf', 1503261, 'ee95a12d07311e82c0fb2a9e1340fc28d818416d25a9ab762fc6dfd31ed6a353', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -426, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0421.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0421.pdf', N'realistic_batch_contract_scan_0421.pdf', N'application/pdf', 6478552, '12fa3e82d59435440232418040c460c3e0c4adcbb80d71b57a6489c04e20b0d9', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -427, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0429.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0429.pdf', N'realistic_batch_contract_scan_0429.pdf', N'application/pdf', 7754825, '68280d4360fee9a8df0702eb5a634d898508043a3ecf2ed6b3516045895886a6', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -428, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0437.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0437.pdf', N'realistic_batch_contract_scan_0437.pdf', N'application/pdf', 9471164, '6c2c0a51b710deca2613345c75d179419b3e85fc6881722c47b87ca903a7a13f', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -429, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0445.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0445.pdf', N'realistic_batch_contract_scan_0445.pdf', N'application/pdf', 913241, 'edaea3b5cb4c340528b70164430ca15413b376bba8101202dfbccf6f55ca9276', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -430, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0453.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0453.pdf', N'realistic_batch_contract_scan_0453.pdf', N'application/pdf', 559466, '758aa7d725e3deb38be19eb4aa71e6eaa1cbbbc3285c2299cd249ba592402bb1', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -431, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0461.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0461.pdf', N'realistic_batch_contract_scan_0461.pdf', N'application/pdf', 7877579, '4fc9c30a9097715d0a5223b42eae2e6bc00cefff1694afe44027550caac65539', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -432, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0469.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0469.pdf', N'realistic_batch_contract_scan_0469.pdf', N'application/pdf', 4853495, '1d8b2ae6b827441b46255907f8b01e265acf5c26ff0b40560106af915fa252c2', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -433, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0477.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0477.pdf', N'realistic_batch_contract_scan_0477.pdf', N'application/pdf', 5506750, '46dc1018768557ef3f7fa83f8709bb7745d7e480279de9f91ae3c2bfa88d9792', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -434, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0485.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0485.pdf', N'realistic_batch_contract_scan_0485.pdf', N'application/pdf', 4511731, 'd0ff0ab6f04525a12f3fdb611ec082039ee42512e04327cebb69510772c0c83a', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -435, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0493.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0493.pdf', N'realistic_batch_contract_scan_0493.pdf', N'application/pdf', 995931, 'fae947d1591ea5b2a1353b02a3640300bcfe9e457cc67fef97d1c83595efb355', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -436, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0501.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0501.pdf', N'realistic_batch_contract_scan_0501.pdf', N'application/pdf', 9185318, 'a50751638dab9e40bd1253ce668ca8b183bed0c5a825f5dd99e69f1442d66f4b', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -437, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0509.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0509.pdf', N'realistic_batch_contract_scan_0509.pdf', N'application/pdf', 4124512, '2a5ac8bcb13ed32f7dc137fca6fd5e3b0e04f70f8c590ae0e7475182c43a82ba', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -438, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0517.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0517.pdf', N'realistic_batch_contract_scan_0517.pdf', N'application/pdf', 5607152, '1abac438f68ef1adaed5da3330cd55b50062731a8a2e0d82906eeea841791ead', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -439, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0525.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0525.pdf', N'realistic_batch_contract_scan_0525.pdf', N'application/pdf', 9036865, '45fef388201af2af15862fc05b41dc5788b3c44b7a6b100f245c101f1803dab1', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -440, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0533.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0533.pdf', N'realistic_batch_contract_scan_0533.pdf', N'application/pdf', 1384157, 'ca1ff8e60cb3aa53dcf032a9acf05447a3f88efb31534a9aea1c44b06e4ed627', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -441, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0541.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0541.pdf', N'realistic_batch_contract_scan_0541.pdf', N'application/pdf', 10075567, 'bb69795034faf0ef9a5a05e5b6519758262d9bf5f7469e99ad7cf28ed6e79f5b', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -442, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0549.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0549.pdf', N'realistic_batch_contract_scan_0549.pdf', N'application/pdf', 9673774, '80396b12c0829845e13bdcfcf8c6220180be09d936f935f56c087bebb9ae9a34', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -443, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0557.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0557.pdf', N'realistic_batch_contract_scan_0557.pdf', N'application/pdf', 8649727, '0584b9cfe647c4d0bfe84d800f388e463ff2bd2478776421d8ea2bf56ecb92bf', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -444, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0565.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0565.pdf', N'realistic_batch_contract_scan_0565.pdf', N'application/pdf', 8402587, '95843c1cb80efb56929d0a0f8705e5d78095beeda122957c59a563acf532204f', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -445, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0573.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0573.pdf', N'realistic_batch_contract_scan_0573.pdf', N'application/pdf', 3236601, '749a0d4d396624b0dcf795d5488798a9af0b69108afe2b32d853b3305ba40248', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -446, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0581.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0581.pdf', N'realistic_batch_contract_scan_0581.pdf', N'application/pdf', 3407622, '3e60b7162d62949bb2885a0097b3c6be1da0ad1dff9073380cd25a30e3537db1', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -447, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0589.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0589.pdf', N'realistic_batch_contract_scan_0589.pdf', N'application/pdf', 2959785, '213946a7a76a83298d48f9af8ae2808bb8cd38b60569afd880b11c7f54464601', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -448, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0597.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0597.pdf', N'realistic_batch_contract_scan_0597.pdf', N'application/pdf', 1180736, '589ae2644baa89300d1a920d76cbc485b8476a3a8533c48bb61ee024c390f287', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -449, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0605.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0605.pdf', N'realistic_batch_contract_scan_0605.pdf', N'application/pdf', 2033133, 'f4868e6a742dd5afd1f8e33ebd69ea1dfdfc692e114a28267527a7b07d2add23', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -450, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0613.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0613.pdf', N'realistic_batch_contract_scan_0613.pdf', N'application/pdf', 1695967, '65387560ebe3721c541f53ed6c3e5e039abe1ba44da86876b41cbf0b07d12a6a', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -451, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0621.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0621.pdf', N'realistic_batch_contract_scan_0621.pdf', N'application/pdf', 1572095, '31246866dc1a689391f8930d446b211509c00f26d9b5a341c8d99ac3a6f9d867', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -452, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0629.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0629.pdf', N'realistic_batch_contract_scan_0629.pdf', N'application/pdf', 6619977, '233847fdf2f5834c4f185965f3b493f2325c141fcd2a389013e5437bcd6df714', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -453, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0637.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0637.pdf', N'realistic_batch_contract_scan_0637.pdf', N'application/pdf', 1468516, 'fc146ad119818729ad843e398dc81780c223dcea10e9517590132a104fa6c72e', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -454, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0645.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0645.pdf', N'realistic_batch_contract_scan_0645.pdf', N'application/pdf', 10031507, '150b43dfa0fc6cc8ab4bfd6a21e4626f934a65b6b133bf8219740d190722426f', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -455, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0653.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0653.pdf', N'realistic_batch_contract_scan_0653.pdf', N'application/pdf', 2497569, '6c960c26f6971e05b7f9a814ce5d0cd27a1dba5a9a907f5c090e25872fba1af8', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -456, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0661.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0661.pdf', N'realistic_batch_contract_scan_0661.pdf', N'application/pdf', 7069582, '0de685931a0706e13c804cf37edc77750dd89bdd63f1b02a48df68d914bbdd0f', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -457, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0669.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0669.pdf', N'realistic_batch_contract_scan_0669.pdf', N'application/pdf', 2479695, '19492174b6ff2a2b102d5ca932e155ddd8848d135f2637ad33339d11b31dcf59', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -458, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0677.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0677.pdf', N'realistic_batch_contract_scan_0677.pdf', N'application/pdf', 4770452, 'b264e0d263cb3d8c771e2639b867320d8138b366752a4b153694b1e54b13c0c1', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -459, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0685.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0685.pdf', N'realistic_batch_contract_scan_0685.pdf', N'application/pdf', 1516105, '1c9fc50226ceaeea948c21ac7de802f5c5f2359cc30d918674b17727a2ddc52a', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -460, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0693.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0693.pdf', N'realistic_batch_contract_scan_0693.pdf', N'application/pdf', 4702682, '1491e8ee935b96036671a4a8b389329f19a0625b744858c236a38066a3f47cf0', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -461, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0701.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0701.pdf', N'realistic_batch_contract_scan_0701.pdf', N'application/pdf', 4370488, '2c115c42e5587e8a910189719f29b783f4b8f90b8d76439d40f7a3064489f1bc', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -462, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0709.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0709.pdf', N'realistic_batch_contract_scan_0709.pdf', N'application/pdf', 8622966, '17dff2da8dd2b6c41fa49341bb47373f61cd4fba91de59aa7143a4e5b5cee977', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -463, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0717.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0717.pdf', N'realistic_batch_contract_scan_0717.pdf', N'application/pdf', 7353267, '4312bb40651f93a05d534d27c18770be4100e9e3017b1573c4f793b42ce84eb7', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -464, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0725.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0725.pdf', N'realistic_batch_contract_scan_0725.pdf', N'application/pdf', 3218869, 'f76a8b73460d0dba1d9363b133d39d8dd62327c527e5173910a4dcc600fd7fd3', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -465, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0733.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0733.pdf', N'realistic_batch_contract_scan_0733.pdf', N'application/pdf', 6893674, 'beaa0ccab248c4acab467a6b2cdf4d06f0b7be2dbf8a69d61e183f4816f63021', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -466, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0741.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0741.pdf', N'realistic_batch_contract_scan_0741.pdf', N'application/pdf', 7815400, '3799afa64c0ee47e969be3b93be162e3302c5ee7d81507e5faad1248e4f1755d', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -467, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0749.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0749.pdf', N'realistic_batch_contract_scan_0749.pdf', N'application/pdf', 8617002, 'ccd38f18f23cea3da0eae984afb90c082daf7ff77fbc05aafe5fc95608407c91', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -468, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0757.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0757.pdf', N'realistic_batch_contract_scan_0757.pdf', N'application/pdf', 1727939, '4efeedca750d038c4d3475a5046d78238941346bd38365c40b0ee86a11a7b5b8', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -469, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0765.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0765.pdf', N'realistic_batch_contract_scan_0765.pdf', N'application/pdf', 2376463, '4c323e8faec88685d7b2486cab399a393fd1b987825b5c162971050f2ef1db81', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -470, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0773.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0773.pdf', N'realistic_batch_contract_scan_0773.pdf', N'application/pdf', 6139383, '4b56b905eabb36cc0b664a73625fa466ab18ba0e9d66d2931bc1149adf74ffdb', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -471, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0781.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0781.pdf', N'realistic_batch_contract_scan_0781.pdf', N'application/pdf', 3108557, '4bfeb77460cf9067776097a05420dfa3a03e84cbf1376afd522d959777930703', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -472, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0789.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0789.pdf', N'realistic_batch_contract_scan_0789.pdf', N'application/pdf', 7300951, '17fe0e92ee7e9273a8027dabca0796e8b8a57c0827419aaf12f5e2c0cd836caf', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -473, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0797.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0797.pdf', N'realistic_batch_contract_scan_0797.pdf', N'application/pdf', 4285682, 'cab59ec7f4dd9e2e5865c877a0e4f9e39a617e683b26f5582a8e690a04c61308', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -474, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0805.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0805.pdf', N'realistic_batch_contract_scan_0805.pdf', N'application/pdf', 5487216, 'e7d42f6499eb03850f3acd328fa7fbea5e5e1ec002dcf5f6b8791970f3fb9a75', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -475, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0813.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0813.pdf', N'realistic_batch_contract_scan_0813.pdf', N'application/pdf', 4503772, '4c3507181e6b11750c4ca846f6626138edcaaa2c5fafe732f23faa5f5aba2afb', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -476, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0821.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0821.pdf', N'realistic_batch_contract_scan_0821.pdf', N'application/pdf', 10453859, 'c8b1d59a269ccc70d37a11e934db5d37d58f7915d8b5d363cfe8f6775706f87b', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -477, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0829.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0829.pdf', N'realistic_batch_contract_scan_0829.pdf', N'application/pdf', 1824239, 'b1585a52f6a4c7ea0674084cc3dbe92a6ec4a87ff855c9abc9f71c188463e4da', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -478, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0837.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0837.pdf', N'realistic_batch_contract_scan_0837.pdf', N'application/pdf', 5908520, 'c6b423f74769bbe406a7bc08569fbf804d75a1ffb4b52b6dd887f4daab3b4883', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -479, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0845.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0845.pdf', N'realistic_batch_contract_scan_0845.pdf', N'application/pdf', 4221519, 'cc98abed2c094d27818651cf68638075941a8d4c568849b79f318f2a9c805fe1', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -480, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0853.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0853.pdf', N'realistic_batch_contract_scan_0853.pdf', N'application/pdf', 4403583, 'd738913e94a99313a8e13f46d843ddb09dcab15f50e2f561017c365d94446178', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -481, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0861.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0861.pdf', N'realistic_batch_contract_scan_0861.pdf', N'application/pdf', 5663956, 'f6f6a2198c105e66ecd0dd10e006dc48144398551ab54b468d58068ad596ae76', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -482, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0869.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0869.pdf', N'realistic_batch_contract_scan_0869.pdf', N'application/pdf', 5344380, '7d2e97ca8a495e294d2c16fc565ee2e8c5bd75ecf3f3b7a8d023707711a938db', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -483, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0877.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0877.pdf', N'realistic_batch_contract_scan_0877.pdf', N'application/pdf', 7893564, 'd8199ef4124eea5a7b22432aea6aeaf9dcd631315e0ec5e91d0d5389255b35c7', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -484, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0885.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0885.pdf', N'realistic_batch_contract_scan_0885.pdf', N'application/pdf', 6046917, '70cd554dc0256fa3b49c3ddcef65fe44fcb9dc7a86cd1768fd19aa99b2863160', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -485, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0893.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0893.pdf', N'realistic_batch_contract_scan_0893.pdf', N'application/pdf', 8861672, '9c37151e56f4f043a9cc08c5298482d2206f705d01fc141e6d006c6775ab92c4', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -486, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0901.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0901.pdf', N'realistic_batch_contract_scan_0901.pdf', N'application/pdf', 605211, '59364fbf083b0d3612ef153690b65a788e70e061f2cf9796c46aeea53e446d88', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -487, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0909.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0909.pdf', N'realistic_batch_contract_scan_0909.pdf', N'application/pdf', 2783985, 'dd366b7fa25dcd795c1a8f083b6234b267b6cedfccf9b88df06e5c4deaf9be5a', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -488, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0917.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0917.pdf', N'realistic_batch_contract_scan_0917.pdf', N'application/pdf', 4014513, '4d904050d1f036fdc2d42a9804dd9345e04afcc8f739f1996ce99bbb4368ac33', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -489, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0925.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0925.pdf', N'realistic_batch_contract_scan_0925.pdf', N'application/pdf', 10265821, 'c1c825f16b7613475f7e532e5f50c577207f554198306ab35a2134aca1f41682', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -490, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0933.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0933.pdf', N'realistic_batch_contract_scan_0933.pdf', N'application/pdf', 8389111, '268714723256c4ad369621791f2d5f2ecfb4bd6580681ca671b8abb5ca82ab1f', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -491, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0941.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0941.pdf', N'realistic_batch_contract_scan_0941.pdf', N'application/pdf', 2536470, '308eb49965dd56634ce3b1f1d195578a1e7055ff3d22ba72767d4fb3bc8dbb9d', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -492, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0949.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0949.pdf', N'realistic_batch_contract_scan_0949.pdf', N'application/pdf', 5396327, 'c335aad77a048b5a41a8bdb3d6cdba13522800c613b295074f5ccee8096cd886', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -493, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0957.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0957.pdf', N'realistic_batch_contract_scan_0957.pdf', N'application/pdf', 5172350, '5b99f0cd65bc367bdc486c6afe3ef380147bac6f1520ffd16b3af1ae74c428d1', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -494, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0965.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0965.pdf', N'realistic_batch_contract_scan_0965.pdf', N'application/pdf', 4727799, 'be2a874884a0a5bbf6700bc3585d78d974810e79b9fdc70c2adc0ad52f425c2d', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -495, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0973.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0973.pdf', N'realistic_batch_contract_scan_0973.pdf', N'application/pdf', 957581, 'e1d351f2da0f7febf6ce00828447f1c27e927d986f4b879e5303acc424bdb9c0', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -496, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0981.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0981.pdf', N'realistic_batch_contract_scan_0981.pdf', N'application/pdf', 3976647, '4495b5b2c94bef51343b39209021e78f7d5c536e5abd2cb7e0d73de565346b6a', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -497, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0989.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0989.pdf', N'realistic_batch_contract_scan_0989.pdf', N'application/pdf', 2378505, '0a20c51c762792e860cac422e770f47939ea38255b0942a82d01e266f3522d11', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -498, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_contract_scan_0997.pdf')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_contract_scan_0997.pdf', N'realistic_batch_contract_scan_0997.pdf', N'application/pdf', 1725673, '12e3015373e7cedf12277de563d4817cbb1e62f111339581a694ec2dfcd96b90', N'contract', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -499, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0008.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0008.bin', N'realistic_batch_evidence_blob_0008.bin', N'application/octet-stream', 12264313, '58a14be2beef1b621391f80744b868080c7e8d43db036ebe8471288c0f9895a4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -500, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0016.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0016.bin', N'realistic_batch_evidence_blob_0016.bin', N'application/octet-stream', 12254647, '53cdb5c1633fcd06266ec63995818126342a7a31ee16a32440383bc78ddc17d6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -501, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0024.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0024.bin', N'realistic_batch_evidence_blob_0024.bin', N'application/octet-stream', 12561085, '7a5e59545620700589bc615ff726ad8c6a06d120fedcf12e8aa4c7b3a0df260e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -502, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0032.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0032.bin', N'realistic_batch_evidence_blob_0032.bin', N'application/octet-stream', 8095403, '06a39366d6004a73f56482a4fd358b8aa093866cd66dbf1f1cfa88b23e072f70', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -503, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0040.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0040.bin', N'realistic_batch_evidence_blob_0040.bin', N'application/octet-stream', 4018438, '4699efba0947b78c3180a4d1a4a3ccfbd259fe8ba87a6463f0f13c1fe1ca54f2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -504, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0048.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0048.bin', N'realistic_batch_evidence_blob_0048.bin', N'application/octet-stream', 1725352, '04d89cc6f911506644523f06c9d9f4a8d8f08cbea096c51093214f157a455dae', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -505, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0056.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0056.bin', N'realistic_batch_evidence_blob_0056.bin', N'application/octet-stream', 7420403, '4eb9ae02dbb82287bb9dd9b3cd88b58221ce39641a0dbd36950d9baa78fafa47', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -506, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0064.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0064.bin', N'realistic_batch_evidence_blob_0064.bin', N'application/octet-stream', 6299918, 'f33f7b10d2a091d12b64915548408bd421924006ed316131768508836427e5c6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -507, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0072.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0072.bin', N'realistic_batch_evidence_blob_0072.bin', N'application/octet-stream', 8365772, '2118c4f9cfe8010734b504d227047794b47803b37ae84d53a63846ccde6d9cbf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -508, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0080.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0080.bin', N'realistic_batch_evidence_blob_0080.bin', N'application/octet-stream', 5225943, '5d116712306f0fd61a1cdcf0c88fdef9fc615972460cb51f375171896d40e851', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -509, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0088.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0088.bin', N'realistic_batch_evidence_blob_0088.bin', N'application/octet-stream', 5114922, 'f596c194dcfbf9d0df5abe547c6229554ee00c32e0d42f59c22ef5f41cf40f2b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -510, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0096.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0096.bin', N'realistic_batch_evidence_blob_0096.bin', N'application/octet-stream', 7905986, 'b980b9d4c7f20fb5ab71862952fae642e47b8eef75f95b503fa8febe6ab68ff5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -511, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0104.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0104.bin', N'realistic_batch_evidence_blob_0104.bin', N'application/octet-stream', 3143904, 'fc4af1e958a87545355b5ae28c5e5eb0bcea3f3ca563a3b2a6facb286f49f04a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -512, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0112.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0112.bin', N'realistic_batch_evidence_blob_0112.bin', N'application/octet-stream', 10649875, '4eaa12ae2c0b4c95d6726673f666e11e569e45a02ecc5d39e92b064df6d7a0bf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -513, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0120.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0120.bin', N'realistic_batch_evidence_blob_0120.bin', N'application/octet-stream', 7003275, '1a9389d9429db07e4e6cf1d785e014a2186c8d6d314a4ada659cdc51a131baa4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -514, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0128.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0128.bin', N'realistic_batch_evidence_blob_0128.bin', N'application/octet-stream', 9381124, 'e7e2373bdaa28c2ddb69a492e10280f50b39f0e36f55ccc1921a03e66f7bb8d4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -515, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0136.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0136.bin', N'realistic_batch_evidence_blob_0136.bin', N'application/octet-stream', 5510326, '3788ddb297cd873da48a9e59df19329c24a0fefc9c8a10f845155166a51289b7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -516, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0144.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0144.bin', N'realistic_batch_evidence_blob_0144.bin', N'application/octet-stream', 10408817, 'c944e8390d974d9ef1063be2910dd03dc151b1fa911ed928d912484f6dbd26af', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -517, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0152.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0152.bin', N'realistic_batch_evidence_blob_0152.bin', N'application/octet-stream', 11113356, '014feaded397fa74529beea46c4a6b3c73d323ecb1bcd0c264064dfd75a75978', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -518, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0160.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0160.bin', N'realistic_batch_evidence_blob_0160.bin', N'application/octet-stream', 3785008, '6841bf55a78688769aa3f49b8a598f71eac42e737522697212c4914d6ca24257', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -519, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0168.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0168.bin', N'realistic_batch_evidence_blob_0168.bin', N'application/octet-stream', 2043126, '844c2039346ae3d1e02e0d18592b94cfb18bd922b1064ffa7fc7d79a13c96d0d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -520, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0176.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0176.bin', N'realistic_batch_evidence_blob_0176.bin', N'application/octet-stream', 9176617, '13aad1bba774c45faeb77a66147b2280ffbaf405710ae44d61e00bd510ec28e5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -521, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0184.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0184.bin', N'realistic_batch_evidence_blob_0184.bin', N'application/octet-stream', 2031759, '59df7db04ac14397803cea3ffc40eb42c2833af99c11f5c876532a4fffec0a24', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -522, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0192.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0192.bin', N'realistic_batch_evidence_blob_0192.bin', N'application/octet-stream', 6558333, 'f485b5afda424069264fa4a6eb80077fef1ec7f3075dfd89630891deae46d9e3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -523, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0200.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0200.bin', N'realistic_batch_evidence_blob_0200.bin', N'application/octet-stream', 2966336, '0980bcb6df4ffa08fccba1a9611688e1323b1f331ffccf80a627b07c147a8ea6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -524, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0208.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0208.bin', N'realistic_batch_evidence_blob_0208.bin', N'application/octet-stream', 1257868, '54a33202eec1ce4a068bd3c78c6c8012ea4d9ac7660d351d128f70da6560f6c6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -525, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0216.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0216.bin', N'realistic_batch_evidence_blob_0216.bin', N'application/octet-stream', 8803845, '8e11a150f30c7e5a2626fac72a5a8ffc13287c132168e67a9d80efdefa7153db', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -526, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0224.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0224.bin', N'realistic_batch_evidence_blob_0224.bin', N'application/octet-stream', 3877021, 'dc41b6015185c34b29f72521580b86eae4b082452727d2cc921be19fabffbe8c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -527, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0232.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0232.bin', N'realistic_batch_evidence_blob_0232.bin', N'application/octet-stream', 3062185, '5f503d84912c2d0733b49149b8d50e1e6d3c7f266baa9b63faf7a78c485033ec', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -528, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0240.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0240.bin', N'realistic_batch_evidence_blob_0240.bin', N'application/octet-stream', 9116395, '3ad757fad9ac927572b5de1b557e2c66ee5b2fdb2ed66b3c651802b29fd85f81', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -529, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0248.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0248.bin', N'realistic_batch_evidence_blob_0248.bin', N'application/octet-stream', 4612803, 'f4706fdb015291fbdf5102bc871f9fd0f78aa7d12c3827345b21ddf7df0beaf1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -530, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0256.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0256.bin', N'realistic_batch_evidence_blob_0256.bin', N'application/octet-stream', 10495116, '351dcb94f807cc72cfa568836ff128f466acf529c5eb3b24e0ec37f0da7aa887', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -531, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0264.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0264.bin', N'realistic_batch_evidence_blob_0264.bin', N'application/octet-stream', 8568140, '2718ade6df303e0cfd7ede53030f9640a8769612017c6cbbf1ddc1b0517cf19d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -532, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0272.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0272.bin', N'realistic_batch_evidence_blob_0272.bin', N'application/octet-stream', 6059613, '2652a6aa6481332555440958294c4524af1684c5eedbbaf327dd143dcfaf590a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -533, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0280.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0280.bin', N'realistic_batch_evidence_blob_0280.bin', N'application/octet-stream', 8641683, '0e42a3fd19535c54a284c0e67c012b589aa0d58b20e38bc484abc7ba9b8ad6fc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -534, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0288.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0288.bin', N'realistic_batch_evidence_blob_0288.bin', N'application/octet-stream', 9244345, 'fb90ffca79c8c9f3804377b098581021cbd754f6cd24c74b3970c63eb39f29a1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -535, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0296.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0296.bin', N'realistic_batch_evidence_blob_0296.bin', N'application/octet-stream', 4789472, 'f76e0ad4b3c862f306b79ac909a4db4c0c30d1d4509b952dc4b2e6acd8b7b9cb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -536, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0304.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0304.bin', N'realistic_batch_evidence_blob_0304.bin', N'application/octet-stream', 9249980, 'e48935ff8e312ef5e8ae45ed032e566c6c45baefe4f7e7b2d9e1513dd11f0ef2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -537, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0312.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0312.bin', N'realistic_batch_evidence_blob_0312.bin', N'application/octet-stream', 10502432, 'b26f4913df21df3314f7955e99754d8de64ae3bec891df21c27611b6eaf12f4c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -538, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0320.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0320.bin', N'realistic_batch_evidence_blob_0320.bin', N'application/octet-stream', 1142309, '5e8af20037d633807f86b45a534b3e0b44637e8c565761a01a8baa526ba179a6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -539, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0328.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0328.bin', N'realistic_batch_evidence_blob_0328.bin', N'application/octet-stream', 9556748, '4a4408cd82b03d3c391918ec01ba8cbe021337cb1a14f5dd9e92060bac53d789', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -540, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0336.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0336.bin', N'realistic_batch_evidence_blob_0336.bin', N'application/octet-stream', 2390862, '25caf8f80382908f4beaf2ee9f1b3f9f91c207c246e051696488b72273cf8205', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -541, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0344.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0344.bin', N'realistic_batch_evidence_blob_0344.bin', N'application/octet-stream', 1804791, 'a8aa71f19eeb864a694cf561585754f2178756a81a558c813dde577e9e75c929', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -542, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0352.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0352.bin', N'realistic_batch_evidence_blob_0352.bin', N'application/octet-stream', 3550213, '7902c8ab40b9342e2498df46cb4defa0a84f69d7c9822db8335897919a05bd54', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -543, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0360.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0360.bin', N'realistic_batch_evidence_blob_0360.bin', N'application/octet-stream', 5697994, '4269860e140218e7154e669a2f479b162abcacaa57e0698fce4710f71982c9a3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -544, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0368.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0368.bin', N'realistic_batch_evidence_blob_0368.bin', N'application/octet-stream', 5659723, 'b7ace878b414e6732f4b1282f3007def9a43941e25963c5dbac2a2fc85ba7208', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -545, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0376.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0376.bin', N'realistic_batch_evidence_blob_0376.bin', N'application/octet-stream', 8734740, '5c599a73b15d2d3adaef4782400e95109e0bcbdb0c63d5b984f9fe896f84a622', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -546, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0384.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0384.bin', N'realistic_batch_evidence_blob_0384.bin', N'application/octet-stream', 3586149, '517aa97eea4b6abc028c39d5fe90da5af4808893fd471c0aa29f905700799038', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -547, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0392.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0392.bin', N'realistic_batch_evidence_blob_0392.bin', N'application/octet-stream', 9758322, '9ee697736f3284b7f61b07019634daec5cc460cf92bf89a495c5b9d63a204e6c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -548, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0400.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0400.bin', N'realistic_batch_evidence_blob_0400.bin', N'application/octet-stream', 4772415, '89bd944a7d576173d7b802877139f7807c9646512790f82d6b591b1ec328d173', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -549, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0408.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0408.bin', N'realistic_batch_evidence_blob_0408.bin', N'application/octet-stream', 11963970, '2d7f28ceef3ad67231018ba985a64d39b137ab8b57af9faa0596a9ec45564045', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -550, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0416.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0416.bin', N'realistic_batch_evidence_blob_0416.bin', N'application/octet-stream', 7337955, '470b93d8f52b2b0adbd861accf9737eba407727483676a148d1b9105bf81e6bc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -551, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0424.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0424.bin', N'realistic_batch_evidence_blob_0424.bin', N'application/octet-stream', 12041703, '2f386d879f56e178e5c3d7415b356c0b8f84406622c4ba89b4e49d15c21e9693', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -552, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0432.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0432.bin', N'realistic_batch_evidence_blob_0432.bin', N'application/octet-stream', 7660167, '72c3e6bb49254bffc94d3f3aaf18bb07cc33b5a3dcff3d79c2ff297a9eb34187', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -553, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0440.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0440.bin', N'realistic_batch_evidence_blob_0440.bin', N'application/octet-stream', 12416695, '1d41c2054466ac80c4964f722baec9419a7d8fd1fb6faa499bcb8e743cec0cbd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -554, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0448.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0448.bin', N'realistic_batch_evidence_blob_0448.bin', N'application/octet-stream', 8913840, '2a7aaa10a04772a16a77fe1369d01bb7226608ab99c8f3ff8ab3b02f1eb3b6d6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -555, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0456.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0456.bin', N'realistic_batch_evidence_blob_0456.bin', N'application/octet-stream', 8815506, '9685698cc6c435022808884baf018623a2f049715b38a6dd68a294b4670e51ed', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -556, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0464.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0464.bin', N'realistic_batch_evidence_blob_0464.bin', N'application/octet-stream', 10190529, '7134c2a6e098bde5ac5a28549089281805e2558d926f2ad9dd2b7014a044ad14', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -557, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0472.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0472.bin', N'realistic_batch_evidence_blob_0472.bin', N'application/octet-stream', 11798271, '8a0905f6210e8448f0d7b2704f55e64eebf5fe97545e388afa34407fa37e44dc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -558, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0480.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0480.bin', N'realistic_batch_evidence_blob_0480.bin', N'application/octet-stream', 5398799, '500d9ea5d38be28c8410af8f4b3549049449adb3052ee5c84337998523cee00e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -559, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0488.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0488.bin', N'realistic_batch_evidence_blob_0488.bin', N'application/octet-stream', 2839182, '45734b670b1503cf13a3d63204a6551df023e662eda556598e47d4d00c19fd9d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -560, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0496.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0496.bin', N'realistic_batch_evidence_blob_0496.bin', N'application/octet-stream', 10064386, '028705d16688c2a3107d93cbd0ebce4d5a06f43650d618b65a44f912c979e3f9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -561, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0504.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0504.bin', N'realistic_batch_evidence_blob_0504.bin', N'application/octet-stream', 10568830, '7f002ea51ed4bea4a2325ab24184fb4089ac2ad57e521745300b4c6281108f4e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -562, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0512.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0512.bin', N'realistic_batch_evidence_blob_0512.bin', N'application/octet-stream', 9471227, '4a4fbcc6236f1b424486b7003b66b8be94c5c1b26f3972dcb81baf1dc1d32474', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -563, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0520.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0520.bin', N'realistic_batch_evidence_blob_0520.bin', N'application/octet-stream', 6488043, '9d723e8538dda7f0f54bacf8ba1c73b4140dbb1fbb482bac2ca89fff80e5935a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -564, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0528.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0528.bin', N'realistic_batch_evidence_blob_0528.bin', N'application/octet-stream', 5871667, '3104d210fc53661ec68a51bf46f31813d3240afa2a4080daca569032acf5cc55', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -565, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0536.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0536.bin', N'realistic_batch_evidence_blob_0536.bin', N'application/octet-stream', 4362456, '62ae07b33982aa0ccb2dc985e260b212ee433f9a904a436340ffe4d71cdcfee0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -566, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0544.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0544.bin', N'realistic_batch_evidence_blob_0544.bin', N'application/octet-stream', 1207319, 'cb917d461204ae54e6fd0f8e738927364446ed2968507dcb498464590ced1dd5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -567, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0552.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0552.bin', N'realistic_batch_evidence_blob_0552.bin', N'application/octet-stream', 5607348, 'f1ee2f1576e2e8147a817b1d13e819b30fd5f55f44d8b04c6366c438ca7c8b53', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -568, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0560.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0560.bin', N'realistic_batch_evidence_blob_0560.bin', N'application/octet-stream', 11082113, '622cc1811dc4e64947b56580aca3d91e616a196010d165a328033c4ed8ad0d78', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -569, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0568.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0568.bin', N'realistic_batch_evidence_blob_0568.bin', N'application/octet-stream', 4921666, 'b5fa691efc40465ea1490f724c5fa4f7dc2dc31288d63c842abb15e31909ee17', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -570, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0576.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0576.bin', N'realistic_batch_evidence_blob_0576.bin', N'application/octet-stream', 11891063, '9d27dc3ae60348b5bd120f30d82696b7124eb2ce12e3f5439a469368f81b6abe', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -571, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0584.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0584.bin', N'realistic_batch_evidence_blob_0584.bin', N'application/octet-stream', 11322247, '3d0aa69bea85a1d17efd00caaddafe6c172d685cf977775e5fb4cee0a84403ea', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -572, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0592.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0592.bin', N'realistic_batch_evidence_blob_0592.bin', N'application/octet-stream', 8736045, '9de1c186e2efefdc6dd05c99e44776ed1e1044fde2665764222877c281024316', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -573, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0600.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0600.bin', N'realistic_batch_evidence_blob_0600.bin', N'application/octet-stream', 10244187, '3c5076153c4fc13974fd66c41d770b34ddd339a5054e74386d4b7c5b3c3de9b8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -574, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0608.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0608.bin', N'realistic_batch_evidence_blob_0608.bin', N'application/octet-stream', 12264313, '19dd2ca7257072136be19c22fde66a216cb93d6264dbffa8cca184ec3ad17d35', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -575, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0616.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0616.bin', N'realistic_batch_evidence_blob_0616.bin', N'application/octet-stream', 12254647, '24d68718b1cb199341f8569fab64ff3b16c8f3626cc048be0e455f208b088bb7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -576, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0624.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0624.bin', N'realistic_batch_evidence_blob_0624.bin', N'application/octet-stream', 12561085, '22bf0f579e9365c111937bd073b2cb2d1e08476969156cd1e6e53400be67e984', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -577, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0632.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0632.bin', N'realistic_batch_evidence_blob_0632.bin', N'application/octet-stream', 8095403, '825a422e245050cffc474f6c70718ed9a5a044da7f12fd43ee7ceff0e682cbba', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -578, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0640.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0640.bin', N'realistic_batch_evidence_blob_0640.bin', N'application/octet-stream', 4018438, 'f2d79c482260b0703a6b0bac4324cd4c76a64a6e8490ff68a516e63024f1df52', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -579, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0648.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0648.bin', N'realistic_batch_evidence_blob_0648.bin', N'application/octet-stream', 1725352, '3080bc215873e330ca698e01188331d8318fef0e9f7eab8cf26cdfb371b602c2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -580, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0656.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0656.bin', N'realistic_batch_evidence_blob_0656.bin', N'application/octet-stream', 7420403, '68fb3f81ddc3d0b7692abf83ad1cbb3dec45f504c316ae7e63f33637947bbc70', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -581, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0664.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0664.bin', N'realistic_batch_evidence_blob_0664.bin', N'application/octet-stream', 6299918, '1f6cd36857e010ef5cb2c7fd34f64971d962c5bcf7cef61263957c250b4542d1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -582, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0672.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0672.bin', N'realistic_batch_evidence_blob_0672.bin', N'application/octet-stream', 8365772, 'bf944b0c2f514b5c9793f6151075f35c80ae6958adbd8d0bcf671ff02d4e4829', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -583, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0680.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0680.bin', N'realistic_batch_evidence_blob_0680.bin', N'application/octet-stream', 5225943, '3062d528f6b2f0830c9ad15eeb679ff55deb3adf448d37cf70cfb97449751ed3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -584, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0688.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0688.bin', N'realistic_batch_evidence_blob_0688.bin', N'application/octet-stream', 5114922, '41d363a86d79b9723ab4540708e07ebff12a1d0f7b0f82e19d987628cba90217', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -585, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0696.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0696.bin', N'realistic_batch_evidence_blob_0696.bin', N'application/octet-stream', 7905986, 'f89b083df5eb1c0f351496303d3b98f5635221ba44a0ff67604e49344853cf2d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -586, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0704.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0704.bin', N'realistic_batch_evidence_blob_0704.bin', N'application/octet-stream', 3143904, '182c7ecfec279fdf93ecef70444342b2a09190f0f9e27a7a3b1bee42d9f8978c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -587, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0712.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0712.bin', N'realistic_batch_evidence_blob_0712.bin', N'application/octet-stream', 10649875, 'd9edf3031b595a85cea64cd6e8f932707ec511917368fb82766c84c4cfdd3e81', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -588, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0720.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0720.bin', N'realistic_batch_evidence_blob_0720.bin', N'application/octet-stream', 7003275, '2e42ec5b7a883f9cdb937f7922a538e7bbcd7bc623ecb31649037a98ff81e6f2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -589, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0728.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0728.bin', N'realistic_batch_evidence_blob_0728.bin', N'application/octet-stream', 9381124, '2a30644a6b806ff01c5348ff2e7d5586d0b0ec000e6332d08e80169688782744', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -590, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0736.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0736.bin', N'realistic_batch_evidence_blob_0736.bin', N'application/octet-stream', 5510326, '99f17350568fe8f319c50aa043fdb24fd68f7fdc9376c056a2139f13051dad2d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -591, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0744.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0744.bin', N'realistic_batch_evidence_blob_0744.bin', N'application/octet-stream', 10408817, 'bc8ca1208d537e2b56aca31944e1a68c59dd08b4bb72aea27f342f33293917f4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -592, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0752.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0752.bin', N'realistic_batch_evidence_blob_0752.bin', N'application/octet-stream', 11113356, 'c4c57368ffc419cf30f435d4265402f43609d9e27d79b36501dc788745e5b52a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -593, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0760.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0760.bin', N'realistic_batch_evidence_blob_0760.bin', N'application/octet-stream', 3785008, '458d87cf0780dd5e6f4e3f001009fe35795a8a6a66f58dbeca49f59e17017e68', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -594, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0768.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0768.bin', N'realistic_batch_evidence_blob_0768.bin', N'application/octet-stream', 2043126, 'f74ac77dc541d8d5092036680863eb572ee671265bf7fab7a38e7a89428d1d37', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -595, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0776.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0776.bin', N'realistic_batch_evidence_blob_0776.bin', N'application/octet-stream', 9176617, '7f66175ac717bfe83494c4e253cabc3186d15db2fe855922399bd8ffb502d34e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -596, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0784.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0784.bin', N'realistic_batch_evidence_blob_0784.bin', N'application/octet-stream', 2031759, '583e2e5c68d1f7dab1885e5bdcc1ed2a6dc7dd7ae1c0108567623f0c5e28ede7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -597, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0792.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0792.bin', N'realistic_batch_evidence_blob_0792.bin', N'application/octet-stream', 6558333, '997a329ea9c33f4813f304df5a47743aa5f836723340d4dee227cbe942ab8b84', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -598, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0800.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0800.bin', N'realistic_batch_evidence_blob_0800.bin', N'application/octet-stream', 2966336, '49a8b5ac61211760f53fad655a2b0cb8271fdbd1078022dc9878e5e974fcb924', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -599, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0808.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0808.bin', N'realistic_batch_evidence_blob_0808.bin', N'application/octet-stream', 1257868, 'a50c46abfe1dc888046fcdea4d80b8e7c4863d0367172ce31a6ec6b3dc6de6e7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -600, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0816.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0816.bin', N'realistic_batch_evidence_blob_0816.bin', N'application/octet-stream', 8803845, 'c1e71a47065a9af48c73bea4862b52d9602f4cf554c0c88e52a68911ee563521', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -601, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0824.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0824.bin', N'realistic_batch_evidence_blob_0824.bin', N'application/octet-stream', 3877021, 'e2c2f9a6996464cac5e621da6a74b401aa3492ba6c3d456e942ceff29c515a32', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -602, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0832.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0832.bin', N'realistic_batch_evidence_blob_0832.bin', N'application/octet-stream', 3062185, 'cff78532e0c8bac86fba1840d4b5625da7f003c1df0811f9f06893dc81dbb96b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -603, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0840.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0840.bin', N'realistic_batch_evidence_blob_0840.bin', N'application/octet-stream', 9116395, '64eabbc2f85a8d9386838a50cad547c3f717a7b09e213ec2908aae4393586b20', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -604, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0848.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0848.bin', N'realistic_batch_evidence_blob_0848.bin', N'application/octet-stream', 4612803, '55b76da13bc22cfc991e0dc80883af0bb42a2d4cdcaf24648e32eba6d906a839', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -605, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0856.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0856.bin', N'realistic_batch_evidence_blob_0856.bin', N'application/octet-stream', 10495116, '85b951c63ccb2b6c0929201addd2ad578e48c3028e833c2b5f089cb27a9bbc6c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -606, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0864.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0864.bin', N'realistic_batch_evidence_blob_0864.bin', N'application/octet-stream', 8568140, 'f758b84b1c5e43adbca5504fa4b3ca6a98738f762b2d1fe94a7331c73f3a8909', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -607, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0872.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0872.bin', N'realistic_batch_evidence_blob_0872.bin', N'application/octet-stream', 6059613, '1120cb44418d7f5f399b8e2039085df1ae7877e0d800e3d01ed003e02f53e5ff', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -608, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0880.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0880.bin', N'realistic_batch_evidence_blob_0880.bin', N'application/octet-stream', 8641683, 'c95073343f6d5cf70abeb0ca3653dc97c60b1df0dbec4058588b2959af51a867', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -609, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0888.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0888.bin', N'realistic_batch_evidence_blob_0888.bin', N'application/octet-stream', 9244345, 'a2c05fda5938cdcabb2daaf6b084b0b3dfab9cf1c9bea42f240b10d4f007e06d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -610, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0896.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0896.bin', N'realistic_batch_evidence_blob_0896.bin', N'application/octet-stream', 4789472, '6e135f932009e4048c90aa04d966af9e7a0122983688a7a9705ff0664b876b39', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -611, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0904.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0904.bin', N'realistic_batch_evidence_blob_0904.bin', N'application/octet-stream', 9249980, 'ea4fec217360400b17265e1dd221a8c5ae41f200d88a6cd06e197c23b72961fa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -612, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0912.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0912.bin', N'realistic_batch_evidence_blob_0912.bin', N'application/octet-stream', 10502432, 'cda881e73ae7feb4a678482a729b92a375a2965c5c4da151f8931fab682c9951', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -613, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0920.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0920.bin', N'realistic_batch_evidence_blob_0920.bin', N'application/octet-stream', 1142309, '2f3effce8b708def87a4aed0a1ad195dca11dfae70649cf9aac173b37df3cb63', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -614, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0928.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0928.bin', N'realistic_batch_evidence_blob_0928.bin', N'application/octet-stream', 9556748, 'd3a4ef31407247a1ef4a8d7ae8c89d4da7bf223b5f9897140e3b3ba7f73d057c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -615, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0936.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0936.bin', N'realistic_batch_evidence_blob_0936.bin', N'application/octet-stream', 2390862, '17baa6fc533de32fbcf4ea814385aa8d000d7cd21488908ab133ccbfeadaf132', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -616, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0944.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0944.bin', N'realistic_batch_evidence_blob_0944.bin', N'application/octet-stream', 1804791, '03dfd0f8da2679bf90c0da264e80e01366f2e4854fa6215334f536d603f55d65', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -617, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0952.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0952.bin', N'realistic_batch_evidence_blob_0952.bin', N'application/octet-stream', 3550213, '6083b3bdc2b6058cb9394d7a3dadd26445a2263346e2c4c3e2f25bd612fffec5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -618, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0960.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0960.bin', N'realistic_batch_evidence_blob_0960.bin', N'application/octet-stream', 5697994, '4329ed674a207b78d5c7174be50e09f20c4ab6ae7345d84f2d10504c0d9882e9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -619, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0968.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0968.bin', N'realistic_batch_evidence_blob_0968.bin', N'application/octet-stream', 5659723, 'c383645f48c665356991de48b514ff52677a5662471e5f0441bb7243c1b94b09', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -620, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0976.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0976.bin', N'realistic_batch_evidence_blob_0976.bin', N'application/octet-stream', 8734740, 'a6a937af3109afa80991f1f02cd8053622b947cc1ca142079c96123ab0083c2d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -621, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0984.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0984.bin', N'realistic_batch_evidence_blob_0984.bin', N'application/octet-stream', 3586149, '15d3a7b23e7d4e521134b30171a1e95c080218a67b5d3a44697b12a7a4582e6e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -622, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_0992.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_0992.bin', N'realistic_batch_evidence_blob_0992.bin', N'application/octet-stream', 9758322, 'c9a6b24205e0be105b1e96bf9d247344b800bc8cf63de1e1cb0f91d25b9f33d4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -623, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_evidence_blob_1000.bin')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_evidence_blob_1000.bin', N'realistic_batch_evidence_blob_1000.bin', N'application/octet-stream', 4772415, 'f619a16daf2c92ed10259681a536accc990d4abf78924f4ab8878ef0a0931548', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -624, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0004.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0004.csv', N'realistic_batch_matching_export_0004.csv', N'text/csv', 785834, 'e02e0653515831d76fdace14d9611418e53ba8642870085096d0900d0833833f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -625, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0012.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0012.csv', N'realistic_batch_matching_export_0012.csv', N'text/csv', 164173, '6266095e6108220e8f749a2781e255671bf182cf337cd85a00a2e42367f7040a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -626, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0020.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0020.csv', N'realistic_batch_matching_export_0020.csv', N'text/csv', 856866, '8aa86e7ab33b76b995eb0f87b993da7817dc0466f16067c91a598dc791c28154', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -627, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0028.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0028.csv', N'realistic_batch_matching_export_0028.csv', N'text/csv', 565037, 'c8d7b4dc49d37af217eb7e2386af4846799d7cdc0993e6a0c82372174b0d43e3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -628, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0036.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0036.csv', N'realistic_batch_matching_export_0036.csv', N'text/csv', 490527, 'e57136b20b383b7382abb7dd4601c7614c5a6d072d8b65537f82a881836ac717', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -629, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0044.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0044.csv', N'realistic_batch_matching_export_0044.csv', N'text/csv', 90161, '84247da1ebe7ad877ffd2785c1f46420ff9ae797cb3c1db9d7f9dec1c127ae08', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -630, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0052.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0052.csv', N'realistic_batch_matching_export_0052.csv', N'text/csv', 323923, '3b9e513e56557f3138ab7f674aae1dd282a3b5f3252bfeedac72f5425b0979dd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -631, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0060.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0060.csv', N'realistic_batch_matching_export_0060.csv', N'text/csv', 892055, 'bc995cd74780466367bc66ae80efb907fa9b9b52cebf58fa017fa1b3ed8a5af9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -632, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0068.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0068.csv', N'realistic_batch_matching_export_0068.csv', N'text/csv', 1026577, 'edabfd642c1d1edaf54661b48425bdab92c72b6b19074d8b893733cbbb42c7e1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -633, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0076.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0076.csv', N'realistic_batch_matching_export_0076.csv', N'text/csv', 727569, 'f238d1fb1bc9998b432a8e4931bbe083894506e2541c76d57dbffeb03c4db20a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -634, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0084.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0084.csv', N'realistic_batch_matching_export_0084.csv', N'text/csv', 199407, 'c81338c34acab4fce415b74a4c95e2b4c8dac916bcc636d881a36d27df0f9f04', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -635, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0092.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0092.csv', N'realistic_batch_matching_export_0092.csv', N'text/csv', 590422, '4ec83ec38af06042ec44e711d16304edf6809df7e38bc4edf7de1481295f934b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -636, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0100.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0100.csv', N'realistic_batch_matching_export_0100.csv', N'text/csv', 671814, 'eeef188afea5efb493a92cb7778b4239644070d8bad27b40bf68a1b830bbdd69', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -637, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0108.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0108.csv', N'realistic_batch_matching_export_0108.csv', N'text/csv', 234152, '63fdecbf44206ac5e17353b55c2273bc49ccaf411705a46aefe5330b39d0774b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -638, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0116.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0116.csv', N'realistic_batch_matching_export_0116.csv', N'text/csv', 324971, 'f6ab56b71552718f0d66cd3c8c2808bbd927d85c2e9151b30ace24b4bbe9639a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -639, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0124.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0124.csv', N'realistic_batch_matching_export_0124.csv', N'text/csv', 887906, 'fe5c7c73df08a31490609bb68abdb2008eef5ae96f1f5b42657fa5a166ff46e4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -640, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0132.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0132.csv', N'realistic_batch_matching_export_0132.csv', N'text/csv', 85166, 'c6eecc9bbdadada7e97ee0735fc94f10c03874ec81fc62bd659b8c4e179be9d2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -641, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0140.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0140.csv', N'realistic_batch_matching_export_0140.csv', N'text/csv', 398244, 'f6294cb4652fb738216ae7a0b5e3e8ba8b3b8923f39b21d4c6e1d34c2c511959', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -642, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0148.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0148.csv', N'realistic_batch_matching_export_0148.csv', N'text/csv', 400984, 'a12c81259e23bd029473d86eece7c4e60d723aa3baefe96d881e054a7f435ea6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -643, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0156.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0156.csv', N'realistic_batch_matching_export_0156.csv', N'text/csv', 171719, '50f49092e42b2b0a624cece333ed18d2bef9e0d899e50753401f1ee75d7df4e1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -644, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0164.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0164.csv', N'realistic_batch_matching_export_0164.csv', N'text/csv', 35008, 'ad1fdcb1f4b215385d166cc6d939046a38eff9d48103f8128bf59a8dda5f4af7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -645, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0172.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0172.csv', N'realistic_batch_matching_export_0172.csv', N'text/csv', 762110, '3981420b6ae4db7fe9d63b2f96a7979fe998a4cff4d7613f4c14d5b6a1ca6bb7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -646, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0180.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0180.csv', N'realistic_batch_matching_export_0180.csv', N'text/csv', 190060, '7592961910e0ceb7d53539be630cd6b0f8f73c42c7a9450883f0137091664eb3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -647, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0188.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0188.csv', N'realistic_batch_matching_export_0188.csv', N'text/csv', 122460, '403b9c654b72f7a3af3d728bf0b24545c6a39cbf542971735092034ef3439edc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -648, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0196.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0196.csv', N'realistic_batch_matching_export_0196.csv', N'text/csv', 722351, '6418a68218f7923d8b7fe44db621d5b161b3aca123af0ceccc7bd035ee686ab8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -649, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0204.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0204.csv', N'realistic_batch_matching_export_0204.csv', N'text/csv', 229516, '43838f80e1c264e9b02f231f8a1ece5ad811aa37123d340b5ba30553f74048fa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -650, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0212.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0212.csv', N'realistic_batch_matching_export_0212.csv', N'text/csv', 619570, 'f5a249635a56a966c9dd0b1b41fc2a5b806577c5d39c74bb9fb681685c5e8bd2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -651, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0220.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0220.csv', N'realistic_batch_matching_export_0220.csv', N'text/csv', 455325, 'fcef8300305cc9ae8ae797fd722d1a5f8764cfdc3212d1864c115ff961facda4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -652, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0228.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0228.csv', N'realistic_batch_matching_export_0228.csv', N'text/csv', 203694, '3c38ad08300ff4e1c9ea36ea5bef0257200823469a49828507c7ce75a6472fbf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -653, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0236.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0236.csv', N'realistic_batch_matching_export_0236.csv', N'text/csv', 310002, 'd50532b55ea51dcc0a2d44663e6be67ca10f982d52f0533a7e64a5288b7bf58e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -654, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0244.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0244.csv', N'realistic_batch_matching_export_0244.csv', N'text/csv', 694056, '4b57408a6d95d68eb9283834e77625c1f4fd0e95ce6def0b9817b1b4e3683ea9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -655, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0252.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0252.csv', N'realistic_batch_matching_export_0252.csv', N'text/csv', 675493, '13234fe6822acc3a2e801c004c74c1b99d4e9eea199e34ba0cc9552424bee84b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -656, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0260.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0260.csv', N'realistic_batch_matching_export_0260.csv', N'text/csv', 194593, '4287ed8867483c8816d2c95b8944b4f781095c4cdbb723c91b70f6794e261a05', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -657, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0268.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0268.csv', N'realistic_batch_matching_export_0268.csv', N'text/csv', 994080, 'b976cfb80b1d3d2e6bba0f08918df1ac228dcebc5dd33b93577bb621932aaa81', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -658, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0276.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0276.csv', N'realistic_batch_matching_export_0276.csv', N'text/csv', 999251, 'c65f9d2dc1ca387830e4e3142754959fd2acdc1758012f6439de7ced8af51f1f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -659, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0284.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0284.csv', N'realistic_batch_matching_export_0284.csv', N'text/csv', 994485, '228311b9e6b1c5a42ef61f2b233492e4cb4f7ecf560f9805f680673c5b34c461', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -660, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0292.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0292.csv', N'realistic_batch_matching_export_0292.csv', N'text/csv', 515870, 'c85f5c247b0c75a2ca81467f66d5a605c59e70fa67e68511bc2176551d371221', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -661, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0300.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0300.csv', N'realistic_batch_matching_export_0300.csv', N'text/csv', 110635, '3daafe990a6ea9cb7050b819c4f1297007fc5fff634907862a01e9827f12ccaf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -662, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0308.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0308.csv', N'realistic_batch_matching_export_0308.csv', N'text/csv', 1004007, 'e87d9d71df8a59cf0e32374a58f3508ac805033e0bdef455209c9ff3dcc264a2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -663, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0316.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0316.csv', N'realistic_batch_matching_export_0316.csv', N'text/csv', 175761, 'ab53b1926d8c998c09c0eed65375c39bec165271c93f0a0c914cea87423be78a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -664, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0324.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0324.csv', N'realistic_batch_matching_export_0324.csv', N'text/csv', 61634, '7623694dc59d30e647e94e361413bef23fea64f216f4130c5bfc7126f76e61dc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -665, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0332.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0332.csv', N'realistic_batch_matching_export_0332.csv', N'text/csv', 58956, '649ff52b25e2c64d80bb4490c6e9a529e1e4af8e56726f3bb40d8e33edfc5f36', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -666, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0340.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0340.csv', N'realistic_batch_matching_export_0340.csv', N'text/csv', 473506, 'debe79ff7bf8f73b4416b841dda60f341caafb6a2e68e3c2afa49197fd3665fd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -667, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0348.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0348.csv', N'realistic_batch_matching_export_0348.csv', N'text/csv', 665328, 'b127b6b08af286eb11cd4d78e995b41dfbddaf526680cf49c13840b76b8aafc1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -668, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0356.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0356.csv', N'realistic_batch_matching_export_0356.csv', N'text/csv', 63021, '549f96e85709e3e1ea5fcb03f2fd467ce3cb83e80a7264afe329e28724f07e5a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -669, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0364.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0364.csv', N'realistic_batch_matching_export_0364.csv', N'text/csv', 612670, '26d2ff8b23f892d2c6325a9cf7b7f6c594310a053e0a8c5690997121fffd0376', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -670, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0372.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0372.csv', N'realistic_batch_matching_export_0372.csv', N'text/csv', 309881, 'e9ea7709524eab0887e8832152074657a49d81728ec38202f9d2452bc212d5f1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -671, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0380.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0380.csv', N'realistic_batch_matching_export_0380.csv', N'text/csv', 101142, 'e4b122356ebda8b99ca33a1fedd2cb7112e4e88e548ff70c9dfefcdb53c5633e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -672, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0388.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0388.csv', N'realistic_batch_matching_export_0388.csv', N'text/csv', 881128, '9d967d69385d841a6ddfce369db2f482d469356d9334543017f3af039ea167df', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -673, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0396.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0396.csv', N'realistic_batch_matching_export_0396.csv', N'text/csv', 484066, '4f3f5ae4aae1fe4b83ff27000a87281ae7f14dcef7d49bdd63ef7ce3fb9b0ecc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -674, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0404.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0404.csv', N'realistic_batch_matching_export_0404.csv', N'text/csv', 718454, 'c9b8358383a207de25afeccf5b4ca84fee1494bca6b47cc816ad6a3fb73e63cb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -675, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0412.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0412.csv', N'realistic_batch_matching_export_0412.csv', N'text/csv', 912097, 'acf4040ca30403ac9204b944d8e5bf0d28000821e8aa461d12711794e641e763', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -676, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0420.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0420.csv', N'realistic_batch_matching_export_0420.csv', N'text/csv', 887126, '37b1d291f7fb12995836a37f2f6c12fdf49fb035ebd70a018d41b4f4d102a96b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -677, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0428.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0428.csv', N'realistic_batch_matching_export_0428.csv', N'text/csv', 584127, '63876d1935ec9134e134b6480623a1e3050dbff29fe0766c29a9e810433c319b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -678, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0436.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0436.csv', N'realistic_batch_matching_export_0436.csv', N'text/csv', 475677, '2f464b67fea0add648d051a5c25424eff80cdc45a75b91546f084ab4667750a5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -679, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0444.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0444.csv', N'realistic_batch_matching_export_0444.csv', N'text/csv', 280517, '79feb700f6e751fbdec89d5acbdc098e293e64f099484ff2d99276c6bd532f51', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -680, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0452.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0452.csv', N'realistic_batch_matching_export_0452.csv', N'text/csv', 669642, '06a8b3c187fea6f81f3e4a9b87857b6659eaeaa265ee4c1c09e7915481571c1b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -681, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0460.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0460.csv', N'realistic_batch_matching_export_0460.csv', N'text/csv', 582257, '4e912fafe1e9acaa271295cd1a3ae0d7b7d21d596f640632eedc7371109c2d76', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -682, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0468.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0468.csv', N'realistic_batch_matching_export_0468.csv', N'text/csv', 778248, '3757d99bebdaf26f41c7a922c6ef599a20c4619ea3e661bf5595a7c446f5bffa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -683, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0476.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0476.csv', N'realistic_batch_matching_export_0476.csv', N'text/csv', 123553, '931fbd5fa2dcc6f93f3ef2cf94876e6a9b7985a0c6a3869729052a15689462d5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -684, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0484.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0484.csv', N'realistic_batch_matching_export_0484.csv', N'text/csv', 369714, 'bfed1d0ffb59ae9f5a6ae1b0b708fdf96c43ccf7836a991c8eaea9f717a7bb32', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -685, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0492.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0492.csv', N'realistic_batch_matching_export_0492.csv', N'text/csv', 822110, '0025c0af1ac2dc123161ca13f49638b4c9063ee82961141cb19adfc750337d42', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -686, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0500.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0500.csv', N'realistic_batch_matching_export_0500.csv', N'text/csv', 64177, '524824632d98f04315eddc1d237867d1ac2306816f2820db0254716995ab95cb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -687, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0508.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0508.csv', N'realistic_batch_matching_export_0508.csv', N'text/csv', 105804, 'b2f91ce86d13cdb060344b664e2e5bc48d33a8f7418405d2545a095800868690', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -688, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0516.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0516.csv', N'realistic_batch_matching_export_0516.csv', N'text/csv', 500106, '840499ba2048ea4a9e53d2bfd847c3502095b57d0f796b2f76281b607a223df0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -689, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0524.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0524.csv', N'realistic_batch_matching_export_0524.csv', N'text/csv', 936643, 'b424e00b14a4626b7cc72cb76669b7db626215ab08833e8d87dd11fe943094c0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -690, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0532.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0532.csv', N'realistic_batch_matching_export_0532.csv', N'text/csv', 636322, '9e79aa2589cccc9108127fbb1bced28d04b562e7c01fd7bdeb5678a2b8161b8c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -691, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0540.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0540.csv', N'realistic_batch_matching_export_0540.csv', N'text/csv', 408114, 'efc210d309856ef998a00d20a3035dbda6ed86165ecc8a02222e2255071c7e2d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -692, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0548.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0548.csv', N'realistic_batch_matching_export_0548.csv', N'text/csv', 948940, 'bd518c4c9cb798267eb781c6b0bd376f085a55ced9ba26afb913530c66cd1cb7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -693, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0556.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0556.csv', N'realistic_batch_matching_export_0556.csv', N'text/csv', 132150, '2df37e252d6b4a84459dbb5e08f764163291423c2e072fee01f5a0c823dc7aea', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -694, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0564.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0564.csv', N'realistic_batch_matching_export_0564.csv', N'text/csv', 743543, '0a0b5e3058912d6d448f0b25b6c231d0b328d546b687ce456c31bc54af886828', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -695, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0572.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0572.csv', N'realistic_batch_matching_export_0572.csv', N'text/csv', 246084, '6ceb913a3dac8abfc8854b83e0d57ee3f4d99e000262b8d12cb85dbc44443a21', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -696, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0580.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0580.csv', N'realistic_batch_matching_export_0580.csv', N'text/csv', 870802, 'd5eb34bd5bbe0656a9de12ec0f13ddf8b4583b3a6eeb18f52f3d93bf94cc0188', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -697, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0588.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0588.csv', N'realistic_batch_matching_export_0588.csv', N'text/csv', 724970, '14d0911f7f5d968834f7725521c91f38bfab1b140b015df12a7d0bd3be60769c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -698, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0596.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0596.csv', N'realistic_batch_matching_export_0596.csv', N'text/csv', 452908, 'ce04943daf06cc345a3a72d68bcddced83c412f2f02473af1b3fcb12c5ed58df', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -699, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0604.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0604.csv', N'realistic_batch_matching_export_0604.csv', N'text/csv', 785834, 'cd722ad7788e9086510d1164cc5942a0a6c838706d88b3d2019c1e66f89551bf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -700, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0612.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0612.csv', N'realistic_batch_matching_export_0612.csv', N'text/csv', 164173, '787a4571374cc9360f8413f8e87ea0dc4dd7a4c3e70a50102df802a3c02af1ee', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -701, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0620.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0620.csv', N'realistic_batch_matching_export_0620.csv', N'text/csv', 856866, 'e35fe1fec359bdee431620a5522b6bdda4d7cf7473f20b65cccd6a3ce8f3fe86', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -702, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0628.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0628.csv', N'realistic_batch_matching_export_0628.csv', N'text/csv', 565037, 'd312f4f1ae5fdfd9138b9fe38f40757925bcb18ab161dc35ca96d00728d50163', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -703, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0636.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0636.csv', N'realistic_batch_matching_export_0636.csv', N'text/csv', 490527, 'b815be32c8cb5d3ba8f7a4f2a72fbb88c203b20b045b7e9978e6ac9808e1d947', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -704, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0644.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0644.csv', N'realistic_batch_matching_export_0644.csv', N'text/csv', 90161, '42ac521ea4a6b8bef9ec8d9eb079518e40293f8b49b8c4b4b9b58f312b043a50', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -705, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0652.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0652.csv', N'realistic_batch_matching_export_0652.csv', N'text/csv', 323923, '9c23fe3c7ad174073e2585355db06267fed9b2376357c2a03751a3fd89330ae3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -706, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0660.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0660.csv', N'realistic_batch_matching_export_0660.csv', N'text/csv', 892055, '24f74c40775b6a00908244e62440aec410acd0a8293c876e1105a1c5a32c58aa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -707, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0668.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0668.csv', N'realistic_batch_matching_export_0668.csv', N'text/csv', 1026577, '2910c09124e6435ca08d075286a93e67fa814b86dcad4faf61e4d3df13a06ce1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -708, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0676.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0676.csv', N'realistic_batch_matching_export_0676.csv', N'text/csv', 727569, 'a7a521334cd30ef587c893e941172f4913d60576b42b637ffb47bf6fb7e9ba0f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -709, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0684.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0684.csv', N'realistic_batch_matching_export_0684.csv', N'text/csv', 199407, '4b28fa71a2ee468a00c2bcb7f356db3200d3b256e065966c3ec3156a4142fb9a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -710, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0692.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0692.csv', N'realistic_batch_matching_export_0692.csv', N'text/csv', 590422, '788c2a347f6e3c60fae8f94a888bca02592c7541be5a0537d97a3216e553412a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -711, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0700.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0700.csv', N'realistic_batch_matching_export_0700.csv', N'text/csv', 671814, '188a7fe84c94a160934cd2327311667c62b103decf569819fb080ed6438bb5e8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -712, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0708.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0708.csv', N'realistic_batch_matching_export_0708.csv', N'text/csv', 234152, 'cbd9ab68e9a42ac562912947c856116327e10e038d83df655cf47aac347f12c8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -713, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0716.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0716.csv', N'realistic_batch_matching_export_0716.csv', N'text/csv', 324971, 'f3a5a048701f0c18860c94bc09154771d5ac56562ac83c9317587f198e803b6f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -714, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0724.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0724.csv', N'realistic_batch_matching_export_0724.csv', N'text/csv', 887906, '0f1121b9937332c9d2abb2994076bb9ed86c6eed6ea80febf4d09d3b7f0443cf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -715, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0732.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0732.csv', N'realistic_batch_matching_export_0732.csv', N'text/csv', 85166, '5604533c183131d4c727365cf5bdeae6ccffffe4b0641773f23243051f54e360', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -716, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0740.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0740.csv', N'realistic_batch_matching_export_0740.csv', N'text/csv', 398244, 'c503610cac49fc1cb1e898acff278069e1f0860d9fd6d33b952f0dab0885b9cb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -717, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0748.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0748.csv', N'realistic_batch_matching_export_0748.csv', N'text/csv', 400984, 'bdede6e9deb6b2a4d3331e811aba228354c84928641573cf5318c8a03e6fca15', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -718, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0756.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0756.csv', N'realistic_batch_matching_export_0756.csv', N'text/csv', 171719, 'c88e42d783300432afb785f5635501b33ae68115fbb40a1c2468e02351ae677a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -719, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0764.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0764.csv', N'realistic_batch_matching_export_0764.csv', N'text/csv', 35008, 'ef0c946af2c955ae1605345a77ddd64c28ac464a6547fbfeb8df2a9e4b648eff', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -720, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0772.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0772.csv', N'realistic_batch_matching_export_0772.csv', N'text/csv', 762110, '427ac104ea91404ccedf7aa2031fefe32a020a83ea64e18b84823490fcef9857', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -721, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0780.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0780.csv', N'realistic_batch_matching_export_0780.csv', N'text/csv', 190060, 'e67dff1a69822de0048dfef2a2b6e395fac4b928b914f54b50e47bec5caa8fd3', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -722, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0788.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0788.csv', N'realistic_batch_matching_export_0788.csv', N'text/csv', 122460, '1781d869b0d20cb25c6c759e2f6e432f8eea8785b92a4141480142be59c98e65', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -723, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0796.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0796.csv', N'realistic_batch_matching_export_0796.csv', N'text/csv', 722351, '14de18ddf612dbe5452490854c8005bf966ba563c99083287e4e0e16cfdcc537', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -724, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0804.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0804.csv', N'realistic_batch_matching_export_0804.csv', N'text/csv', 229516, '2e48e694f69c5189b8681300d9233c78b0ebf4f9083ca07a264b021a208325cc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -725, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0812.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0812.csv', N'realistic_batch_matching_export_0812.csv', N'text/csv', 619570, '4eb43b6fe28bc56d4ec7b310b17b4ed1796344dfc2c078dd71fbc2e3d09f9acd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -726, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0820.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0820.csv', N'realistic_batch_matching_export_0820.csv', N'text/csv', 455325, '86aaf2584a1a9cb606b392fbcff7797b5556434baa794713f666e69c6bb61589', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -727, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0828.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0828.csv', N'realistic_batch_matching_export_0828.csv', N'text/csv', 203694, '356f3ce1b2a6fa822f81ef835f122804c8e8365dc747576a44ea032ad49cebfe', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -728, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0836.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0836.csv', N'realistic_batch_matching_export_0836.csv', N'text/csv', 310002, 'f78c9becd816881a3ff9648c7aafce7ec477aa37c5de0cd265937bd044e48f1f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -729, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0844.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0844.csv', N'realistic_batch_matching_export_0844.csv', N'text/csv', 694056, '8dd01629551786fd953bbd8dea475f2298b68b816013ec1265158f72da3d9a37', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -730, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0852.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0852.csv', N'realistic_batch_matching_export_0852.csv', N'text/csv', 675493, 'cd3a24e52427be9c31eafe900ebb8706dc44a6733fc054bd735925918e525fd5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -731, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0860.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0860.csv', N'realistic_batch_matching_export_0860.csv', N'text/csv', 194593, '7499cd843ddca60d3bf701a71aeefa33eb5fcd97882761b57cb4ef04d3299fec', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -732, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0868.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0868.csv', N'realistic_batch_matching_export_0868.csv', N'text/csv', 994080, 'd7f0d5b46373afdbda61df6136acc14aff2a2fe857da62dee9cb517ec7006b7a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -733, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0876.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0876.csv', N'realistic_batch_matching_export_0876.csv', N'text/csv', 999251, '1769c73b5b2bbf6d60d91516fd777662056b4b60ba053ef3206bbbc11f7d8059', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -734, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0884.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0884.csv', N'realistic_batch_matching_export_0884.csv', N'text/csv', 994485, '58bbdf720909f355a896075ce97bcf7232c8dbbc616ef372b619c07e625ed7fa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -735, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0892.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0892.csv', N'realistic_batch_matching_export_0892.csv', N'text/csv', 515870, '52f1615c557f5f22f61f4a25f1372d06bd067c340249c908cbe3a2f1f5fe11a6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -736, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0900.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0900.csv', N'realistic_batch_matching_export_0900.csv', N'text/csv', 110635, '22a875328db8b868057fd93e898ed218a030cb84a29f7d156b5ac139d2df64c6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -737, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0908.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0908.csv', N'realistic_batch_matching_export_0908.csv', N'text/csv', 1004007, '6229b178bdef2959faea9a72f448adb6e880ff0f5dafbf34b82b0eb3626071c0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -738, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0916.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0916.csv', N'realistic_batch_matching_export_0916.csv', N'text/csv', 175761, 'e56bebd50384bf02aaf1ed710e8a1f89b820b75f7aa2a9988faed393fd65028b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -739, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0924.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0924.csv', N'realistic_batch_matching_export_0924.csv', N'text/csv', 61634, 'e1305b23ec50cd78aa4991a8b951e78b4283acf4dfd331a4f629b9ab3e62ab73', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -740, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0932.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0932.csv', N'realistic_batch_matching_export_0932.csv', N'text/csv', 58956, 'b411e6d91b51980290c24b41fcf536238d42cfbcfff63631a4362a36c5da472d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -741, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0940.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0940.csv', N'realistic_batch_matching_export_0940.csv', N'text/csv', 473506, '21f35445767cf032bb5218e06d6de89d83158dd7b4898fe7f5c301ae7a731a5f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -742, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0948.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0948.csv', N'realistic_batch_matching_export_0948.csv', N'text/csv', 665328, '354f68f3c5980ef58e5945dca0aebfcfb3ea24ed3e67f295d60b841e9a1909c9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -743, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0956.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0956.csv', N'realistic_batch_matching_export_0956.csv', N'text/csv', 63021, 'b4ff39aadb0970455ca521c4c09f6eec0697c58106f034bb1043f02590b5676b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -744, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0964.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0964.csv', N'realistic_batch_matching_export_0964.csv', N'text/csv', 612670, '00a807f905c2251b5a1faf264993bd01b3e77c3feb9fff7fb4a91a76b7064d85', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -745, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0972.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0972.csv', N'realistic_batch_matching_export_0972.csv', N'text/csv', 309881, '7d5971ee9e24e10f5405091bd141c136fe091813b115ec2d9c6c95425c9083b0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -746, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0980.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0980.csv', N'realistic_batch_matching_export_0980.csv', N'text/csv', 101142, '3dc00cbbc377c73fce92f0c53f3f6ce9e5d10649b51fbc396a331c2ccc8e9ee8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -747, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0988.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0988.csv', N'realistic_batch_matching_export_0988.csv', N'text/csv', 881128, 'f3b0195b76cc39ec80e7c8a8f078f50edeb3e1047932cf37e767a4938d0ebce0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -748, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_matching_export_0996.csv')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_matching_export_0996.csv', N'realistic_batch_matching_export_0996.csv', N'text/csv', 484066, 'f53057b378706f2cbc485f7cf5ab3b3bd99e788c1757d85f198404b94692d0db', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -749, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0002.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0002.jpg', N'realistic_batch_profile_photo_0002.jpg', N'image/jpeg', 1997080, '2ce23f282f7b25c6a41a6422aeeb1423f2819e0c4ab91d70dc8c37246014cd6e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -750, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0010.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0010.jpg', N'realistic_batch_profile_photo_0010.jpg', N'image/jpeg', 5198174, '6f9a497e4edf7c17527a1147c12a89394c1f8920b489dfb378118dbb7d8dd17d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -751, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0018.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0018.jpg', N'realistic_batch_profile_photo_0018.jpg', N'image/jpeg', 1348749, '3754556f24c8293b44494ee861ceb12420b27f9d8d9c1ed8f637644f1819f73f', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -752, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0026.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0026.jpg', N'realistic_batch_profile_photo_0026.jpg', N'image/jpeg', 2085390, '19f52c7a99b8ca82294fa57ef879eb0995205e336945f82355dbd63ec138cba8', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -753, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0034.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0034.jpg', N'realistic_batch_profile_photo_0034.jpg', N'image/jpeg', 1094527, '0928147a3a6875f0361d8b1e3486b73774acd9087c585ade58414ef493aa51d3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -754, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0042.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0042.jpg', N'realistic_batch_profile_photo_0042.jpg', N'image/jpeg', 2767844, '94a9ed6a10ba5554e265f3f8f7a46833ae7cdb6d28f25b2e53dfe295b50836cd', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -755, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0050.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0050.jpg', N'realistic_batch_profile_photo_0050.jpg', N'image/jpeg', 2879079, '7c70866f99d4dd6b65f00530aded93a9a40384e5cf0db23e3695f64f1590e328', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -756, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0058.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0058.jpg', N'realistic_batch_profile_photo_0058.jpg', N'image/jpeg', 3507016, '2ec415c8e2b00590488fa6e8170451e91dfb154a19d3c5c44b2e41852caca455', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -757, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0066.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0066.jpg', N'realistic_batch_profile_photo_0066.jpg', N'image/jpeg', 2183783, '51360d5f7714e699b0c4400582d385243062f0dc0d2b9fd1f62a120f085aac83', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -758, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0074.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0074.jpg', N'realistic_batch_profile_photo_0074.jpg', N'image/jpeg', 6213687, 'f67fd33515c35f3953b79c8e5bf5d1283e8281b1478c2a009638c472b221f8ac', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -759, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0082.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0082.jpg', N'realistic_batch_profile_photo_0082.jpg', N'image/jpeg', 2417282, '89ad8daa83fe7a3865f92d5355294b82f81c94de773db0a8ede81ccd38cb332f', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -760, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0090.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0090.jpg', N'realistic_batch_profile_photo_0090.jpg', N'image/jpeg', 2380214, 'c9e9d556c3c475c0956716519bebaf6a2b06db01862126c70f759e1a9e14d4e1', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -761, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0098.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0098.jpg', N'realistic_batch_profile_photo_0098.jpg', N'image/jpeg', 2426480, '0868876a612243e2308a88ebff9cbf6a17f44689b42ba74cd4eba1365061298c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -762, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0106.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0106.jpg', N'realistic_batch_profile_photo_0106.jpg', N'image/jpeg', 4659555, 'be3369a796f5face78ff2786b09200c4da401bbba553077bac1bf85584c06a57', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -763, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0114.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0114.jpg', N'realistic_batch_profile_photo_0114.jpg', N'image/jpeg', 538759, 'a8cada87fd9c5d8cde1de85d1056f7977566478fc01c348e14ec737aa4adba54', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -764, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0122.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0122.jpg', N'realistic_batch_profile_photo_0122.jpg', N'image/jpeg', 1678054, 'aba8f47b0e9873a41a5044b9c328c84095dac170e7354af303a8eb3534aece85', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -765, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0130.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0130.jpg', N'realistic_batch_profile_photo_0130.jpg', N'image/jpeg', 5053926, '84d0ee0f06cd969335ba5250ca02b56dfabd303ad0e1cec022bdbfa9132d47ad', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -766, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0138.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0138.jpg', N'realistic_batch_profile_photo_0138.jpg', N'image/jpeg', 6068567, '8e8850056d236b4e002232693b5ff2b8228d34315030951c8162aac1dcd52e33', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -767, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0146.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0146.jpg', N'realistic_batch_profile_photo_0146.jpg', N'image/jpeg', 873069, '96d048e78fc766106314d413c7f4c4a4b49a1adfdf2b46b524b27cd5f10dff00', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -768, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0154.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0154.jpg', N'realistic_batch_profile_photo_0154.jpg', N'image/jpeg', 3494829, '11cf79150e28972ccf3c5211056ce9a6697fb0427e1eb9b9cecc90625cec4e4b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -769, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0162.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0162.jpg', N'realistic_batch_profile_photo_0162.jpg', N'image/jpeg', 545591, '8edf29f2463f3cdcad8317ecede5248b8f5ef68c295e53e88c715f28c3039539', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -770, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0170.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0170.jpg', N'realistic_batch_profile_photo_0170.jpg', N'image/jpeg', 3912978, '9b1079ef3066cd982dba896c6b26cdfad7dd6e559f3b9ce918c972473898beaf', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -771, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0178.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0178.jpg', N'realistic_batch_profile_photo_0178.jpg', N'image/jpeg', 3493759, '87017c7cb745a5b68cea9505ca7b0402f5db3a92e7a01f1df61c5730a0bba4ef', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -772, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0186.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0186.jpg', N'realistic_batch_profile_photo_0186.jpg', N'image/jpeg', 4847062, '27cd41fd65b0ba094488a64de7cf45b044b50f10f509b55e529004bf116ce3cf', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -773, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0194.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0194.jpg', N'realistic_batch_profile_photo_0194.jpg', N'image/jpeg', 2562830, '6becb6f58b8f0a4c8c4b83472d3bcfaa147c701ec4c0e6f0ac6fea6852e7cd1a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -774, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0202.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0202.jpg', N'realistic_batch_profile_photo_0202.jpg', N'image/jpeg', 6140360, '503db073d6a6f872cdc8794a3a07e2f3d4a2835c61d5dbb596b1af4cad4fcc3d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -775, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0210.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0210.jpg', N'realistic_batch_profile_photo_0210.jpg', N'image/jpeg', 399339, '653b12ba77c4e3f86359549cbb8719f87b340e44a82f29431cc321045e04a908', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -776, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0218.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0218.jpg', N'realistic_batch_profile_photo_0218.jpg', N'image/jpeg', 4716452, 'baf4566e3bbd91d6d645da7a224f6390a34646db5e9e312f06b55eb4c49eb976', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -777, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0226.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0226.jpg', N'realistic_batch_profile_photo_0226.jpg', N'image/jpeg', 2220905, 'e9e4f030a266e5d61e8de173eee8e7eb8763d3ed36fff76e7321ecd273f3e78a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -778, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0234.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0234.jpg', N'realistic_batch_profile_photo_0234.jpg', N'image/jpeg', 2985738, '4abf70d5b3e7cbd757f2b873da7c878c0ca1450eaae228743e61ec2bbc0fd943', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -779, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0242.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0242.jpg', N'realistic_batch_profile_photo_0242.jpg', N'image/jpeg', 525084, 'afcb4ef0b758e8b97d0151a2aabea9d94264e4fa57fee54a952df324102ba632', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -780, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0250.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0250.jpg', N'realistic_batch_profile_photo_0250.jpg', N'image/jpeg', 1359891, '8df4214e97e2ea145073541c848af35bfb68e3a7e72bee616db0614df05c2c97', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -781, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0258.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0258.jpg', N'realistic_batch_profile_photo_0258.jpg', N'image/jpeg', 597589, '1d672980cd714e91121175819dabf98bf9863f57761008a2ed1484d56a6609b7', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -782, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0266.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0266.jpg', N'realistic_batch_profile_photo_0266.jpg', N'image/jpeg', 1944969, '10203a1306c18bac3250a16ec7b264f5dcdcdc4be436a2b4888763110551f357', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -783, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0274.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0274.jpg', N'realistic_batch_profile_photo_0274.jpg', N'image/jpeg', 2866986, '5437849f4a48f64ea4b0b7430bf37bd546c53369418e5fa19505abf7a75483a6', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -784, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0282.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0282.jpg', N'realistic_batch_profile_photo_0282.jpg', N'image/jpeg', 2438109, 'f43144e8201d2b26dcb8e77162bd7fbe619c7167cd2e68fba3a5675c57a8a607', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -785, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0290.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0290.jpg', N'realistic_batch_profile_photo_0290.jpg', N'image/jpeg', 2911804, 'afeff796bd8156a94395762a7dabdd0b91baf47bd271cc70535ba6ed5d286d4f', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -786, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0298.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0298.jpg', N'realistic_batch_profile_photo_0298.jpg', N'image/jpeg', 4471966, '358ab9c097c06dbcdee3ddf1bca62cbe189f3d0193447b5ccc2cd1230ee05805', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -787, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0306.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0306.jpg', N'realistic_batch_profile_photo_0306.jpg', N'image/jpeg', 929155, '6e9322a31d4ce8b42526c37b0992420934d6e7c3b4c71b96df582b97aa227054', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -788, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0314.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0314.jpg', N'realistic_batch_profile_photo_0314.jpg', N'image/jpeg', 1512930, 'bc2a01d81860275f59d461abde9afae33e7695e85d7f2361409cba1406349902', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -789, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0322.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0322.jpg', N'realistic_batch_profile_photo_0322.jpg', N'image/jpeg', 6067786, '0bbce8356da452b7cbeeae7a6c33a159ab9fbaf0040668450308fb1e82808f44', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -790, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0330.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0330.jpg', N'realistic_batch_profile_photo_0330.jpg', N'image/jpeg', 4173943, '9baff97c87d26243ed783aec5dbb2568e00a3c7104dc386cc6631b842c5ce2e5', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -791, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0338.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0338.jpg', N'realistic_batch_profile_photo_0338.jpg', N'image/jpeg', 654511, '0a567d1cbeaad79110d1f7d3f1dcd909f5a6530a20f550c496dd92838d4c4899', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -792, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0346.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0346.jpg', N'realistic_batch_profile_photo_0346.jpg', N'image/jpeg', 5662599, 'f843a046e1061ec5f2d2343077513a98571bd7287970d45d93c5dea5eeccd453', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -793, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0354.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0354.jpg', N'realistic_batch_profile_photo_0354.jpg', N'image/jpeg', 6000242, '44da7fed0fac25ecf920724c63b779e093bc6ddf822dd4b65c640935d050c0b1', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -794, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0362.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0362.jpg', N'realistic_batch_profile_photo_0362.jpg', N'image/jpeg', 4775952, 'b28f16886daf38e476c65bdecc1b182025d88ccba3eda3b9b5dbc8cbd9976cdd', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -795, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0370.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0370.jpg', N'realistic_batch_profile_photo_0370.jpg', N'image/jpeg', 5138164, '8949fa9caa9bc2016f5fd2f1fefe6df648a24c75e99e8686f8bcfe9613c57761', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -796, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0378.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0378.jpg', N'realistic_batch_profile_photo_0378.jpg', N'image/jpeg', 3870185, 'c8e25654303875cab192318c99ac2c752e4673d3fc98473ed7223a5ebb3f47fd', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -797, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0386.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0386.jpg', N'realistic_batch_profile_photo_0386.jpg', N'image/jpeg', 3746853, '4d7bb3d7d7d16b2d1ead809353f1d0e1aa196b315d3c5b1862229459eb7e49c3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -798, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0394.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0394.jpg', N'realistic_batch_profile_photo_0394.jpg', N'image/jpeg', 3234255, '5615e36dfbf36e78824d673084aaf9ea07105138490650da7d22add9a5d6e61d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -799, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0402.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0402.jpg', N'realistic_batch_profile_photo_0402.jpg', N'image/jpeg', 5697581, 'a1af1c367220806bc3710bd2a043a7749b0fbcc74b87109308747beabd604a1d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -800, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0410.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0410.jpg', N'realistic_batch_profile_photo_0410.jpg', N'image/jpeg', 5870442, '66e19258fdb8fda704e8af415e90538f310c0413bc0acfc6d366511487f76d4a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -801, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0418.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0418.jpg', N'realistic_batch_profile_photo_0418.jpg', N'image/jpeg', 3199603, '401cddd7b06df65b5436f0b4a4b03ff9c11f8fc7a20ce022e293b67b7246b2fa', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -802, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0426.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0426.jpg', N'realistic_batch_profile_photo_0426.jpg', N'image/jpeg', 5463874, '4ff9d23569e22a24a7b26077d77e4fdfeb0de564baaa3d13287533d7a5e00e08', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -803, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0434.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0434.jpg', N'realistic_batch_profile_photo_0434.jpg', N'image/jpeg', 2429807, 'dd29c782f47fa7a66b8ef9d6a56c76b464d2f06a70e8b9cb877a6f5a8ed24aff', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -804, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0442.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0442.jpg', N'realistic_batch_profile_photo_0442.jpg', N'image/jpeg', 3236923, 'd83523402cab28a1423b6a28a3a27fbacae81e810c0c6850c7e16f19b4f86825', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -805, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0450.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0450.jpg', N'realistic_batch_profile_photo_0450.jpg', N'image/jpeg', 2570835, '62d2e9066ec48a7398d556cfe18c527b3d06951010c41b430e7419f2fb8996fe', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -806, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0458.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0458.jpg', N'realistic_batch_profile_photo_0458.jpg', N'image/jpeg', 965469, '3e9be2e12d3596e0a9417db7529861be35a44f0b487082c294e4fefbc10c187c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -807, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0466.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0466.jpg', N'realistic_batch_profile_photo_0466.jpg', N'image/jpeg', 6247655, '482d1dbd6b7e51c25fb3713cbda1bbeb23bc9c50eb84e4b53f14314bd35af73e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -808, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0474.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0474.jpg', N'realistic_batch_profile_photo_0474.jpg', N'image/jpeg', 5789909, 'fa93c96bb28e280c0d071deb16b9ba33776f70ee719595c9aefcc18d16472700', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -809, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0482.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0482.jpg', N'realistic_batch_profile_photo_0482.jpg', N'image/jpeg', 1882779, '3104fc35cf825a2bfcc5edbbca5ac6134d9b77762e6872905189adf91563a044', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -810, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0490.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0490.jpg', N'realistic_batch_profile_photo_0490.jpg', N'image/jpeg', 3533474, 'cc7e5a56349c31f93ea4f46d5c2a33df28e42ea3a248e13facaa535e50234c5c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -811, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0498.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0498.jpg', N'realistic_batch_profile_photo_0498.jpg', N'image/jpeg', 5685309, '7378da407f2a22a102f638cb8392506d1da9e84db95ba81801b9eebf38e1ca14', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -812, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0506.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0506.jpg', N'realistic_batch_profile_photo_0506.jpg', N'image/jpeg', 381377, 'f6b68d384b59a9e3c7080b06d53a8e009a368f8b903409d473f00679ab4fad85', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -813, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0514.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0514.jpg', N'realistic_batch_profile_photo_0514.jpg', N'image/jpeg', 1124352, 'e7a2e7b52ae3e93f0952848db23ef77246ffc78f2e2ba9f9793670688570f6a8', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -814, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0522.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0522.jpg', N'realistic_batch_profile_photo_0522.jpg', N'image/jpeg', 4826629, '728c72454a9d0f55e59c2425068f22e3f20469c64f6778997b3fa1ef61cece9d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -815, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0530.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0530.jpg', N'realistic_batch_profile_photo_0530.jpg', N'image/jpeg', 4220899, '1505165965830b1667e8dcf937452ad25afbc8cb6fba03739e363e7fea9c2646', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -816, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0538.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0538.jpg', N'realistic_batch_profile_photo_0538.jpg', N'image/jpeg', 1992496, '2789b9b8c3f391b2c5e272db8bc571ec951de009ff5863c5b90bfb4bbacca423', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -817, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0546.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0546.jpg', N'realistic_batch_profile_photo_0546.jpg', N'image/jpeg', 417624, '3e762bfff03323016760d41c67dd84ad02017a420f6bd2b5ff936ee9b945420e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -818, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0554.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0554.jpg', N'realistic_batch_profile_photo_0554.jpg', N'image/jpeg', 2669171, 'a437483187b506a2c03fd7af69ba445d509ebc084ccddcb7cc4cf3e570869259', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -819, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0562.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0562.jpg', N'realistic_batch_profile_photo_0562.jpg', N'image/jpeg', 3490472, 'beb625b2bd255f304b54bd9d65a9da964ec8dd20ee0f680afe8b7922800c21b6', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -820, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0570.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0570.jpg', N'realistic_batch_profile_photo_0570.jpg', N'image/jpeg', 587214, 'b9eec70ea7ebb7a6863e4f79c973c64f780be2a8d96c5b038407abbe6ff3cee3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -821, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0578.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0578.jpg', N'realistic_batch_profile_photo_0578.jpg', N'image/jpeg', 794883, '5f2f2a1ce1a50c14233d8685fcd137ab971c814b75e260385580d0bb41ed2c54', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -822, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0586.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0586.jpg', N'realistic_batch_profile_photo_0586.jpg', N'image/jpeg', 2882506, 'c5162b2cd0d1fe536de39048f8fa7165d44d449590d2da976f07e69b8e210e62', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -823, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0594.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0594.jpg', N'realistic_batch_profile_photo_0594.jpg', N'image/jpeg', 4698177, '1001f20f92e5ab5c91cb6250e6bdd8be9c9a689df822ae594aa44e1bb932c8f6', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -824, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0602.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0602.jpg', N'realistic_batch_profile_photo_0602.jpg', N'image/jpeg', 1997080, '53f068d7a4e0e5591222e317ebf4ad1b06e5f9797ff8eefb373b18b27d3dd163', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -825, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0610.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0610.jpg', N'realistic_batch_profile_photo_0610.jpg', N'image/jpeg', 5198174, '0ae84a230fb579ad9d775c8c2119253abd98393370ca53bbda6b5909849dee29', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -826, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0618.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0618.jpg', N'realistic_batch_profile_photo_0618.jpg', N'image/jpeg', 1348749, '7dcf346eaf3823fbfcc0b933f3fa8f1279ff5111958a2d8e8249c925d8e78b38', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -827, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0626.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0626.jpg', N'realistic_batch_profile_photo_0626.jpg', N'image/jpeg', 2085390, '07f67b0e6ca387f2cb5966bee61bafa04a69b44957d89e5dd5b75b38662e2a15', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -828, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0634.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0634.jpg', N'realistic_batch_profile_photo_0634.jpg', N'image/jpeg', 1094527, '3fe4d878b2c13863d875bcb8523b3b169cd3d7639c5325117fb95e10850d4939', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -829, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0642.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0642.jpg', N'realistic_batch_profile_photo_0642.jpg', N'image/jpeg', 2767844, 'ec442e5ab313f6c00e99bcfa0576c3e267c5c3046d46d401bcf3262834eaaeb1', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -830, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0650.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0650.jpg', N'realistic_batch_profile_photo_0650.jpg', N'image/jpeg', 2879079, 'e64118d751f3c64f40b356fb6790d6d2c94ea8b98efbfd69275afa435faa7535', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -831, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0658.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0658.jpg', N'realistic_batch_profile_photo_0658.jpg', N'image/jpeg', 3507016, 'f8f3931eb8b0a4a12e58459e20bad3e110110c49ba46e798a3222f9feeb1724a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -832, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0666.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0666.jpg', N'realistic_batch_profile_photo_0666.jpg', N'image/jpeg', 2183783, '2834bfb277b53d1fe48077aee45903cec4b31d965a0c8d475f1d3bfef055ba8e', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -833, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0674.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0674.jpg', N'realistic_batch_profile_photo_0674.jpg', N'image/jpeg', 6213687, '3f2e57cd3321fea6b28e73b7e4d529a462f53432df4372b5907980cf1e0ecd21', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -834, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0682.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0682.jpg', N'realistic_batch_profile_photo_0682.jpg', N'image/jpeg', 2417282, 'c468e4866d9decb6d501c2d4eda6690d8450f5ad11262f7f9fa04c6a76024f28', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -835, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0690.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0690.jpg', N'realistic_batch_profile_photo_0690.jpg', N'image/jpeg', 2380214, '0eaeaf9cff2143cfcd53d56949b8d2d52a965c28e334062304db4e564f192d48', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -836, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0698.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0698.jpg', N'realistic_batch_profile_photo_0698.jpg', N'image/jpeg', 2426480, 'afaa35a9147075c12bc70af23534be65dd8232ff96855e0bebffdb634090c981', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -837, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0706.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0706.jpg', N'realistic_batch_profile_photo_0706.jpg', N'image/jpeg', 4659555, 'f9f62ae1af3ac23e74dd774a0faa5b8973786749612fca285637dd83697fe28d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -838, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0714.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0714.jpg', N'realistic_batch_profile_photo_0714.jpg', N'image/jpeg', 538759, '3d0fac73bbf9caf1c2bb324140a4077ee611361dbee6103b18ed66969c9307c3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -839, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0722.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0722.jpg', N'realistic_batch_profile_photo_0722.jpg', N'image/jpeg', 1678054, '99a2c7b233c10a33bf0eb5a781de033eaa3d1a2b4b80660bf01061001d85a48d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -840, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0730.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0730.jpg', N'realistic_batch_profile_photo_0730.jpg', N'image/jpeg', 5053926, '5b1a51ff4934b19682c8a2bdbdef784016434c5229650bc641bb291d0e88f400', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -841, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0738.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0738.jpg', N'realistic_batch_profile_photo_0738.jpg', N'image/jpeg', 6068567, '4d091ce5c4a0a95e7234f323b63e17eae5e3ec0500518710c71ebceaa373313f', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -842, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0746.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0746.jpg', N'realistic_batch_profile_photo_0746.jpg', N'image/jpeg', 873069, '2b9c51d95573c998298539535e1fd48bbc2069c5f570836e8458cc9e198649b1', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -843, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0754.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0754.jpg', N'realistic_batch_profile_photo_0754.jpg', N'image/jpeg', 3494829, '6066604ff1be3c624494c908e0bcc50125235fd26d1a1d0563b49b44eff9aef1', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -844, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0762.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0762.jpg', N'realistic_batch_profile_photo_0762.jpg', N'image/jpeg', 545591, 'db4f1b7068644dc4da600453a1de26f82eae9e60db8a56a5a78ec2c58fce160f', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -845, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0770.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0770.jpg', N'realistic_batch_profile_photo_0770.jpg', N'image/jpeg', 3912978, 'f37781f701429fba59b6109ce65671f3534d34ca63fd3b5873ef2219dc358408', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -846, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0778.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0778.jpg', N'realistic_batch_profile_photo_0778.jpg', N'image/jpeg', 3493759, 'f91dae35008722688f436a16cc1ac6a7c9695738ad43f76057b8cc5413825718', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -847, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0786.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0786.jpg', N'realistic_batch_profile_photo_0786.jpg', N'image/jpeg', 4847062, 'ed01982506c9353bb2798553289310316eae9231dacc0972047eb853ab537124', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -848, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0794.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0794.jpg', N'realistic_batch_profile_photo_0794.jpg', N'image/jpeg', 2562830, 'd5778f7263a9e2a7fd843b860e6ad15b0765223db83724cb3e375414319d209c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -849, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0802.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0802.jpg', N'realistic_batch_profile_photo_0802.jpg', N'image/jpeg', 6140360, 'b6532b640310f01d00bae1177b71b924df13944be79872fd73c838306bf1c71d', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -850, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0810.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0810.jpg', N'realistic_batch_profile_photo_0810.jpg', N'image/jpeg', 399339, '9aad3205435edde9481f9d06d7504b47cc22831cdbcdc602b04d228372825b18', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -851, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0818.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0818.jpg', N'realistic_batch_profile_photo_0818.jpg', N'image/jpeg', 4716452, 'bdf9cd5793680b9e2faae252619ad6aacf0d3aceffb0a590bdb290d8e0b80a88', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -852, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0826.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0826.jpg', N'realistic_batch_profile_photo_0826.jpg', N'image/jpeg', 2220905, '36273505efbd808773dad3364a5cfd332272595fd2795f2b181e1975292d43f0', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -853, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0834.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0834.jpg', N'realistic_batch_profile_photo_0834.jpg', N'image/jpeg', 2985738, 'a8ff61a06cb96acc5cfab98e5d638c5e14cd3e8fa9f4679e2fb638148c5c9a93', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -854, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0842.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0842.jpg', N'realistic_batch_profile_photo_0842.jpg', N'image/jpeg', 525084, '05ecb3f8b9534732a418662265410b68f7be6f218a54a1720ad41a02c6c0b22a', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -855, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0850.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0850.jpg', N'realistic_batch_profile_photo_0850.jpg', N'image/jpeg', 1359891, '3f34ff6c18ff45d4da8cae0406a5635a63c096766d5aaea332b3733700709ff3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -856, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0858.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0858.jpg', N'realistic_batch_profile_photo_0858.jpg', N'image/jpeg', 597589, '9f9f90f126ea243685e2b41c3d75a4b550b5bf9c3b8d20b5469b401f569e065c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -857, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0866.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0866.jpg', N'realistic_batch_profile_photo_0866.jpg', N'image/jpeg', 1944969, '244095923522585014639de2287cb8719d18be1b8de477254607dad4687f3960', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -858, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0874.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0874.jpg', N'realistic_batch_profile_photo_0874.jpg', N'image/jpeg', 2866986, '3533fa0395cf4058c2c27bce0e65dba938064825c3e6de5ed1da2fbf8e51d03b', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -859, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0882.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0882.jpg', N'realistic_batch_profile_photo_0882.jpg', N'image/jpeg', 2438109, '23ad1bc4f652aaa2e09a6f811a60d51e289b6e217bb4e36fbfe6ce8153ff55c0', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -860, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0890.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0890.jpg', N'realistic_batch_profile_photo_0890.jpg', N'image/jpeg', 2911804, '5aa408580039cd63d7f9e8b1405ecceeb81e3cd20d216bdc7a7b1c4b450ea774', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -861, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0898.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0898.jpg', N'realistic_batch_profile_photo_0898.jpg', N'image/jpeg', 4471966, '2846ea76765e0127dbacf7b1747c2eaffbf8db43c107e8f586c771be17d80b9c', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -862, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0906.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0906.jpg', N'realistic_batch_profile_photo_0906.jpg', N'image/jpeg', 929155, '0e474bb7e7659d857c56e84c59ace2d86e720e13238c2c407d2427dc5dd92214', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -863, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0914.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0914.jpg', N'realistic_batch_profile_photo_0914.jpg', N'image/jpeg', 1512930, '98d757ffdaf0987627da214d33ba8e8b8ec7d3da2d0cb2a8d94b64cd97535595', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -864, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0922.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0922.jpg', N'realistic_batch_profile_photo_0922.jpg', N'image/jpeg', 6067786, 'a45a648b8888485f75a67b0ea6b55160055c2c445c91d0ae6ae7ae9b27b16a25', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -865, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0930.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0930.jpg', N'realistic_batch_profile_photo_0930.jpg', N'image/jpeg', 4173943, '50543e7f0d943335cf8eb00ba8b10a8306e0e0bb6817807b61798b9b21366223', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -866, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0938.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0938.jpg', N'realistic_batch_profile_photo_0938.jpg', N'image/jpeg', 654511, 'f57a25bffdd4fef6ec1786158c0b1621b52f434e515844bafd69943410f7c2c0', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -867, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0946.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0946.jpg', N'realistic_batch_profile_photo_0946.jpg', N'image/jpeg', 5662599, 'ba3d7dbfc3be451afe97d5074b10e18a20eacbc77790826ed078445e937ae884', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -868, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0954.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0954.jpg', N'realistic_batch_profile_photo_0954.jpg', N'image/jpeg', 6000242, 'cbe1e7089567d5ec96be2e6ecb930035cf1a8bb172cb3637b11a0aff5a24f165', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -869, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0962.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0962.jpg', N'realistic_batch_profile_photo_0962.jpg', N'image/jpeg', 4775952, '977a3baf1f52b8e56a9328ed23e45a541cbce13fcdc4d7e919c0c089f6b76866', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -870, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0970.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0970.jpg', N'realistic_batch_profile_photo_0970.jpg', N'image/jpeg', 5138164, '6422fd5f21d085f484c61d0343c8bd0d292d45eceeae50e797bbe1e2ae103547', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -871, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0978.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0978.jpg', N'realistic_batch_profile_photo_0978.jpg', N'image/jpeg', 3870185, '7ba942336bf0fd3f9461fbf39226897d91b0406c61d42cdb2937d9cb09f630e3', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -872, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0986.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0986.jpg', N'realistic_batch_profile_photo_0986.jpg', N'image/jpeg', 3746853, '9218d1b6a0daca09734c00404c04205e66c13922ae045fb5dd627ae9b7339377', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -873, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_profile_photo_0994.jpg')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_profile_photo_0994.jpg', N'realistic_batch_profile_photo_0994.jpg', N'image/jpeg', 3234255, '096cba65e2cea25a9dad2c161bb6a3b110eba30c4de62cf06ef401d3e1f85d82', N'customer_document', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -874, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0007.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0007.log', N'realistic_batch_system_review_log_0007.log', N'text/plain', 289767, '289ed6aa51d2fa42668921c15227a8f50dccf52342188c3c551c5435a9e726eb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -875, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0015.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0015.log', N'realistic_batch_system_review_log_0015.log', N'text/plain', 525337, 'b8122d6372153f86e6478c01e20e9df0760b26e828294262437e9b3e550f217a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -876, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0023.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0023.log', N'realistic_batch_system_review_log_0023.log', N'text/plain', 602588, '595b83ab61cdaf891c3451d3c27c9ccc748b111a0198f71b598573ef5c3980a0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -877, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0031.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0031.log', N'realistic_batch_system_review_log_0031.log', N'text/plain', 630996, '6265487533be69f2fcb335c65f654c3d601b7b30363625bb024e7cb17fb929e6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -878, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0039.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0039.log', N'realistic_batch_system_review_log_0039.log', N'text/plain', 516773, '53023f849c2ff3eef9a78ec2d1c0c9c33177ecc5ec42b84a7136f740887ddab6', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -879, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0047.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0047.log', N'realistic_batch_system_review_log_0047.log', N'text/plain', 356443, '727a58431067ea7242dd44e7c8b1cc54a13a1d6a5a0236a428458d952b7e662f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -880, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0055.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0055.log', N'realistic_batch_system_review_log_0055.log', N'text/plain', 403704, '4f77082757569e97b986ce07a170440796ba18b7702c1826eb4a1cb79c4ee391', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -881, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0063.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0063.log', N'realistic_batch_system_review_log_0063.log', N'text/plain', 288709, '71f9cf3b29d8ca00a7f97049e782f3e26c76472deb61777632100dce75156857', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -882, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0071.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0071.log', N'realistic_batch_system_review_log_0071.log', N'text/plain', 690515, 'aa4a4fdf66c373190c40f9507ef3a0c858653addac3354aeae2367350ecfb78e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -883, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0079.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0079.log', N'realistic_batch_system_review_log_0079.log', N'text/plain', 42207, '4557cda3ba8eab53bd175c3e24ef0da1688333dbd4d97a84d2ef678ad77aca97', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -884, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0087.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0087.log', N'realistic_batch_system_review_log_0087.log', N'text/plain', 329490, '5891908036fff9273a8ccad5ff69eb4a42245c8bffab923ac10bec76981c33bd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -885, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0095.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0095.log', N'realistic_batch_system_review_log_0095.log', N'text/plain', 475462, 'd6553f1969d78cee038fbc2fdc0430622c945fbbdfdeba1e9cf997c7b055e181', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -886, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0103.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0103.log', N'realistic_batch_system_review_log_0103.log', N'text/plain', 679328, '35d42b4acee2ab4a13e2e4079e3ef1e998eedb3cf20c54ed3878396494fab7ff', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -887, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0111.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0111.log', N'realistic_batch_system_review_log_0111.log', N'text/plain', 106377, '0e0a9a559a903726cc723dbdc2ed88264fc46fc0e99bbf586972c3d0bff83d92', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -888, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0119.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0119.log', N'realistic_batch_system_review_log_0119.log', N'text/plain', 285022, 'c91a915851551ebf5742693739614eeeee12fda9445ff8867739017c74322bd8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -889, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0127.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0127.log', N'realistic_batch_system_review_log_0127.log', N'text/plain', 175457, '9b54133c94ef333c7d9d45864e034c19294d428681e47521504ab499f0c3b643', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -890, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0135.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0135.log', N'realistic_batch_system_review_log_0135.log', N'text/plain', 767801, '4720965d00fb67b2cab3e92454ca1c40b535baf90d0f8daec7543a50face6a18', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -891, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0143.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0143.log', N'realistic_batch_system_review_log_0143.log', N'text/plain', 428085, '0592655192d7cb7c6ea5ffa37ac8b14267b284f5a4998621af0c30db79bbde67', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -892, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0151.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0151.log', N'realistic_batch_system_review_log_0151.log', N'text/plain', 715598, 'dba9e5bf1064078ae40675a9006b3ec6a39a285413667c38491548c277a682bb', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -893, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0159.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0159.log', N'realistic_batch_system_review_log_0159.log', N'text/plain', 717292, '6231de1a85cbddfad601504c422077cda5a4942091f15feb4b85dbe6ac18edf8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -894, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0167.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0167.log', N'realistic_batch_system_review_log_0167.log', N'text/plain', 158398, '48f3c639bf2dc4ebe543c5322c8c81bdf1f6d1810447b28f2da716476949fa7b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -895, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0175.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0175.log', N'realistic_batch_system_review_log_0175.log', N'text/plain', 618586, '8f99dadb24c9bcfb915b8842478470f3632baae87e711be908280b630a197873', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -896, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0183.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0183.log', N'realistic_batch_system_review_log_0183.log', N'text/plain', 716398, '377fc4fc3b6978a47044a93e1e3ed334e150f6d7a91291eede7ecf29075026db', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -897, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0191.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0191.log', N'realistic_batch_system_review_log_0191.log', N'text/plain', 215198, 'e06fac2b10a43aafd380850ba957c7e17f48262a98fcc9c7b53acc9044473498', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -898, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0199.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0199.log', N'realistic_batch_system_review_log_0199.log', N'text/plain', 495041, '1aae9889900a209ec6868b48368f89642fc1b019406237ac8291afc684aaa01f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -899, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0207.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0207.log', N'realistic_batch_system_review_log_0207.log', N'text/plain', 248599, '8cae6c0a944868b8f567d6614d6ea16b66e34393b20e6d517cc4084311cdde8e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -900, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0215.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0215.log', N'realistic_batch_system_review_log_0215.log', N'text/plain', 769167, 'a52d5eeb8ac1f94168ed19d94b0620a81bafdd0db0a52a83de81fb46e4a05f96', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -901, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0223.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0223.log', N'realistic_batch_system_review_log_0223.log', N'text/plain', 324109, '5a5daaec1f8cc8726865a0b724df822a7033e9f12a34163f1b035c1a9cda8861', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -902, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0231.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0231.log', N'realistic_batch_system_review_log_0231.log', N'text/plain', 262744, '27ced9c8eadc306d76c0d3c68451d871c6bd6fd69d8e2ef165b40e482885ae86', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -903, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0239.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0239.log', N'realistic_batch_system_review_log_0239.log', N'text/plain', 465040, '01626f3454609f4883c34153c5ef0856125fd4149b7631f63fbeb8553e5c7a0d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -904, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0247.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0247.log', N'realistic_batch_system_review_log_0247.log', N'text/plain', 69046, '24ba78043d2f04aa8fe172fc5a6617971f5748aca974efa86259c484d3465de9', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -905, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0255.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0255.log', N'realistic_batch_system_review_log_0255.log', N'text/plain', 140078, '1369dcb76ef06af0552f6e5ee09063017c3b109230944f633dd40eb1ebe0af6e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -906, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0263.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0263.log', N'realistic_batch_system_review_log_0263.log', N'text/plain', 698994, '43c1b53480f3f7f7d2f8ef69bfeddeaf76ad71058329750c3e806f8cef9fe5a0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -907, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0271.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0271.log', N'realistic_batch_system_review_log_0271.log', N'text/plain', 110809, 'dd46550bad5d5375fd260eb353f4771395d3c666d4f5635d379fcdf2c601fb62', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -908, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0279.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0279.log', N'realistic_batch_system_review_log_0279.log', N'text/plain', 688425, 'e303ab608777a9b1119fe7c511463d03f91d7452499cf51b29c3aa8dc671c3bc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -909, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0287.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0287.log', N'realistic_batch_system_review_log_0287.log', N'text/plain', 619223, '7ae7e997efcb8bfb36a9c21d6d35f35f127f54fd991e06688ff6624eb2b840e8', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -910, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0295.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0295.log', N'realistic_batch_system_review_log_0295.log', N'text/plain', 151003, 'f42445b16a86a7d1aad41aa71832aa815286960e1b11a19557d031fe7b431e92', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -911, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0303.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0303.log', N'realistic_batch_system_review_log_0303.log', N'text/plain', 650346, '5a73c65fda77e6369386080dd6e165fd8047b800eaa0caba271949b8b70456dd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -912, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0311.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0311.log', N'realistic_batch_system_review_log_0311.log', N'text/plain', 69840, 'a4f98c8f9113cf4629772cb1727dff879136c1af595b000b8b25002f8fdf07b0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -913, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0319.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0319.log', N'realistic_batch_system_review_log_0319.log', N'text/plain', 84093, '86d61cc876d1e77623a0854e2994100c14331f49779daadb6bd130fe856874c7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -914, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0327.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0327.log', N'realistic_batch_system_review_log_0327.log', N'text/plain', 473176, 'a89b4598238e7d95566e5cb4c4c273847004b5e5d4dfc2adf775027e41102929', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -915, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0335.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0335.log', N'realistic_batch_system_review_log_0335.log', N'text/plain', 514188, '4666952ef8646808b9ae9f903cf835a1a175aa21969296acf9620e9d16dc190d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -916, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0343.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0343.log', N'realistic_batch_system_review_log_0343.log', N'text/plain', 384634, '7b782469dba054f1f4697bd10b1a2d8cc7d5cfecabc69542252255dc83c8150e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -917, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0351.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0351.log', N'realistic_batch_system_review_log_0351.log', N'text/plain', 766162, '260fdd7e17bce89cfa85255a6f033b64a5efc7955f6a14f7fd8beb3b02390ae0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -918, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0359.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0359.log', N'realistic_batch_system_review_log_0359.log', N'text/plain', 578736, '0276daf7eb1dc0ada1a382a48987eb07dfc95e38a7b19ee7f0683b01504bf448', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -919, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0367.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0367.log', N'realistic_batch_system_review_log_0367.log', N'text/plain', 31619, '9ddecc55338f77ee837d0bab8ff9cf95ec0a8cb3d7834f7d2a9d392387fd4f97', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -920, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0375.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0375.log', N'realistic_batch_system_review_log_0375.log', N'text/plain', 635554, '792b3c37376d0aa433d22bc605f6511e0d4fb6c3108299eb8add4f3f750ba0ac', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -921, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0383.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0383.log', N'realistic_batch_system_review_log_0383.log', N'text/plain', 201623, '04834b608e898a67e2bb8e66a934efbbb462e75125a714062e1451d682492ecd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -922, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0391.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0391.log', N'realistic_batch_system_review_log_0391.log', N'text/plain', 513868, 'af85d50b332c4899960e933353362d9b1c0ad442a2b928d31a11c45187719b7e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -923, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0399.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0399.log', N'realistic_batch_system_review_log_0399.log', N'text/plain', 509055, '1673a26fd878e2e04eeeda9a7b994e3f8c6e4f7bfc24bd9fdbcba99b06377cff', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -924, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0407.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0407.log', N'realistic_batch_system_review_log_0407.log', N'text/plain', 143130, '64aef65c6ec89f6c637c4ed5dff474a7fb0d6cde47bf2687013255787705a635', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -925, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0415.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0415.log', N'realistic_batch_system_review_log_0415.log', N'text/plain', 52180, 'ac5f5da46514d2c4c1c38636a7c1efccfac16a5dabc227870b4797b82751fd9b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -926, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0423.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0423.log', N'realistic_batch_system_review_log_0423.log', N'text/plain', 174452, '9fdcd1a66dced8f3623e70c36044641aaa7901eb3d6a115d4f70f23f37856f10', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -927, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0431.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0431.log', N'realistic_batch_system_review_log_0431.log', N'text/plain', 432931, 'e44bc586a8af0bb8979d4e60075eb6dc3bd15e659a73f2ac6fe39d4d75065191', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -928, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0439.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0439.log', N'realistic_batch_system_review_log_0439.log', N'text/plain', 637707, '581fc95c54eea4dd12e3aa8801abae80124b56209ab463aa20c9f382b6ea2c84', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -929, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0447.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0447.log', N'realistic_batch_system_review_log_0447.log', N'text/plain', 519370, '0e8323cd91c76a477e2aa6e850231bbd45ff506a22470ecf0dca23b5b23716cf', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -930, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0455.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0455.log', N'realistic_batch_system_review_log_0455.log', N'text/plain', 572508, '794199a014a073aba3b9cc83f47a765242711a57923bb1752a13be70168b15ea', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -931, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0463.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0463.log', N'realistic_batch_system_review_log_0463.log', N'text/plain', 179785, '373ec62d6b810cb7696e8f233645164c4951da7aa8874915c1300e52eef8586e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -932, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0471.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0471.log', N'realistic_batch_system_review_log_0471.log', N'text/plain', 511811, '3839b333806536b4fa9a93924baccccf8cc091527fa91ed98b9db078cddd24e1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -933, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0479.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0479.log', N'realistic_batch_system_review_log_0479.log', N'text/plain', 719528, '0a8b5ea118a2481734a828f12690bc0f7b1d50d2d4ba419602fc2d3258f2609a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -934, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0487.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0487.log', N'realistic_batch_system_review_log_0487.log', N'text/plain', 451538, '2436d8e5fdb88ef530116f110a6bfaebbe8e771fa43f0cbce0b1eb6a19a31644', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -935, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0495.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0495.log', N'realistic_batch_system_review_log_0495.log', N'text/plain', 200741, 'f7ac80d4689af05dabda73e8c42498808d7615434e4a0143d931e14d2855857f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -936, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0503.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0503.log', N'realistic_batch_system_review_log_0503.log', N'text/plain', 200654, '41d33ceaed94b7c64874d8807a7ff9b12aa6ff47ab44dc88740fa95ef3bfbc5d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -937, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0511.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0511.log', N'realistic_batch_system_review_log_0511.log', N'text/plain', 142984, '06219e7bdc114ffb1241d5dbc3f3b793e5b918c5c5ca849a726933f81984f773', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -938, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0519.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0519.log', N'realistic_batch_system_review_log_0519.log', N'text/plain', 313495, '5a801c77129e16f4e9f699ef38c577bf290d4b21961ead4ba1b9556198e62b15', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -939, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0527.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0527.log', N'realistic_batch_system_review_log_0527.log', N'text/plain', 696643, '6321f0e2c876612300bbcca192c24a6113cd361c172f89e030f4861c8ed097ff', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -940, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0535.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0535.log', N'realistic_batch_system_review_log_0535.log', N'text/plain', 403305, 'db2c101a98457c65b315d6988a6e5a023b0b32135450385e41a9d124b2d9eb49', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -941, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0543.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0543.log', N'realistic_batch_system_review_log_0543.log', N'text/plain', 625979, '473c9c5825a118c3757f545e77d453ce3409f32506b7816104366a52465b6b78', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -942, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0551.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0551.log', N'realistic_batch_system_review_log_0551.log', N'text/plain', 219404, 'ccba58e614bb13e04c66cd2c80becb4f303d1c0e9c328a46751c07f32f84cb39', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -943, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0559.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0559.log', N'realistic_batch_system_review_log_0559.log', N'text/plain', 763733, 'c4498fd0f0661234194600cf24d4f7b5a8af733ed062315a64b9cbf837987dfc', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -944, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0567.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0567.log', N'realistic_batch_system_review_log_0567.log', N'text/plain', 509304, '19143fec0bd6a3d393835e963f0080a1a7dbb38357ae6189e450bdd9ccd0a3b5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -945, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0575.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0575.log', N'realistic_batch_system_review_log_0575.log', N'text/plain', 407247, '694e9f54bc911411771ece7ee2912ae79b35a122051f403658d6fe1d44b78bd0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -946, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0583.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0583.log', N'realistic_batch_system_review_log_0583.log', N'text/plain', 397049, '2948ca7612c3d1e793a6dbf6440dd12b11482a5ce2d1b3213907a3655ad60c5f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -947, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0591.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0591.log', N'realistic_batch_system_review_log_0591.log', N'text/plain', 375224, 'b337d4f24775598baacde5f87681686909d1c7b24f62e41928c9fe1d08fcb269', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -948, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0599.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0599.log', N'realistic_batch_system_review_log_0599.log', N'text/plain', 181650, 'df41e6558651c24f09c6a7be122dddb50ff16526b7b727ce7495698283d8fed0', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -949, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0607.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0607.log', N'realistic_batch_system_review_log_0607.log', N'text/plain', 289767, '3dc048ce839ddc0140a8f136b5921d6dd20f436eca1f4cf30caafa2dba2ac3aa', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -950, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0615.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0615.log', N'realistic_batch_system_review_log_0615.log', N'text/plain', 525337, '69809c43e8836bb49ab0c8f5176ef96fb8c4333618807be75f9e9e574ff0e627', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -951, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0623.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0623.log', N'realistic_batch_system_review_log_0623.log', N'text/plain', 602588, 'f097b714929765c841234713369d0171f33003196cef9d691c5f318447852aba', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -952, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0631.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0631.log', N'realistic_batch_system_review_log_0631.log', N'text/plain', 630996, '920cd55ed5e30da5eeef86752012727488eedd8fec84a5416823c6cda80ca6dd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -953, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0639.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0639.log', N'realistic_batch_system_review_log_0639.log', N'text/plain', 516773, 'bf131e203c0a11d0cf396e717c3ce8d9186565328ce69fb547ded995e78fe6ce', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -954, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0647.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0647.log', N'realistic_batch_system_review_log_0647.log', N'text/plain', 356443, '3d354012ada6314c1550e35bbf2f0c3353bec91b1082c82d466511c8a64dce9e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -955, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0655.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0655.log', N'realistic_batch_system_review_log_0655.log', N'text/plain', 403704, '1818c7372cd451df518b4b02078eb6d3206bf9f8c52ff4db0de68a6d07a718de', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -956, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0663.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0663.log', N'realistic_batch_system_review_log_0663.log', N'text/plain', 288709, 'b0d9025c561ba02ac9acc2090985aa8ac369e980212f7d184ad6a35d7ccdd744', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -957, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0671.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0671.log', N'realistic_batch_system_review_log_0671.log', N'text/plain', 690515, '3e84ae38589cfeb49ee75cb5c09c4feaaa9d85852e510dd320d90af5108871fd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -958, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0679.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0679.log', N'realistic_batch_system_review_log_0679.log', N'text/plain', 42207, '362e34be4d17e9fc6babbc8a6aa512ced37891677e33027507745d1644c9fb50', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -959, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0687.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0687.log', N'realistic_batch_system_review_log_0687.log', N'text/plain', 329490, '7359c69a40815c7f62ef57e795ea2a0fbcad383be5df0f9f5b1a706a78512516', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -960, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0695.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0695.log', N'realistic_batch_system_review_log_0695.log', N'text/plain', 475462, '647695b05c7dde9277d79694ecf33ead227a9effede4e5294b3b5a1f7e984a48', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -961, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0703.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0703.log', N'realistic_batch_system_review_log_0703.log', N'text/plain', 679328, '668893ea7d7cc51ca12417eb1b5510d3f2277b5ce332ff85da82a24505ee9145', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -962, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0711.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0711.log', N'realistic_batch_system_review_log_0711.log', N'text/plain', 106377, '52387f66b4bed81b77e1dc9a02bd5486dd7d8e8768e25548445bbbd5193cd2d5', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -963, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0719.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0719.log', N'realistic_batch_system_review_log_0719.log', N'text/plain', 285022, '5f007ac93c3b48bb1eda64b52d623dbd8564456251970c2238625b6b1c3d171b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -964, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0727.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0727.log', N'realistic_batch_system_review_log_0727.log', N'text/plain', 175457, '7b46594d20e931cc0b96f21b791802ed4e122f10e104298ee504c2cacab1c753', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -965, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0735.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0735.log', N'realistic_batch_system_review_log_0735.log', N'text/plain', 767801, 'fcb21dddf2febec0c73bcd7ad059330caa9bbd4ffa77bde9b42cc30728d17745', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -966, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0743.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0743.log', N'realistic_batch_system_review_log_0743.log', N'text/plain', 428085, '73faed9bca6375d56d2148b46d83467e0fdadfaf670acdba86f4066714cc505a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -967, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0751.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0751.log', N'realistic_batch_system_review_log_0751.log', N'text/plain', 715598, '1d87079718ba0c960c5db1b6c5d5709bb8c37a481b63ff63e27a7159f215785d', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -968, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0759.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0759.log', N'realistic_batch_system_review_log_0759.log', N'text/plain', 717292, '570900cef983412bf5a392e0a927ecaa1254e9c0d716d35283b964638b7e196c', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -969, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0767.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0767.log', N'realistic_batch_system_review_log_0767.log', N'text/plain', 158398, 'c92b39ee916b79c9004092c4ed14dd95440adcdc119d81d3a211fcb2ef7c8e8a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -970, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0775.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0775.log', N'realistic_batch_system_review_log_0775.log', N'text/plain', 618586, '7dd69d998229984fe98011fee5c0bd0b0c6a201333f504d2a3599e9fe67b9f93', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -971, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0783.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0783.log', N'realistic_batch_system_review_log_0783.log', N'text/plain', 716398, '5a999a3c8ee2770cec4cf657b4ff8ee53533c78fee1baa1bd087abaf953ce486', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -972, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0791.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0791.log', N'realistic_batch_system_review_log_0791.log', N'text/plain', 215198, '38d053c827d812db308c91835d75f02a6dc0238316c2bac999319625920ebd98', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -973, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0799.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0799.log', N'realistic_batch_system_review_log_0799.log', N'text/plain', 495041, '37852ebb0c737cac65aa5e441302a0ef2c79eaf0a33166f9060ceb407c52322b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -974, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0807.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0807.log', N'realistic_batch_system_review_log_0807.log', N'text/plain', 248599, '5b034cf150e2a3644fe075f1e1b722f72dbc7cb482b61aeb90c796d777c65311', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -975, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0815.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0815.log', N'realistic_batch_system_review_log_0815.log', N'text/plain', 769167, 'e424d6ef832dd256d1477cceb33e124e6b866ea8213060350386a31c74294862', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -976, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0823.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0823.log', N'realistic_batch_system_review_log_0823.log', N'text/plain', 324109, '0fe5e7e2c7d1a131d978bc7565c24ba2da4674c510d0a4c48b6a040a13bab887', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -977, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0831.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0831.log', N'realistic_batch_system_review_log_0831.log', N'text/plain', 262744, '95ebdaf4a9714662522dfceb98c7a167662dab722d397432731b4aa81fe59227', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -978, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0839.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0839.log', N'realistic_batch_system_review_log_0839.log', N'text/plain', 465040, '2a191ce94b7308ce85603636bf4044bab7e0a0043ab928abffc2af646bd43edd', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -979, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0847.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0847.log', N'realistic_batch_system_review_log_0847.log', N'text/plain', 69046, '474fb29b1b543563834dc3521f5ebde80333d642dd72ff0add23236cc8a04d4a', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -980, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0855.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0855.log', N'realistic_batch_system_review_log_0855.log', N'text/plain', 140078, '8d382d68d62433c6c8422a3433a4a0cd5f63cb46e8b036153ed1d077ecc54bc4', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -981, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0863.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0863.log', N'realistic_batch_system_review_log_0863.log', N'text/plain', 698994, '416c6829b113ebb76d0a36827642ea99e2b494fe170c2b001facc262546fec76', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -982, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0871.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0871.log', N'realistic_batch_system_review_log_0871.log', N'text/plain', 110809, '0f92f646487988a787ffb978f91ebd36b182fadec4fc15fa291a252a925b8530', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -983, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0879.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0879.log', N'realistic_batch_system_review_log_0879.log', N'text/plain', 688425, '0238475e7d8a5ac13af7f5b3ec019f8a14f8f6cf7f5fb41b45bc48015597a314', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -984, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0887.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0887.log', N'realistic_batch_system_review_log_0887.log', N'text/plain', 619223, 'd8c0f50439b4caad7c35cc00e72a8387569c6c40d7998cb5b1f00faeccb2566b', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -985, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0895.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0895.log', N'realistic_batch_system_review_log_0895.log', N'text/plain', 151003, '7a01d3badb62590a0de9e9709cdc363baf85f12a5b299fadd74efffc3a275e2f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -986, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0903.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0903.log', N'realistic_batch_system_review_log_0903.log', N'text/plain', 650346, '6c6538401207a6b1d177251c17788f1deb1f688374568f9a3066cd2e71628c8e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -987, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0911.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0911.log', N'realistic_batch_system_review_log_0911.log', N'text/plain', 69840, '742d32f88f88baee24f16cfed24aed6ebec076e049c1b2743c782d7bce0ec21e', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -988, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0919.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0919.log', N'realistic_batch_system_review_log_0919.log', N'text/plain', 84093, '2e865b4fe4a03427063c7b933d64d60bfa0632503cce30a1bcecd98810cb8737', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -989, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0927.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0927.log', N'realistic_batch_system_review_log_0927.log', N'text/plain', 473176, '6a807bc1ab95e39c0a27feef9a721a5a4355b7a9a48dc59f28b104483e1b8159', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -990, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0935.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0935.log', N'realistic_batch_system_review_log_0935.log', N'text/plain', 514188, 'b006b8af8c37925c9fb952a34cf08d3880aefa61baa0fae2ba9cb4b214518c3f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -991, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0943.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0943.log', N'realistic_batch_system_review_log_0943.log', N'text/plain', 384634, '1d9a33b7c0b9bb39c849007e9807f6cf7166e7033f68013ae0b9d6564dfd10b2', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -992, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0951.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0951.log', N'realistic_batch_system_review_log_0951.log', N'text/plain', 766162, '88d621bde3f4464a4f7b5bb965940587e0890fd5d847e08018bbca317854e6d1', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -993, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0959.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0959.log', N'realistic_batch_system_review_log_0959.log', N'text/plain', 578736, '91a7ba267273d293f3fb0d5acf945fa5fbc9b716bcd7262ebab45c98c735caee', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -994, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0967.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0967.log', N'realistic_batch_system_review_log_0967.log', N'text/plain', 31619, '4ce1262a503cb5bb5212244852d23734a691c56cc55b6cfb28d3ffe24b0438b7', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -995, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0975.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0975.log', N'realistic_batch_system_review_log_0975.log', N'text/plain', 635554, 'bf2f2bc5ebae479d0f2901dd978134fc31352b061328e6f950bff49384834589', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -996, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0983.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0983.log', N'realistic_batch_system_review_log_0983.log', N'text/plain', 201623, 'dfdbd6e75730ed81b8ef641f79d4dd31781095c8453da696b377e29c30458b08', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -997, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0991.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0991.log', N'realistic_batch_system_review_log_0991.log', N'text/plain', 513868, '0ac97739e3da6e2a2fb0df971d4bfc14918f206e40f9a2dbcd8689150e4b0f51', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -998, @now));
END

IF NOT EXISTS (SELECT 1 FROM dbo.uploaded_files WHERE stored_name = N'realistic_batch_system_review_log_0999.log')
BEGIN
    INSERT INTO dbo.uploaded_files (original_name, stored_name, content_type, size_bytes, sha256_hash, category, uploaded_by, source_ip, uploaded_at)
    VALUES (N'realistic_batch_system_review_log_0999.log', N'realistic_batch_system_review_log_0999.log', N'text/plain', 509055, 'd3639ced5ee444e2b712a36d82f12fb5e1f641f0dc080f004f246d9caedc711f', N'consulting_material', N'counselor', N'10.10.20.15', DATEADD(MINUTE, -999, @now));
END

COMMIT TRANSACTION;

