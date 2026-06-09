/*
  Add requested customer records and matching history.
  Run on MarriageCrm with a privileged account such as sa.
  customer_portal_accounts stores lab seed credentials only; the CRM app does not use this table for login.
*/

USE MarriageCrm;
GO

SET XACT_ABORT ON;
BEGIN TRAN;

IF OBJECT_ID(N'dbo.customer_portal_accounts', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.customer_portal_accounts
    (
        id                 int IDENTITY(1, 1) PRIMARY KEY,
        customer_id        int NOT NULL REFERENCES dbo.customers(id),
        username           nvarchar(80) NOT NULL,
        password_plaintext nvarchar(200) NOT NULL,
        role               nvarchar(30) NOT NULL CONSTRAINT DF_customer_portal_accounts_role DEFAULT N'customer',
        created_at         datetime2(0) NOT NULL CONSTRAINT DF_customer_portal_accounts_created_at DEFAULT SYSUTCDATETIME(),
        CONSTRAINT UQ_customer_portal_accounts_username UNIQUE (username),
        CONSTRAINT CK_customer_portal_accounts_role CHECK (role IN (N'customer'))
    );
END;

IF OBJECT_ID(N'tempdb..#seed') IS NOT NULL DROP TABLE #seed;
CREATE TABLE #seed
(
    username nvarchar(80) NOT NULL PRIMARY KEY,
    password_plaintext nvarchar(200) NOT NULL,
    name nvarchar(80) NOT NULL,
    gender nvarchar(10) NOT NULL,
    birth_date date NOT NULL,
    phone nvarchar(30) NOT NULL,
    address nvarchar(255) NOT NULL,
    occupation nvarchar(100) NOT NULL,
    company_name nvarchar(120) NOT NULL,
    education nvarchar(100) NOT NULL,
    annual_income decimal(18, 0) NOT NULL,
    height_cm decimal(5, 1) NOT NULL,
    weight_kg decimal(5, 1) NOT NULL,
    religion nvarchar(60) NOT NULL,
    hobbies nvarchar(255) NOT NULL,
    personality nvarchar(255) NOT NULL,
    family_relations nvarchar(255) NOT NULL,
    family_details nvarchar(500) NOT NULL,
    asset_summary nvarchar(500) NOT NULL,
    marital_history nvarchar(255) NOT NULL,
    past_history nvarchar(500) NOT NULL,
    customer_grade nvarchar(10) NOT NULL,
    membership_level nvarchar(40) NOT NULL,
    payment_amount decimal(18, 0) NOT NULL,
    counselor_name nvarchar(80) NOT NULL
);

INSERT INTO #seed
    (username, password_plaintext, name, gender, birth_date, phone, address, occupation, company_name, education,
     annual_income, height_cm, weight_kg, religion, hobbies, personality, family_relations, family_details,
     asset_summary, marital_history, past_history, customer_grade, membership_level, payment_amount, counselor_name)
VALUES
    (N'lee.heeyoon', N'Heeyoon.Lee@2026!', N'이희윤', N'여성', '1996-03-18', N'010-6101-3001', N'서울특별시 강남구 테헤란로 101', N'브랜드 전략 매니저', N'라온뷰티코리아', N'대학원 졸업', 82000000, 164.2, 49.8, N'무교', N'플라워 클래스, 전시 관람', N'차분하고 배려심이 깊으며 관계의 신뢰를 중시함', N'부모님, 남동생 1명', N'부모님과 주거지가 가까워 결혼 후 생활권 조율이 필요함', N'전세 보증금 2억 원, 적립식 펀드와 예금 보유', N'미혼', N'장기 해외 출장 이력 1회, 이전 장거리 연애 경험 있음', N'A', N'프리미엄', 4800000, N'서민지'),
    (N'kim.nayoung', N'Nayoung.Kim@2026!', N'김나영', N'여성', '1994-11-07', N'010-6101-3002', N'서울특별시 용산구 한강대로 22', N'패션 MD', N'오브제리테일', N'대학 졸업', 76000000, 168.0, 52.5, N'천주교', N'요가, 와인 시음', N'외향적이고 일정 관리가 꼼꼼함', N'어머니, 언니 1명', N'가족 행사 참여 빈도가 높아 일정 협의가 중요함', N'오피스텔 1채 공동명의, 잔여 대출 7천만 원', N'미혼, 결혼 준비 경험 있음', N'이전 교제 종료 사유 공개 범위 상담 필요', N'A', N'프리미엄', 4800000, N'박준호'),
    (N'cho.dan', N'Dan.Cho@2026!', N'쵸단', N'여성', '1998-06-14', N'010-6101-3003', N'경기도 성남시 분당구 판교역로 33', N'콘텐츠 크리에이터', N'스튜디오단', N'대학 졸업', 125000000, 165.4, 50.9, N'비공개', N'드럼, 피트니스', N'독립적이고 자기관리가 철저하며 솔직한 대화를 선호함', N'부모님, 외동', N'직업 특성상 공개 범위와 사생활 보호 조건이 민감함', N'개인사업 매출 변동성이 있으나 현금성 자산 충분', N'미혼', N'대중 노출 직업으로 만남 공개 시점 조율 필요', N'S', N'프리미엄', 7800000, N'정하린'),
    (N'hina', N'Hina.User@2026!', N'히나', N'여성', '1997-09-02', N'010-6101-3004', N'서울특별시 마포구 월드컵북로 74', N'글로벌 마케팅 담당자', N'하모니인터내셔널', N'해외 대학 졸업', 91000000, 162.7, 47.8, N'무교', N'여행, 어학 공부', N'온화하고 현실적인 의사결정을 선호함', N'부모님, 여동생 1명', N'국외 거주 가족과의 왕래가 있어 장기 일정 협의 필요', N'예금 1억 1천만 원, 외화 예금 일부 보유', N'미혼', N'해외 장기 체류 이력으로 생활권 합의가 중요함', N'S', N'프리미엄', 7800000, N'한지우'),
    (N'yoon.younga1', N'Younga.Yoon1@2026!', N'윤영아', N'여성', '1995-01-23', N'010-6101-3005', N'경기도 고양시 일산동구 중앙로 18', N'공공기관 사무직', N'한국문화진흥원', N'대학 졸업', 62000000, 160.5, 48.6, N'기독교', N'독서, 클래식 공연', N'성실하고 안정적인 생활 패턴을 선호함', N'부모님, 오빠 1명', N'종교 활동 참여 빈도가 높아 배우자 종교 이해가 필요함', N'청약 저축 및 예금 8천만 원 보유', N'미혼', N'특이 과거 이력 없음', N'B', N'스탠다드', 2600000, N'이서윤'),
    (N'lee.hwimin', N'Hwimin.Lee@2026!', N'이휘민', N'여성', '1993-04-29', N'010-6101-3006', N'서울특별시 송파구 올림픽로 55', N'약사', N'연세온누리약국', N'대학 졸업', 88000000, 166.1, 51.2, N'불교', N'필라테스, 미술관 관람', N'신중하고 책임감이 강함', N'부모님, 남동생 1명', N'가족 건강 이슈로 거주 지역을 크게 벗어나기 어려움', N'전세 보증금 1억 8천만 원, 퇴직연금 보유', N'미혼', N'건강 관련 가족력 질문에 민감함', N'A', N'프리미엄', 4800000, N'강유진'),
    (N'yoon.younga2', N'Younga.Yoon2@2026!', N'윤영아', N'여성', '1999-12-11', N'010-6101-3007', N'인천광역시 연수구 컨벤시아대로 77', N'UX 디자이너', N'브릿지디자인랩', N'대학 졸업', 68000000, 163.3, 49.9, N'무교', N'러닝, 사진 촬영', N'밝고 사교적이며 새로운 환경 적응이 빠름', N'어머니와 단둘이 거주', N'부모님 이혼 이력으로 안정적인 가족관계를 중요하게 봄', N'예금 6천만 원, 국내 주식 소액 투자', N'미혼', N'이전 교제 가족 공개 시점으로 갈등 경험 있음', N'B', N'스탠다드', 2600000, N'서민지'),
    (N'kim.jiwon', N'Jiwon.Kim@2026!', N'김지원', N'여성', '1996-08-20', N'010-6101-3008', N'서울특별시 서초구 반포대로 39', N'방송 작가', N'제이콘텐츠웍스', N'대학 졸업', 73000000, 161.9, 48.1, N'비공개', N'영화 감상, 글쓰기', N'감수성이 풍부하고 대화의 깊이를 중요하게 여김', N'부모님, 언니 1명', N'불규칙한 업무 일정으로 만남 시간 조율이 필요함', N'프리랜서 수입 변동성 있음, 비상금 계좌 보유', N'미혼', N'야간 업무와 장기 프로젝트 이력으로 일정 조율 필요', N'B', N'스탠다드', 2600000, N'박준호'),
    (N'cho.yihyun', N'Yihyun.Cho@2026!', N'조이현', N'여성', '1992-12-08', N'010-6101-3009', N'서울특별시 성동구 왕십리로 91', N'배우', N'아르떼엔터테인먼트', N'대학 졸업', 118000000, 170.0, 52.0, N'무교', N'등산, 요리', N'자기 주관이 분명하고 상대의 배려를 중요하게 봄', N'부모님, 남동생 1명', N'직업상 공개 여부와 언론 노출 가능성을 사전 협의해야 함', N'자가 오피스텔 1채, 현금성 자산 1억 이상', N'미혼', N'대중 노출 직업으로 사생활 보호 조건 중요', N'S', N'프리미엄', 7800000, N'정하린'),
    (N'oh.haewon', N'Haewon.Oh@2026!', N'오해원', N'여성', '1998-02-25', N'010-6101-3010', N'서울특별시 강서구 마곡중앙로 12', N'음악 기획자', N'루미나뮤직', N'대학 졸업', 84000000, 162.0, 47.5, N'천주교', N'보컬 트레이닝, 산책', N'긍정적이고 관계에서 진정성을 중요하게 여김', N'부모님, 여동생 1명', N'가족과 왕래가 잦아 명절 일정 조율 필요', N'예금 9천만 원, 연금저축 보유', N'미혼', N'해외 공연 동행 이력으로 일정 변동이 잦음', N'A', N'프리미엄', 4800000, N'한지우'),
    (N'kim.taehoon', N'Taehoon.Kim@2026!', N'김태훈', N'남성', '1990-05-16', N'010-6201-4001', N'서울특별시 강남구 선릉로 120', N'IT 스타트업 대표', N'넥스트브릿지', N'대학원 졸업', 145000000, 181.2, 76.0, N'무교', N'크로스핏, 독서', N'목표 지향적이고 의사결정이 빠름', N'부모님, 형 1명', N'사업 일정 변동성이 커 장기 계획을 명확히 해야 함', N'법인 지분 및 자가 아파트 보유, 사업 대출 일부 있음', N'미혼', N'창업 초기 재무 리스크 상담 이력 있음', N'S', N'프리미엄', 7800000, N'정하린'),
    (N'kwon.soonhyung', N'Soonhyung.Kwon@2026!', N'권순형', N'남성', '1989-10-04', N'010-6201-4002', N'서울특별시 마포구 독막로 45', N'금융 애널리스트', N'유니슨자산운용', N'해외 대학 졸업', 132000000, 178.4, 72.3, N'무교', N'테니스, 와인 시음', N'분석적이고 차분하며 안정적인 관계를 선호함', N'부모님, 여동생 1명', N'가족 자산 관리에 관여하고 있어 재무 공개 범위 협의 필요', N'자가 아파트 1채, 국내외 ETF 및 채권 보유', N'미혼', N'해외 근무 이력 2년, 장거리 관계 경험 있음', N'S', N'프리미엄', 7800000, N'한지우'),
    (N'song.yeonsu', N'Yeonsu.Song@2026!', N'송연수', N'남성', '1994-07-22', N'010-6201-4003', N'경기도 수원시 영통구 광교중앙로 87', N'변호사', N'프라임법률사무소', N'대학원 졸업', 112000000, 176.8, 70.1, N'기독교', N'골프, 클래식 공연', N'책임감이 강하고 가족 중심적인 성향', N'부모님, 누나 1명', N'부모님 노후 지원 계획이 있어 배우자 이해가 필요함', N'전세 보증금 2억 7천만 원, 변액연금 보유', N'미혼', N'업무상 주말 일정 변동이 잦음', N'A', N'프리미엄', 4800000, N'이서윤'),
    (N'son.gyeongseok', N'Gyeongseok.Son@2026!', N'손경석', N'남성', '1991-01-30', N'010-6201-4004', N'서울특별시 송파구 백제고분로 66', N'정형외과 전문의', N'비전메디컬센터', N'박사 과정 수료', 156000000, 180.5, 75.4, N'불교', N'수영, 여행', N'신중하고 현실적인 결정을 선호함', N'부모님, 남동생 1명', N'병원 근무 일정상 평일 저녁 상담 선호', N'자가 아파트 1채, 예금 1억 5천만 원 보유', N'미혼', N'전공의 시절 장기 교제 종료 이력 상담 필요', N'S', N'프리미엄', 7800000, N'강유진'),
    (N'jung.woosung', N'Woosung.Jung@2026!', N'정우성', N'남성', '1988-03-19', N'010-6201-4005', N'서울특별시 종로구 새문안로 11', N'영화 제작자', N'블루필름스튜디오', N'대학 졸업', 138000000, 186.0, 79.5, N'비공개', N'사진 촬영, 미술관 관람', N'여유롭고 배려심이 있으며 사생활을 중시함', N'부모님, 형 1명', N'직업 특성상 외부 공개 일정과 사생활 보호가 중요함', N'상업용 부동산 지분, 현금성 자산 2억 이상', N'미혼', N'대중 노출 직업으로 가족 공개 시점 조율 필요', N'S', N'프리미엄', 7800000, N'서민지'),
    (N'gong.yoo', N'Yoo.Gong@2026!', N'공유', N'남성', '1986-09-12', N'010-6201-4006', N'부산광역시 해운대구 센텀중앙로 24', N'광고 기획자', N'노블애드컴퍼니', N'대학 졸업', 104000000, 184.2, 77.2, N'무교', N'캠핑, 드라이브', N'온화하고 갈등 상황에서 조율을 선호함', N'부모님, 외동', N'부모님과 장거리 거주 중이라 명절 이동 계획 협의 필요', N'자가 없음, 예금 1억 2천만 원, 차량 보유', N'미혼', N'장기 해외 프로젝트 참여 이력 있음', N'A', N'프리미엄', 4800000, N'박준호'),
    (N'car.thegarden', N'Thegarden.Car@2026!', N'카더가든', N'남성', '1992-10-23', N'010-6201-4007', N'서울특별시 서대문구 연희로 31', N'싱어송라이터', N'가든뮤직', N'대학 졸업', 97000000, 173.5, 68.4, N'비공개', N'음악 감상, 산책', N'감성적이고 솔직한 소통을 선호함', N'어머니, 누나 1명', N'공연 일정이 불규칙하여 만남 일정 조율 필요', N'저작권 수익 및 예금 보유, 수입 변동성 있음', N'미혼', N'야간 공연 일정과 장기 투어 이력 있음', N'A', N'프리미엄', 4800000, N'박준호'),
    (N'wi.hajoon', N'Hajoon.Wi@2026!', N'위하준', N'남성', '1991-08-05', N'010-6201-4008', N'서울특별시 성동구 서울숲길 9', N'피트니스 브랜드 이사', N'모션핏코리아', N'대학 졸업', 118000000, 180.0, 74.0, N'무교', N'러닝, 복싱', N'성실하고 자기관리가 철저함', N'부모님, 여동생 1명', N'가족 사업 일부를 돕고 있어 주말 일정 협의 필요', N'자가 오피스텔 1채, 국내 주식 보유', N'미혼', N'운동 관련 부상 이력 상담 기록 있음', N'S', N'프리미엄', 7800000, N'정하린'),
    (N'yoon.taewon', N'Taewon.Yoon@2026!', N'윤태원', N'남성', '1995-05-27', N'010-6201-4009', N'경기도 성남시 수정구 위례광장로 28', N'데이터 엔지니어', N'스타전자', N'대학원 졸업', 94000000, 177.7, 71.6, N'천주교', N'보드게임, 등산', N'논리적이고 안정적인 생활을 선호함', N'부모님, 남동생 1명', N'종교 행사 참여 여부를 배우자와 사전 조율하고 싶어함', N'전세 보증금 1억 6천만 원, 퇴직연금 보유', N'미혼', N'특이 과거 이력 없음', N'A', N'프리미엄', 4800000, N'서민지'),
    (N'lee.seungwon', N'Seungwon.Lee@2026!', N'이승원', N'남성', '1993-11-15', N'010-6201-4010', N'서울특별시 강동구 천호대로 102', N'건축사', N'제이스페이스커넥트', N'대학 졸업', 86000000, 175.2, 69.8, N'기독교', N'요리, 전시 관람', N'섬세하고 장기적인 계획을 중요하게 생각함', N'부모님, 형 1명', N'주거지 선택에서 직장 접근성과 부모님 거리를 함께 고려함', N'청약 당첨 이력, 중도금 대출 실행 예정', N'미혼, 결혼 준비 경험 있음', N'이전 결혼 준비 중 파혼 상담 이력 있음', N'B', N'스탠다드', 2600000, N'한지우');

INSERT INTO dbo.customers
    (name, gender, birth_date, phone, address, occupation, company_name, education, annual_income,
     height_cm, weight_kg, religion, hobbies, personality, family_relations, family_details,
     asset_summary, marital_history, past_history, customer_grade, created_at)
SELECT
    s.name, s.gender, s.birth_date, s.phone, s.address, s.occupation, s.company_name, s.education,
    s.annual_income, s.height_cm, s.weight_kg, s.religion, s.hobbies, s.personality,
    s.family_relations, s.family_details, s.asset_summary, s.marital_history, s.past_history,
    s.customer_grade, SYSUTCDATETIME()
FROM #seed AS s
WHERE NOT EXISTS (SELECT 1 FROM dbo.customer_portal_accounts AS a WHERE a.username = s.username)
  AND NOT EXISTS (SELECT 1 FROM dbo.customers AS c WHERE c.phone = s.phone);

INSERT INTO dbo.customer_portal_accounts
    (customer_id, username, password_plaintext, role)
SELECT c.id, s.username, s.password_plaintext, N'customer'
FROM #seed AS s
JOIN dbo.customers AS c ON c.phone = s.phone
WHERE NOT EXISTS (SELECT 1 FROM dbo.customer_portal_accounts AS a WHERE a.username = s.username);

INSERT INTO dbo.contracts
    (customer_id, contract_date, end_date, membership_level, payment_amount, contract_status)
SELECT c.id, CONVERT(date, '2026-06-09'), CONVERT(date, '2027-06-08'),
       s.membership_level, s.payment_amount, N'유효'
FROM #seed AS s
JOIN dbo.customer_portal_accounts AS a ON a.username = s.username
JOIN dbo.customers AS c ON c.id = a.customer_id
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.contracts AS existing
    WHERE existing.customer_id = c.id
      AND existing.contract_date = CONVERT(date, '2026-06-09')
);

INSERT INTO dbo.consulting_notes
    (customer_id, consulted_at, counselor_name, preference, counselor_note, sensitive_details)
SELECT c.id,
       CONVERT(datetime2(0), '2026-06-09T10:00:00'),
       s.counselor_name,
       N'직업 안정성, 생활권, 가족관계, 결혼 의사를 종합하여 후보군을 검토함',
       N'신규 상담 신청서와 초기 면담 내용을 바탕으로 프로필을 등록하고 우선 매칭 조건을 정리함',
       N'민감 상담 내용: ' + s.asset_summary + N' / ' + s.past_history
FROM #seed AS s
JOIN dbo.customer_portal_accounts AS a ON a.username = s.username
JOIN dbo.customers AS c ON c.id = a.customer_id
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.consulting_notes AS existing
    WHERE existing.customer_id = c.id
      AND existing.consulted_at = CONVERT(datetime2(0), '2026-06-09T10:00:00')
);

IF OBJECT_ID(N'tempdb..#pairs') IS NOT NULL DROP TABLE #pairs;
CREATE TABLE #pairs
(
    left_username nvarchar(80) NOT NULL,
    right_username nvarchar(80) NOT NULL,
    meeting_result nvarchar(100) NOT NULL,
    feedback nvarchar(1000) NOT NULL,
    counselor_evaluation nvarchar(1000) NOT NULL
);

INSERT INTO #pairs
    (left_username, right_username, meeting_result, feedback, counselor_evaluation)
VALUES
    (N'kwon.soonhyung', N'hina', N'후속 상담 예정', N'해외 생활 경험과 재무관이 유사하고 대화 성향이 안정적으로 맞는 후보군임', N'권순형-히나 지정 매칭. 선임 상담사 검토 후 만남 일정 조율 권장'),
    (N'kim.taehoon', N'cho.dan', N'일정 조율 중', N'자기관리와 커리어 지향성이 높아 상호 호감 가능성이 큰 후보군임', N'김태훈-쵸단 지정 매칭. 공개 범위와 일정 조율을 우선 확인할 것'),
    (N'song.yeonsu', N'yoon.younga1', N'추천 보류', N'종교와 가족관계 조건은 유사하나 생활권 조율이 필요함', N'추가 상담 후 추천 여부 결정'),
    (N'son.gyeongseok', N'kim.jiwon', N'후속 상담 예정', N'전문직의 신중한 생활 패턴과 창작 직군의 감성적 소통 방식이 상호 보완 가능함', N'업무 일정 차이를 사전에 조율한 뒤 만남 제안'),
    (N'wi.hajoon', N'lee.heeyoon', N'후속 상담 예정', N'자기관리와 안정적인 관계 선호가 유사하고 생활권 조율 가능성이 높음', N'이희윤-위하준 지정 매칭. 주말 일정과 가족 소개 시점 확인'),
    (N'gong.yoo', N'yoon.younga2', N'후속 상담 예정', N'온화한 소통 방식과 안정적인 관계 선호가 유사하며 취미와 생활 리듬의 공통점이 있음', N'공유-윤영아 지정 매칭. 장거리 가족 일정과 가족 공개 시점을 사전 조율'),
    (N'car.thegarden', N'lee.hwimin', N'일정 조율 중', N'감성적 소통 방식과 신중한 관계 성향이 잘 맞고 서로의 일정 특성을 이해할 가능성이 있음', N'이휘민-카더가든 지정 매칭. 공연 일정과 가족 건강 이슈를 사전 조율'),
    (N'jung.woosung', N'cho.yihyun', N'후속 상담 예정', N'대중 노출 직업에 대한 이해도가 높고 사생활 보호 조건이 유사함', N'언론 노출 가능성과 비공개 만남 동선 확인 필요'),
    (N'yoon.taewon', N'kim.nayoung', N'추천 보류', N'생활권은 유사하나 종교와 가족 행사 참여 빈도에 대한 추가 상담이 필요함', N'조건 세부 조율 후 재검토'),
    (N'lee.seungwon', N'oh.haewon', N'후속 상담 예정', N'장기 계획과 가족 일정 조율에 대한 관점이 비교적 유사함', N'주거지와 명절 일정 조율 조건 확인');

INSERT INTO dbo.matching_history
    (customer_id, matched_customer_id, matched_at, meeting_result, feedback, counselor_evaluation)
SELECT left_account.customer_id, right_account.customer_id, CONVERT(date, '2026-06-09'),
       p.meeting_result, p.feedback, p.counselor_evaluation
FROM #pairs AS p
JOIN dbo.customer_portal_accounts AS left_account ON left_account.username = p.left_username
JOIN dbo.customer_portal_accounts AS right_account ON right_account.username = p.right_username
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.matching_history AS existing
    WHERE existing.customer_id = left_account.customer_id
      AND existing.matched_customer_id = right_account.customer_id
      AND existing.matched_at = CONVERT(date, '2026-06-09')
);

INSERT INTO dbo.matching_history
    (customer_id, matched_customer_id, matched_at, meeting_result, feedback, counselor_evaluation)
SELECT right_account.customer_id, left_account.customer_id, CONVERT(date, '2026-06-09'),
       p.meeting_result, p.feedback, p.counselor_evaluation
FROM #pairs AS p
JOIN dbo.customer_portal_accounts AS left_account ON left_account.username = p.left_username
JOIN dbo.customer_portal_accounts AS right_account ON right_account.username = p.right_username
WHERE NOT EXISTS
(
    SELECT 1
    FROM dbo.matching_history AS existing
    WHERE existing.customer_id = right_account.customer_id
      AND existing.matched_customer_id = left_account.customer_id
      AND existing.matched_at = CONVERT(date, '2026-06-09')
);

COMMIT TRAN;

SELECT a.username, a.password_plaintext, c.id AS customer_id, c.name, c.gender, c.customer_grade
FROM dbo.customer_portal_accounts AS a
JOIN dbo.customers AS c ON c.id = a.customer_id
WHERE a.username IN (SELECT username FROM #seed)
ORDER BY c.id;

SELECT c.name AS customer_name, m.name AS matched_customer_name, h.matched_at, h.meeting_result
FROM dbo.matching_history AS h
JOIN dbo.customers AS c ON c.id = h.customer_id
JOIN dbo.customers AS m ON m.id = h.matched_customer_id
JOIN dbo.customer_portal_accounts AS a ON a.customer_id = c.id
WHERE a.username IN (SELECT username FROM #seed)
  AND h.matched_at = CONVERT(date, '2026-06-09')
ORDER BY c.name, m.name;
GO
