/*
  Expand the existing MarriageCrm database with fictional sensitive-profile
  fields and generate at least 500 training customers.

  Run on VM8:
    sqlcmd -S localhost -U sa -C -d master -i migration-sensitive-500.sql
*/

USE MarriageCrm;
GO

IF COL_LENGTH(N'dbo.customers', N'gender') IS NULL
    ALTER TABLE dbo.customers ADD gender nvarchar(10) NOT NULL CONSTRAINT DF_customers_gender DEFAULT N'비공개' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'company_name') IS NULL
    ALTER TABLE dbo.customers ADD company_name nvarchar(120) NOT NULL CONSTRAINT DF_customers_company_name DEFAULT N'비공개' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'height_cm') IS NULL
    ALTER TABLE dbo.customers ADD height_cm decimal(5, 1) NOT NULL CONSTRAINT DF_customers_height_cm DEFAULT 170.0 WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'weight_kg') IS NULL
    ALTER TABLE dbo.customers ADD weight_kg decimal(5, 1) NOT NULL CONSTRAINT DF_customers_weight_kg DEFAULT 65.0 WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'religion') IS NULL
    ALTER TABLE dbo.customers ADD religion nvarchar(60) NOT NULL CONSTRAINT DF_customers_religion DEFAULT N'무교' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'hobbies') IS NULL
    ALTER TABLE dbo.customers ADD hobbies nvarchar(255) NOT NULL CONSTRAINT DF_customers_hobbies DEFAULT N'독서, 영화감상' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'personality') IS NULL
    ALTER TABLE dbo.customers ADD personality nvarchar(255) NOT NULL CONSTRAINT DF_customers_personality DEFAULT N'차분하고 책임감이 강함' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'family_details') IS NULL
    ALTER TABLE dbo.customers ADD family_details nvarchar(500) NOT NULL CONSTRAINT DF_customers_family_details DEFAULT N'부모님과 원만한 관계' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'asset_summary') IS NULL
    ALTER TABLE dbo.customers ADD asset_summary nvarchar(500) NOT NULL CONSTRAINT DF_customers_asset_summary DEFAULT N'예금 및 적금 보유' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'past_history') IS NULL
    ALTER TABLE dbo.customers ADD past_history nvarchar(500) NOT NULL CONSTRAINT DF_customers_past_history DEFAULT N'특이 과거 이력 없음' WITH VALUES;

IF COL_LENGTH(N'dbo.customers', N'customer_grade') IS NULL
    ALTER TABLE dbo.customers ADD customer_grade nvarchar(10) NOT NULL CONSTRAINT DF_customers_customer_grade DEFAULT N'B' WITH VALUES;
GO

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_customers_customer_grade')
    ALTER TABLE dbo.customers WITH CHECK ADD CONSTRAINT CK_customers_customer_grade CHECK (customer_grade IN (N'S', N'A', N'B'));

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_customers_gender')
    ALTER TABLE dbo.customers WITH CHECK ADD CONSTRAINT CK_customers_gender CHECK (gender IN (N'남성', N'여성', N'비공개'));

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_customers_height_cm')
    ALTER TABLE dbo.customers WITH CHECK ADD CONSTRAINT CK_customers_height_cm CHECK (height_cm BETWEEN 130.0 AND 220.0);

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_customers_weight_kg')
    ALTER TABLE dbo.customers WITH CHECK ADD CONSTRAINT CK_customers_weight_kg CHECK (weight_kg BETWEEN 35.0 AND 160.0);
GO

;WITH numbered AS
(
    SELECT id, ROW_NUMBER() OVER (ORDER BY id) AS rn
    FROM dbo.customers
)
UPDATE c
SET
    gender = CASE WHEN n.rn % 2 = 0 THEN N'남성' ELSE N'여성' END,
    company_name = CHOOSE(((n.rn - 1) % 16) + 1,
        N'한빛핀테크', N'세종바이오', N'라온모빌리티', N'유니온자산운용',
        N'에이펙스컨설팅', N'도담제약', N'메트로건설', N'노블에듀',
        N'프라임로펌', N'가온클라우드', N'비전병원', N'성우전자',
        N'인사이트리서치', N'하나투어비즈', N'마루디자인', N'현대계열 협력사'),
    height_cm = CAST(158 + (n.rn % 31) + CASE WHEN n.rn % 2 = 0 THEN 0.4 ELSE 0.8 END AS decimal(5, 1)),
    weight_kg = CAST(48 + (n.rn % 38) + CASE WHEN n.rn % 3 = 0 THEN 0.2 ELSE 0.7 END AS decimal(5, 1)),
    religion = CHOOSE((n.rn % 6) + 1, N'무교', N'기독교', N'천주교', N'불교', N'원불교', N'종교 비공개'),
    hobbies = CHOOSE((n.rn % 10) + 1,
        N'골프, 와인 모임', N'등산, 사진 촬영', N'독서, 클래식 공연',
        N'러닝, 재테크 스터디', N'요리, 여행', N'필라테스, 미술관 관람',
        N'테니스, 영화 감상', N'캠핑, 드라이브', N'수영, 외국어 공부', N'봉사활동, 음악 감상'),
    personality = CHOOSE((n.rn % 8) + 1,
        N'차분하고 책임감이 강하며 감정 표현은 신중함',
        N'외향적이고 대화 주도력이 높으며 일정 관리가 꼼꼼함',
        N'분석적이고 현실적인 의사결정을 선호함',
        N'배려가 많고 가족 중심의 생활 방식을 선호함',
        N'자기계발 의지가 높고 경제 관념이 뚜렷함',
        N'관계에서 안정감과 신뢰를 중요하게 생각함',
        N'유머감각이 있고 갈등 상황에서 조율을 선호함',
        N'독립적 성향이 강하고 사생활 경계를 중요하게 여김'),
    family_details = CHOOSE((n.rn % 8) + 1,
        N'부모님 노후 지원 계획 있음, 형제와 재산 분담 협의 이력 있음',
        N'부모님과 근거리 거주 희망, 결혼 후 주거지 협의 필요',
        N'가족 사업 지분 일부 보유, 명절 일정 조율 민감',
        N'어머니 건강 문제로 장거리 거주를 부담스러워함',
        N'형제 해외 거주, 부모님 부양 책임은 본인이 주로 부담',
        N'가족 간 종교 차이로 배우자 조건 협의 필요',
        N'부모님 이혼 이력으로 안정적인 가족관을 중요하게 봄',
        N'상견례 및 가족 공개 시점을 늦게 가져가길 희망'),
    asset_summary = CHOOSE((n.rn % 10) + 1,
        N'자가 아파트 1채, 예금 1억2000만원, 국내 주식 보유',
        N'전세 보증금 2억8000만원, 연금저축 및 ETF 보유',
        N'오피스텔 1채 임대 수익, 대출 잔액 9000만원',
        N'부모님 명의 부동산 상속 가능성 상담 기록 있음',
        N'예금 7000만원, 퇴직연금, 자동차 리스 이용',
        N'비상장주식 일부 보유, 투자 손실 이력 상담 기록 있음',
        N'자가 없음, 현금성 자산 1억 미만, 신용대출 상환 중',
        N'분양권 보유, 중도금 대출 실행 예정',
        N'가족 공동명의 토지 지분 보유',
        N'개인사업 매출 변동성 있음, 세무 상담 이력 존재'),
    past_history = CHOOSE((n.rn % 8) + 1,
        N'장기 연애 종료 후 1년 경과, 이전 파혼 이력 없음',
        N'이직 2회, 해외 장기 출장 경험으로 일정 조율 필요',
        N'이전 교제 종료 사유에 대한 상담 메모 존재',
        N'건강검진 이상 소견은 없으나 가족력 질문에 민감함',
        N'결혼정보회사 이전 가입 이력 있음, 매칭 불만족 경험',
        N'개인사업 실패 후 재취업, 재무 안정성 확인 필요',
        N'유학 및 해외 거주 이력, 장거리 관계 경험 있음',
        N'파혼 상담 이력 있음, 가족 공개 전 충분한 교제 기간 희망'),
    customer_grade = CASE
        WHEN n.rn % 10 IN (0, 1) THEN N'S'
        WHEN n.rn % 10 IN (2, 3, 4, 5) THEN N'A'
        ELSE N'B'
    END
FROM dbo.customers c
JOIN numbered n ON n.id = c.id;
GO

DECLARE @targetCustomers int = 500;
DECLARE @n int;
DECLARE @lastName nvarchar(10);
DECLARE @givenName nvarchar(20);
DECLARE @company nvarchar(120);
DECLARE @occupation nvarchar(100);
DECLARE @grade nvarchar(10);
DECLARE @income decimal(18, 0);
DECLARE @height decimal(5, 1);
DECLARE @weight decimal(5, 1);
DECLARE @religion nvarchar(60);
DECLARE @hobbies nvarchar(255);
DECLARE @personality nvarchar(255);
DECLARE @familyRelations nvarchar(255);
DECLARE @familyDetails nvarchar(500);
DECLARE @assetSummary nvarchar(500);
DECLARE @maritalHistory nvarchar(255);
DECLARE @pastHistory nvarchar(500);

WHILE (SELECT COUNT(*) FROM dbo.customers) < @targetCustomers
BEGIN
    SET @n = (SELECT COUNT(*) FROM dbo.customers) + 1;
    SET @lastName = CHOOSE((@n % 12) + 1, N'김', N'이', N'박', N'최', N'정', N'강', N'조', N'윤', N'장', N'임', N'오', N'한');
    SET @givenName = CHOOSE((@n % 24) + 1,
        N'민준', N'서연', N'도윤', N'하은', N'지호', N'수아', N'현우', N'예린',
        N'준서', N'유나', N'시우', N'다은', N'태민', N'채린', N'건우', N'나연',
        N'지훈', N'소윤', N'우진', N'가은', N'선우', N'민서', N'재윤', N'하린');
    SET @company = CHOOSE((@n % 20) + 1,
        N'한빛핀테크', N'세종바이오', N'라온모빌리티', N'유니온자산운용',
        N'에이펙스컨설팅', N'도담제약', N'메트로건설', N'노블에듀',
        N'프라임로펌', N'가온클라우드', N'비전병원', N'성우전자',
        N'인사이트리서치', N'하나투어비즈', N'마루디자인', N'현대계열 협력사',
        N'미래회계법인', N'중앙대학교병원', N'더블유커머스', N'서울도시공사');
    SET @occupation = CHOOSE((@n % 18) + 1,
        N'소프트웨어 엔지니어', N'변호사', N'회계사', N'의사', N'약사', N'공기업 재직',
        N'전략 컨설턴트', N'브랜드 매니저', N'금융 애널리스트', N'건축사', N'연구원',
        N'대기업 인사팀', N'데이터 분석가', N'세무사', N'항공사 사무직',
        N'대학교 교직원', N'스타트업 대표', N'프리랜서 디자이너');
    SET @grade = CASE WHEN @n % 10 IN (0, 1) THEN N'S' WHEN @n % 10 IN (2, 3, 4, 5) THEN N'A' ELSE N'B' END;
    SET @income = CASE @grade
        WHEN N'S' THEN 95000000 + ((@n % 90) * 1000000)
        WHEN N'A' THEN 65000000 + ((@n % 45) * 1000000)
        ELSE 38000000 + ((@n % 35) * 1000000)
    END;
    SET @height = CAST(155 + (@n % 36) + CASE WHEN @n % 2 = 0 THEN 0.3 ELSE 0.8 END AS decimal(5, 1));
    SET @weight = CAST(47 + (@n % 44) + CASE WHEN @n % 3 = 0 THEN 0.2 ELSE 0.7 END AS decimal(5, 1));
    SET @religion = CHOOSE((@n % 6) + 1, N'무교', N'기독교', N'천주교', N'불교', N'원불교', N'종교 비공개');
    SET @hobbies = CHOOSE((@n % 10) + 1,
        N'골프, 와인 모임', N'등산, 사진 촬영', N'독서, 클래식 공연',
        N'러닝, 재테크 스터디', N'요리, 여행', N'필라테스, 미술관 관람',
        N'테니스, 영화 감상', N'캠핑, 드라이브', N'수영, 외국어 공부', N'봉사활동, 음악 감상');
    SET @personality = CHOOSE((@n % 8) + 1,
        N'차분하고 책임감이 강하며 감정 표현은 신중함',
        N'외향적이고 대화 주도력이 높으며 일정 관리가 꼼꼼함',
        N'분석적이고 현실적인 의사결정을 선호함',
        N'배려가 많고 가족 중심의 생활 방식을 선호함',
        N'자기계발 의지가 높고 경제 관념이 뚜렷함',
        N'관계에서 안정감과 신뢰를 중요하게 생각함',
        N'유머감각이 있고 갈등 상황에서 조율을 선호함',
        N'독립적 성향이 강하고 사생활 경계를 중요하게 여김');
    SET @familyRelations = CHOOSE((@n % 8) + 1,
        N'부모님, 남동생 1명', N'어머니, 여동생 1명', N'부모님, 형 1명',
        N'부모님, 언니 1명', N'아버지, 누나 1명', N'어머니',
        N'부모님, 형제 없음', N'부모님, 오빠 1명');
    SET @familyDetails = CHOOSE((@n % 8) + 1,
        N'부모님 노후 지원 계획 있음, 형제와 재산 분담 협의 이력 있음',
        N'부모님과 근거리 거주 희망, 결혼 후 주거지 협의 필요',
        N'가족 사업 지분 일부 보유, 명절 일정 조율 민감',
        N'어머니 건강 문제로 장거리 거주를 부담스러워함',
        N'형제 해외 거주, 부모님 부양 책임은 본인이 주로 부담',
        N'가족 간 종교 차이로 배우자 조건 협의 필요',
        N'부모님 이혼 이력으로 안정적인 가족관을 중요하게 봄',
        N'상견례 및 가족 공개 시점을 늦게 가져가길 희망');
    SET @assetSummary = CHOOSE((@n % 10) + 1,
        N'자가 아파트 1채, 예금 1억2000만원, 국내 주식 보유',
        N'전세 보증금 2억8000만원, 연금저축 및 ETF 보유',
        N'오피스텔 1채 임대 수익, 대출 잔액 9000만원',
        N'부모님 명의 부동산 상속 가능성 상담 기록 있음',
        N'예금 7000만원, 퇴직연금, 자동차 리스 이용',
        N'비상장주식 일부 보유, 투자 손실 이력 상담 기록 있음',
        N'자가 없음, 현금성 자산 1억 미만, 신용대출 상환 중',
        N'분양권 보유, 중도금 대출 실행 예정',
        N'가족 공동명의 토지 지분 보유',
        N'개인사업 매출 변동성 있음, 세무 상담 이력 존재');
    SET @maritalHistory = CHOOSE((@n % 5) + 1, N'미혼', N'미혼, 장기 연애 이력 있음', N'파혼 이력 상담 필요', N'재혼 검토', N'미혼, 결혼 준비 경험 있음');
    SET @pastHistory = CHOOSE((@n % 8) + 1,
        N'장기 연애 종료 후 1년 경과, 이전 파혼 이력 없음',
        N'이직 2회, 해외 장기 출장 경험으로 일정 조율 필요',
        N'이전 교제 종료 사유에 대한 상담 메모 존재',
        N'건강검진 이상 소견은 없으나 가족력 질문에 민감함',
        N'결혼정보회사 이전 가입 이력 있음, 매칭 불만족 경험',
        N'개인사업 실패 후 재취업, 재무 안정성 확인 필요',
        N'유학 및 해외 거주 이력, 장거리 관계 경험 있음',
        N'파혼 상담 이력 있음, 가족 공개 전 충분한 교제 기간 희망');

    INSERT INTO dbo.customers
        (name, gender, birth_date, phone, address, occupation, company_name, education, annual_income,
         height_cm, weight_kg, religion, hobbies, personality, family_relations, family_details,
         asset_summary, marital_history, past_history, customer_grade, created_at)
    VALUES
        (@lastName + @givenName,
         CASE WHEN @n % 2 = 0 THEN N'남성' ELSE N'여성' END,
         DATEFROMPARTS(1981 + (@n % 15), 1 + (@n % 12), 1 + (@n % 27)),
         N'010-' + RIGHT(N'0000' + CONVERT(nvarchar(10), 2000 + @n), 4) + N'-' + RIGHT(N'0000' + CONVERT(nvarchar(10), 5000 + @n), 4),
         CHOOSE((@n % 12) + 1, N'서울특별시 강남구', N'서울특별시 마포구', N'서울특별시 송파구', N'경기도 성남시 분당구',
             N'경기도 수원시 영통구', N'인천광역시 연수구', N'부산광역시 해운대구', N'대구광역시 수성구',
             N'대전광역시 유성구', N'광주광역시 서구', N'세종특별자치시', N'경기도 고양시 일산동구')
             + N' ' + CONVERT(nvarchar(10), (@n % 80) + 1) + N'길 ' + CONVERT(nvarchar(10), (@n % 120) + 1),
         @occupation,
         @company,
         CHOOSE((@n % 5) + 1, N'대학교 졸업', N'대학원 졸업', N'박사 과정 수료', N'해외대학 졸업', N'전문대 졸업'),
         @income,
         @height,
         @weight,
         @religion,
         @hobbies,
         @personality,
         @familyRelations,
         @familyDetails,
         @assetSummary,
         @maritalHistory,
         @pastHistory,
         @grade,
         DATEADD(day, -(@n % 240), SYSUTCDATETIME()));
END;
GO

INSERT INTO dbo.consulting_notes
    (customer_id, consulted_at, counselor_name, preference, counselor_note, sensitive_details)
SELECT
    c.id,
    DATEADD(day, -(c.id % 120), SYSUTCDATETIME()),
    CHOOSE((c.id % 4) + 1, N'상담사A', N'상담사B', N'상담사C', N'상담사D'),
    CASE c.customer_grade
        WHEN N'S' THEN N'자산, 학력, 가족 배경이 유사한 프리미엄 후보 우선 추천'
        WHEN N'A' THEN N'직업 안정성과 생활권이 맞는 후보 우선 추천'
        ELSE N'기본 선호 조건과 대화 성향 중심 추천'
    END,
    N'가상 상담 메모: 회사, 연 소득, 가족 상황, 거주 계획을 종합 검토함',
    N'가상 민감정보: ' + c.asset_summary + N' / ' + c.past_history
FROM dbo.customers c
WHERE NOT EXISTS (SELECT 1 FROM dbo.consulting_notes n WHERE n.customer_id = c.id);
GO

INSERT INTO dbo.contracts
    (customer_id, contract_date, end_date, membership_level, payment_amount, contract_status)
SELECT
    c.id,
    CAST(DATEADD(day, -(c.id % 180), SYSUTCDATETIME()) AS date),
    CAST(DATEADD(day, 365 - (c.id % 60), SYSUTCDATETIME()) AS date),
    CASE WHEN c.customer_grade IN (N'S', N'A') THEN N'PREMIUM' ELSE N'STANDARD' END,
    CASE c.customer_grade WHEN N'S' THEN 7800000 WHEN N'A' THEN 4800000 ELSE 2600000 END,
    CASE WHEN c.id % 17 = 0 THEN N'EXPIRED' ELSE N'ACTIVE' END
FROM dbo.customers c
WHERE NOT EXISTS (SELECT 1 FROM dbo.contracts ct WHERE ct.customer_id = c.id);
GO

INSERT INTO dbo.matching_history
    (customer_id, matched_customer_id, matched_at, meeting_result, feedback, counselor_evaluation)
SELECT
    c.id,
    partner.id,
    CAST(DATEADD(day, -(c.id % 90), SYSUTCDATETIME()) AS date),
    CHOOSE((c.id % 4) + 1, N'만남 완료', N'일정 조율 중', N'추천 보류', N'후속 상담 예정'),
    CHOOSE((c.id % 5) + 1,
        N'생활권은 유사하나 가족 조건 추가 확인 필요',
        N'대화 분위기는 양호하나 재무 조건을 더 확인하길 원함',
        N'종교와 취미 조건은 긍정적이며 후속 만남 가능',
        N'거리와 근무 일정으로 조율 필요',
        N'상대방의 과거 이력 공개 범위를 조심스럽게 협의 중'),
    CHOOSE((c.id % 4) + 1, N'추가 만남 추천', N'조건 재검토', N'상담사 관찰 필요', N'회원 피드백 대기')
FROM dbo.customers c
CROSS APPLY
(
    SELECT TOP (1) x.id
    FROM dbo.customers x
    WHERE x.id <> c.id
    ORDER BY CASE WHEN x.id > c.id THEN 0 ELSE 1 END, x.id
) partner
WHERE NOT EXISTS (SELECT 1 FROM dbo.matching_history h WHERE h.customer_id = c.id);
GO

SELECT
    (SELECT COUNT(*) FROM dbo.customers) AS customer_count,
    (SELECT COUNT(*) FROM dbo.consulting_notes) AS consulting_note_count,
    (SELECT COUNT(*) FROM dbo.contracts) AS contract_count,
    (SELECT COUNT(*) FROM dbo.matching_history) AS matching_history_count,
    (SELECT COUNT(*) FROM dbo.customers WHERE company_name <> N'비공개' AND customer_grade IN (N'S', N'A', N'B')) AS enriched_customer_count;
GO
