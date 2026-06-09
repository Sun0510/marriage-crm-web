using System.Globalization;
using System.Net;
using System.Security.Claims;
using MarriageCrm.Models;
using MarriageCrm.Services;

namespace MarriageCrm;

public static class WebUi
{
    private const string CompanyName = "연수";
    private const string CompanyHanja = "延繡";
    private const string CompanyTagline = "인연을 수놓다";

    public static string E(string? value) => WebUtility.HtmlEncode(value ?? string.Empty);

    public static string LoginPage(string antiforgeryField, string? error)
    {
        var alert = string.IsNullOrWhiteSpace(error)
            ? string.Empty
            : $"<div class=\"alert error\">{E(error)}</div>";

        return $$"""
            <!doctype html>
            <html lang="ko">
            <head>
              <meta charset="utf-8">
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <title>연수 CRM 로그인</title>
              <link rel="stylesheet" href="/css/site.css">
            </head>
            <body class="login-body">
              <main class="login-shell">
                <section class="login-intro">
                  <div class="intro-brand"><span>延</span><div><b>연수 <small>(延繡)</small></b><small>인연을 수놓다</small></div></div>
                  <div>
                    <p class="intro-kicker">YEONSU MATCHMAKING CRM</p>
                    <h1>정성과 신뢰로 이어지는<br>상담 업무를 관리합니다.</h1>
                    <p>연수 CRM은 고객 프로필, 상담 이력, 계약, 매칭 자료를 안전하게 관리하는 사내 전용 업무 시스템입니다.</p>
                  </div>
                  <p class="intro-foot">연수 상담운영본부 | Internal Business System</p>
                </section>
                <section class="login-card">
                  <p class="system-label">연수 임직원 전용</p>
                  <h1>로그인</h1>
                  <p class="muted">상담 업무 계정 정보를 입력해 주세요.</p>
                  {{alert}}
                  <form method="post" action="/login" class="stack-form">
                    {{antiforgeryField}}
                    <label>아이디<input name="username" autocomplete="username" required></label>
                    <label>비밀번호<input name="password" type="password" autocomplete="current-password" required></label>
                    <button class="primary" type="submit">로그인</button>
                  </form>
                  <div class="login-help">
                    <b>보안 안내</b>
                    <span>연수 임직원만 이용할 수 있습니다.</span>
                    <span>접속 및 고객정보 조회 이력은 감사 로그에 기록됩니다.</span>
                  </div>
                </section>
              </main>
            </body>
            </html>
            """;
    }

    public static string DashboardPage(HttpContext context, string antiforgeryField, DashboardStats stats)
    {
        var cards = new[]
        {
            StatCard("등록 고객", stats.CustomerCount, "명"),
            StatCard("활성 계약", stats.ActiveContractCount, "건"),
            StatCard("상담 기록", stats.ConsultingNoteCount, "건"),
            StatCard("매칭 이력", stats.MatchingHistoryCount, "건"),
            StatCard("최근 7일 첨부", stats.RecentUploadCount, "건")
        };

        var content = $$"""
            <div class="page-heading">
              <div><p class="page-path">연수 / 업무 현황</p><h1>업무 현황</h1><p class="page-description">연수 CRM의 주요 상담, 계약, 매칭 현황입니다.</p></div>
              <span class="date-chip">{{DateTime.Now:yyyy.MM.dd}}</span>
            </div>
            <section class="brand-hero">
              <div>
                <p class="hero-kicker">YEONSU MATCHMAKING</p>
                <h2>연수 <small>(延繡)</small></h2>
                <p>인연을 수놓다</p>
                <span>정확한 성향 분석과 상담 이력으로 소중한 인연을 이어갑니다.</span>
              </div>
            </section>
            <section class="stat-grid">{{string.Join("", cards)}}</section>
            <section class="panel-grid">
              <article class="panel">
                <div class="panel-title"><h2>자주 사용하는 메뉴</h2><span>상담 업무 바로가기</span></div>
                <div class="task-list">
                  <a class="task-link" href="/customers"><b>고객 조회</b><span>고객 프로필과 상담 이력을 확인합니다.</span><em>열기</em></a>
                  <a class="task-link" href="/attachments"><b>자료 첨부</b><span>상담자료와 계약서를 등록합니다.</span><em>열기</em></a>
                  <a class="task-link" href="/reports"><b>자료 추출</b><span>업무 목적의 고객 문서와 CSV 보고서를 생성합니다.</span><em>열기</em></a>
                </div>
              </article>
              <article class="panel notice">
                <div class="panel-title"><h2>개인정보 취급 안내</h2><span>필독</span></div>
                <p>고객정보 조회와 자료 추출 이력은 감사 목적으로 기록됩니다.</p>
                <p>상담사는 업무용 정보만 열람하며, 자산·과거이력·결제금액 등 고위험 정보는 부장 이상 권한이 필요합니다.</p>
              </article>
            </section>
            """;
        return Layout(context, antiforgeryField, "업무 현황", "dashboard", content);
    }

    public static string CustomersPage(
        HttpContext context,
        string antiforgeryField,
        CustomerListPage customerPage,
        CustomerListFilters filters)
    {
        var rows = customerPage.Customers.Count == 0
            ? "<tr><td colspan=\"11\" class=\"empty\">조회 결과가 없습니다.</td></tr>"
            : string.Join("", customerPage.Customers.Select(customer => $$"""
                <tr>
                  <td>{{customer.Id}}</td>
                  <td><a class="text-link" href="/customers/{{customer.Id}}">{{E(customer.Name)}}</a></td>
                  <td>{{E(customer.Gender)}}</td>
                  <td>{{E(customer.MaritalHistory)}}</td>
                  <td>{{customer.BirthDate:yyyy-MM-dd}}</td>
                  <td>{{E(DisplayPhone(context, customer.Phone))}}</td>
                  <td>{{E(customer.Occupation)}}</td>
                  <td>{{E(DisplayCompany(context, customer.CompanyName))}}</td>
                  <td><span class="grade-badge grade-{{E(GradeClass(DisplayGrade(context, customer.CustomerGrade)))}}">{{E(DisplayGrade(context, customer.CustomerGrade))}}</span></td>
                  <td>{{E(customer.MembershipLevel)}}</td>
                  <td><span class="badge">{{E(customer.ContractStatus)}}</span></td>
                </tr>
                """));

        var content = $$"""
            <div class="page-heading">
              <div><p class="page-path">고객 관리 / 고객 조회</p><h1>고객 조회</h1><p class="page-description">고객명, 연락처, 직업, 회사명, 등급으로 고객을 조회합니다.</p></div>
              <div class="heading-actions"><a class="button primary" href="/customers/new">신규 고객 등록</a></div>
            </div>
            <section class="panel">
              <form method="get" action="/customers" class="search-bar filter-bar">
                <label>통합 검색<input name="search" value="{{E(filters.Search)}}" placeholder="이름, 회사, 연락처, 직업 검색"></label>
                <label>성별
                  <select name="gender">
                    {{Option("", "전체", filters.Gender)}}
                    {{Option("남성", "남성", filters.Gender)}}
                    {{Option("여성", "여성", filters.Gender)}}
                    {{Option("비공개", "비공개", filters.Gender)}}
                  </select>
                </label>
                <label>결혼 여부
                  <select name="maritalHistory">
                    {{Option("", "전체", filters.MaritalHistory)}}
                    {{Option("미혼", "미혼", filters.MaritalHistory)}}
                    {{Option("재혼", "재혼 검색", filters.MaritalHistory)}}
                    {{Option("이혼", "이혼 이력", filters.MaritalHistory)}}
                  </select>
                </label>
                <label>내부 등급
                  <select name="customerGrade">
                    {{Option("", "전체", filters.CustomerGrade)}}
                    {{Option("S", "S", filters.CustomerGrade)}}
                    {{Option("A", "A", filters.CustomerGrade)}}
                    {{Option("B", "B", filters.CustomerGrade)}}
                  </select>
                </label>
                <label>계약 상태
                  <select name="contractStatus">
                    {{Option("", "전체", filters.ContractStatus)}}
                    {{Option("유효", "유효", filters.ContractStatus)}}
                    {{Option("만료", "만료", filters.ContractStatus)}}
                    {{Option("해지", "해지", filters.ContractStatus)}}
                  </select>
                </label>
                <button class="primary" type="submit">필터 적용</button>
                <a class="button ghost" href="/customers">초기화</a>
              </form>
              <p class="table-caption">총 {{customerPage.TotalCount:N0}}명 중 {{customerPage.Page}} / {{customerPage.TotalPages}} 페이지입니다. 한 페이지에 {{customerPage.PageSize}}명씩 표시합니다.</p>
              <div class="table-wrap">
                <table>
                  <thead><tr><th>ID</th><th>고객명</th><th>성별</th><th>결혼 여부</th><th>생년월일</th><th>연락처</th><th>직업</th><th>회사</th><th>내부 등급</th><th>회원 등급</th><th>계약 상태</th></tr></thead>
                  <tbody>{{rows}}</tbody>
                </table>
              </div>
              {{Pagination("/customers", filters, customerPage)}}
            </section>
            """;
        return Layout(context, antiforgeryField, "고객 관리", "customers", content);
    }

    public static string CustomerPage(HttpContext context, string antiforgeryField, CustomerProfile customer)
    {
        var notes = customer.Notes.Count == 0
            ? "<p class=\"empty-box\">상담 기록이 없습니다.</p>"
            : string.Join("", customer.Notes.Select(note => $$"""
                <article class="timeline-item">
                  <div><b>{{note.ConsultedAt:yyyy-MM-dd HH:mm}}</b><span>{{E(note.CounselorName)}}</span></div>
                  <p><strong>선호 조건</strong> {{E(note.Preference)}}</p>
                  <p><strong>상담 메모</strong> {{E(note.CounselorNote)}}</p>
                  <p><strong>민감 상담 내용</strong> {{E(DisplaySeniorSensitive(context, note.SensitiveDetails))}}</p>
                </article>
                """));

        var contracts = TableOrEmpty(
            customer.Contracts.Select(contract => $$"""
                <tr><td>{{contract.ContractDate:yyyy-MM-dd}}</td><td>{{contract.EndDate?.ToString("yyyy-MM-dd") ?? "-"}}</td><td>{{E(contract.MembershipLevel)}}</td><td>{{DisplayPayment(context, contract.PaymentAmount)}}</td><td><span class="badge">{{E(contract.ContractStatus)}}</span></td></tr>
                """),
            "계약 정보가 없습니다.",
            5);

        var matches = TableOrEmpty(
            customer.Matches.Select(match => $$"""
                <tr><td>{{match.MatchedAt:yyyy-MM-dd}}</td><td>{{E(match.MatchedCustomerName)}}</td><td>{{E(match.MeetingResult)}}</td><td>{{E(DisplaySeniorSensitive(context, match.Feedback))}}</td><td>{{E(DisplaySeniorSensitive(context, match.CounselorEvaluation))}}</td></tr>
                """),
            "매칭 이력이 없습니다.",
            5);

        var content = $$"""
            <div class="page-heading">
              <div><p class="page-path">고객 관리 / 고객 조회 / 상세정보</p><h1>{{E(customer.Name)}} <small>고객번호 {{customer.Id}}</small></h1><p class="page-description">고객 기본정보와 상담 진행 이력입니다.</p></div>
              <div class="heading-actions">
                <a class="button primary" href="/customers/{{customer.Id}}/export">Word 문서 내려받기</a>
                <a class="button ghost" href="/customers/{{customer.Id}}/edit">정보 수정</a>
                <a class="button ghost" href="/customers">목록으로</a>
              </div>
            </div>
            <section class="profile-grid panel">
              {{Info("성별", customer.Gender)}}
              {{Info("생년월일", customer.BirthDate.ToString("yyyy-MM-dd"))}}
              {{Info("가입일", customer.CreatedAt.ToLocalTime().ToString("yyyy-MM-dd HH:mm"))}}
              {{Info("연락처", DisplayPhone(context, customer.Phone))}}
              {{Info("주소", DisplayAddress(context, customer.Address))}}
              {{Info("직업", customer.Occupation)}}
              {{Info("재직 회사", DisplayCompany(context, customer.CompanyName))}}
              {{Info("최종 학력", customer.Education)}}
              {{Info("연 소득", DisplayMoney(context, customer.AnnualIncome))}}
              {{Info("내부 고객등급", DisplayGrade(context, customer.CustomerGrade))}}
              {{Info("신체조건", DisplayBody(context, customer.HeightCm, customer.WeightKg))}}
              {{Info("종교", customer.Religion)}}
              {{Info("취미", customer.Hobbies)}}
              {{Info("성격", customer.Personality)}}
              {{Info("가족관계", customer.FamilyRelations)}}
              {{Info("가족 상세", DisplaySeniorSensitive(context, customer.FamilyDetails))}}
              {{Info("자산 정보", DisplaySensitive(context, customer.AssetSummary))}}
              {{Info("결혼 이력", customer.MaritalHistory)}}
              {{Info("과거 이력", DisplaySensitive(context, customer.PastHistory))}}
            </section>
            <section class="panel">
              <div class="panel-title"><h2>상담 기록</h2><span>{{customer.Notes.Count}}건</span></div>
              <div class="timeline">{{notes}}</div>
            </section>
            <section class="panel">
              <div class="panel-title"><h2>계약 정보</h2><span>{{customer.Contracts.Count}}건</span></div>
              <div class="table-wrap"><table><thead><tr><th>계약일</th><th>종료일</th><th>회원 등급</th><th>결제 금액</th><th>상태</th></tr></thead><tbody>{{contracts}}</tbody></table></div>
            </section>
            <section class="panel">
              <div class="panel-title"><h2>매칭 이력</h2><span>{{customer.Matches.Count}}건</span></div>
              <div class="table-wrap"><table><thead><tr><th>일자</th><th>매칭 고객</th><th>만남 결과</th><th>피드백</th><th>상담사 평가</th></tr></thead><tbody>{{matches}}</tbody></table></div>
            </section>
            """;
        return Layout(context, antiforgeryField, "고객 상세", "customers", content);
    }

    public static string CustomerFormPage(
        HttpContext context,
        string antiforgeryField,
        string title,
        string action,
        CustomerFormData customer,
        string? error,
        int? sourceCustomerId)
    {
        var alert = string.IsNullOrWhiteSpace(error)
            ? string.Empty
            : $"<div class=\"alert error\">{E(error)}</div>";
        var cancelUrl = sourceCustomerId is null ? "/customers" : $"/customers/{sourceCustomerId}";
        var submitLabel = sourceCustomerId is null ? "고객 등록" : "수정 저장";

        var content = $$"""
            <div class="page-heading">
              <div><p class="page-path">고객 관리 / {{E(title)}}</p><h1>{{E(title)}}</h1><p class="page-description">상담사가 고객에게 받은 Word 상담 신청서를 기준으로 고객 정보를 입력합니다.</p></div>
              <div class="heading-actions"><a class="button ghost" href="{{cancelUrl}}">취소</a></div>
            </div>
            {{alert}}
            <section class="panel">
              <div class="panel-title"><h2>상담 신청서 입력</h2><span>DB 반영 항목</span></div>
              <p class="section-description">고객이 제출한 Word 신청서를 보면서 아래 항목을 입력합니다. 신청서 원본 파일은 자료 첨부 메뉴에서 고객 제출 문서로 따로 등록할 수 있습니다.</p>
              <form method="post" action="{{E(action)}}" class="customer-form">
                {{antiforgeryField}}
                <div class="form-section">
                  <h2>기본 정보</h2>
                  {{Input("name", "고객명", customer.Name, required: true)}}
                  {{Select("gender", "성별", customer.Gender, new[] { "남성", "여성", "비공개" })}}
                  {{Input("birthDate", "생년월일", customer.BirthDate.ToString("yyyy-MM-dd"), type: "date", required: true)}}
                  {{Input("phone", "연락처", customer.Phone, required: true)}}
                  {{Input("address", "주소", customer.Address, required: true, wide: true)}}
                </div>
                <div class="form-section">
                  <h2>직업 및 등급</h2>
                  {{Input("occupation", "직업", customer.Occupation, required: true)}}
                  {{Input("companyName", "재직 회사", customer.CompanyName, required: true)}}
                  {{Input("education", "최종 학력", customer.Education, required: true)}}
                  {{Input("annualIncome", "연 소득", customer.AnnualIncome.ToString("0", CultureInfo.InvariantCulture), type: "number")}}
                  {{Select("customerGrade", "내부 고객등급", customer.CustomerGrade, new[] { "S", "A", "B" })}}
                </div>
                <div class="form-section">
                  <h2>상담 프로필</h2>
                  {{Input("heightCm", "키(cm)", customer.HeightCm.ToString("0.#", CultureInfo.InvariantCulture), type: "number")}}
                  {{Input("weightKg", "몸무게(kg)", customer.WeightKg.ToString("0.#", CultureInfo.InvariantCulture), type: "number")}}
                  {{Input("religion", "종교", customer.Religion)}}
                  {{Input("hobbies", "취미", customer.Hobbies, wide: true)}}
                  {{Input("personality", "성격", customer.Personality, wide: true)}}
                  {{Input("familyRelations", "가족관계", customer.FamilyRelations, required: true, wide: true)}}
                  {{TextArea("familyDetails", "가족 상세", customer.FamilyDetails)}}
                  {{Input("maritalHistory", "결혼 이력", customer.MaritalHistory, wide: true)}}
                  {{TextArea("assetSummary", "자산 정보", customer.AssetSummary)}}
                  {{TextArea("pastHistory", "과거 이력", customer.PastHistory)}}
                </div>
                <div class="form-actions">
                  <button class="primary" type="submit">{{submitLabel}}</button>
                  <a class="button ghost" href="{{cancelUrl}}">취소</a>
                </div>
              </form>
            </section>
            """;

        return Layout(context, antiforgeryField, title, "customers", content);
    }

    public static string UploadsPage(HttpContext context, string antiforgeryField, IReadOnlyList<UploadRecord> uploads, string? status)
    {
        var alert = status switch
        {
            "uploaded" => "<div class=\"alert success\">자료가 등록되었습니다.</div>",
            "invalid-size" => "<div class=\"alert error\">파일 크기는 1바이트 이상 10MB 이하이어야 합니다.</div>",
            "invalid-type" => "<div class=\"alert error\">허용되지 않은 자료 분류입니다.</div>",
            _ => string.Empty
        };
        var rows = uploads.Count == 0
            ? "<tr><td colspan=\"8\" class=\"empty\">등록된 첨부 파일이 없습니다.</td></tr>"
            : string.Join("", uploads.Select(upload => $$"""
                <tr>
                  <td>{{upload.UploadedAt.ToLocalTime():yyyy-MM-dd HH:mm}}</td>
                  <td>{{E(upload.UploadedBy)}}</td>
                  <td>{{E(upload.Category)}}</td>
                  <td>{{E(upload.OriginalName)}}</td>
                  <td>{{upload.SizeBytes:N0}}</td>
                  <td class="hash">{{E(upload.Sha256)}}</td>
                  <td>{{E(upload.ClientIp)}}</td>
                  <td><a class="button download compact" href="/attachments/{{upload.Id}}/download">다운로드</a></td>
                </tr>
                """));

        var content = $$"""
            <div class="page-heading"><div><p class="page-path">업무 지원 / 자료 첨부</p><h1>자료 첨부</h1><p class="page-description">상담과 계약 업무에 필요한 문서를 CRM 웹 서버의 첨부파일 저장소에 등록합니다.</p></div></div>
            {{alert}}
            <section class="panel">
              <div class="panel-title"><h2>업무 자료 등록</h2><span>최대 10MB</span></div>
              <form method="post" action="/attachments" enctype="multipart/form-data" class="upload-form">
                {{antiforgeryField}}
                <label>자료 분류
                  <select name="category" required>
                    <option value="CUSTOMER_DOCUMENT">고객 제출 문서</option>
                    <option value="CONSULTING_MATERIAL">상담 자료</option>
                    <option value="CONTRACT">계약서</option>
                  </select>
                </label>
                <label>첨부 파일<input type="file" name="attachment" required></label>
                <button class="primary" type="submit">등록</button>
              </form>
              <p class="hint">저장 위치는 `Storage:UploadPath` 설정을 따릅니다. 운영 기본값은 IIS 사이트 루트 아래 `uploads` 폴더입니다.</p>
            </section>
            <section class="panel">
              <div class="panel-title"><h2>전체 업로드 파일</h2><span>{{uploads.Count:N0}}건</span></div>
              <div class="table-wrap"><table><thead><tr><th>등록 시각</th><th>등록자</th><th>분류</th><th>원본 파일명</th><th>크기</th><th>SHA-256</th><th>접속 IP</th><th>다운로드</th></tr></thead><tbody>{{rows}}</tbody></table></div>
            </section>
            """;
        return Layout(context, antiforgeryField, "자료 첨부", "uploads", content);
    }

    public static string AdminPage(
        HttpContext context,
        string antiforgeryField,
        DashboardStats stats,
        IReadOnlyList<UploadRecord> uploads,
        IReadOnlyList<AppUserSummary> accounts,
        string auditLogPath)
    {
        var cards = new[]
        {
            StatCard("등록 고객", stats.CustomerCount, "명"),
            StatCard("활성 계약", stats.ActiveContractCount, "건"),
            StatCard("상담 기록", stats.ConsultingNoteCount, "건"),
            StatCard("최근 첨부", stats.RecentUploadCount, "건")
        };

        var accountRows = accounts.Count == 0
            ? "<tr><td colspan=\"7\" class=\"empty\">설정된 계정이 없습니다.</td></tr>"
            : string.Join("", accounts.Select(account => $$"""
                <tr>
                  <td>{{E(account.Username)}}</td>
                  <td>{{E(account.DisplayName)}}</td>
                  <td><span class="badge">{{E(account.Role)}}</span></td>
                  <td>{{E(account.Department)}}</td>
                  <td>{{(account.IsActive ? "활성" : "비활성")}}</td>
                  <td>{{(account.LastLoginAt is null ? "-" : account.LastLoginAt.Value.ToLocalTime().ToString("yyyy-MM-dd HH:mm"))}}</td>
                  <td>{{account.FailedLoginCount:N0}}</td>
                </tr>
                """));

        var uploadRows = uploads.Count == 0
            ? "<tr><td colspan=\"5\" class=\"empty\">최근 업로드가 없습니다.</td></tr>"
            : string.Join("", uploads.Select(upload => $$"""
                <tr>
                  <td>{{upload.UploadedAt.ToLocalTime():yyyy-MM-dd HH:mm}}</td>
                  <td>{{E(upload.UploadedBy)}}</td>
                  <td>{{E(upload.Category)}}</td>
                  <td>{{E(upload.OriginalName)}}</td>
                  <td>{{E(upload.ClientIp)}}</td>
                </tr>
                """));

        var content = $$"""
            <div class="page-heading">
              <div><p class="page-path">관리 / 운영 콘솔</p><h1>관리자 콘솔</h1><p class="page-description">CRM 운영 현황과 주요 업무를 확인합니다.</p></div>
              <span class="date-chip">{{DateTime.Now:yyyy.MM.dd HH:mm}}</span>
            </div>
            <section class="stat-grid admin-stat-grid">{{string.Join("", cards)}}</section>
            <section class="panel-grid">
              <article class="panel">
                <div class="panel-title"><h2>관리 업무 바로가기</h2><span>운영 메뉴</span></div>
                <div class="task-list">
                  <a class="task-link" href="/customers"><b>고객 데이터 조회</b><span>필터 기준으로 고객을 확인합니다.</span><em>열기</em></a>
                  <a class="task-link" href="/reports"><b>자료 추출 관리</b><span>고객 문서와 CSV 추출 화면으로 이동합니다.</span><em>열기</em></a>
                  <a class="task-link" href="/attachments"><b>첨부 자료 확인</b><span>문서 업로드 이력을 확인합니다.</span><em>열기</em></a>
                </div>
              </article>
              <article class="panel notice">
                <div class="panel-title"><h2>감사 로그 위치</h2><span>Wazuh 수집 대상</span></div>
                <p><b>CRM 감사 로그</b></p>
                <p class="mono-line">{{E(string.IsNullOrWhiteSpace(auditLogPath) ? "설정되지 않음" : auditLogPath)}}</p>
                <p>로그인, 업로드, 자료 추출 이벤트가 JSONL 형식으로 기록됩니다.</p>
              </article>
            </section>
            <section class="panel">
              <div class="panel-title"><h2>계정 현황</h2><span>{{accounts.Count}}개 계정</span></div>
              <div class="table-wrap"><table><thead><tr><th>아이디</th><th>표시 이름</th><th>역할</th><th>부서</th><th>상태</th><th>최근 로그인</th><th>실패 횟수</th></tr></thead><tbody>{{accountRows}}</tbody></table></div>
            </section>
            <section class="panel">
              <div class="panel-title"><h2>최근 업로드</h2><span>최근 10건</span></div>
              <div class="table-wrap"><table><thead><tr><th>등록 시각</th><th>등록자</th><th>분류</th><th>파일명</th><th>접속 IP</th></tr></thead><tbody>{{uploadRows}}</tbody></table></div>
            </section>
            """;
        return Layout(context, antiforgeryField, "관리자 콘솔", "admin", content);
    }

    public static string ReportsPage(HttpContext context, string antiforgeryField, IReadOnlyList<CustomerSummary> customers, string customerName)
    {
        var hasSearch = !string.IsNullOrWhiteSpace(customerName);
        var searchSummary = hasSearch
            ? $"<p class=\"search-summary\"><b>{E(customerName)}</b> 검색 결과 <strong>{customers.Count}</strong>건</p>"
            : "<p class=\"search-summary\">고객명을 입력하면 해당 고객의 업무용 문서를 내려받을 수 있습니다.</p>";
        var searchDownload = hasSearch && customers.Count > 0
            ? $"<a class=\"button primary\" href=\"/reports/export-search?customerName={WebUtility.UrlEncode(customerName)}\">검색 결과 Word ZIP 내려받기</a>"
            : string.Empty;
        var customerRows = customers.Count == 0
            ? hasSearch
                ? "<tr><td colspan=\"11\" class=\"empty\">일치하는 고객이 없습니다.</td></tr>"
                : "<tr><td colspan=\"11\" class=\"empty\">고객명을 검색해 주세요.</td></tr>"
            : string.Join("", customers.Select(customer => $$"""
                <tr>
                  <td>{{customer.Id}}</td>
                  <td><a class="text-link" href="/customers/{{customer.Id}}">{{E(customer.Name)}}</a></td>
                  <td>{{E(customer.Gender)}}</td>
                  <td>{{E(customer.MaritalHistory)}}</td>
                  <td>{{customer.BirthDate:yyyy-MM-dd}}</td>
                  <td>{{E(DisplayPhone(context, customer.Phone))}}</td>
                  <td>{{E(customer.Occupation)}}</td>
                  <td>{{E(DisplayCompany(context, customer.CompanyName))}}</td>
                  <td><span class="grade-badge grade-{{E(GradeClass(DisplayGrade(context, customer.CustomerGrade)))}}">{{E(DisplayGrade(context, customer.CustomerGrade))}}</span></td>
                  <td><span class="badge">{{E(customer.ContractStatus)}}</span></td>
                  <td class="align-right"><a class="button download" href="/customers/{{customer.Id}}/export">Word 내려받기</a></td>
                </tr>
                """));

        var content = $$"""
            <div class="page-heading"><div><p class="page-path">업무 지원 / 자료 추출</p><h1>자료 추출</h1><p class="page-description">역할 권한에 맞는 범위로 고객 문서와 CSV 보고서를 내려받습니다.</p></div></div>
            <section class="panel customer-export">
              <div class="panel-title"><h2>고객별 문서 추출</h2><span>고객 단위 Word 문서</span></div>
              <form method="get" action="/reports" class="search-bar report-search">
                <label>고객명<input name="customerName" value="{{E(customerName)}}" placeholder="예: 김하늘" autocomplete="off"></label>
                <button class="primary" type="submit">고객 검색</button>
                <a class="button ghost" href="/reports">초기화</a>
              </form>
              {{searchSummary}}
              <div class="report-actions">{{searchDownload}}</div>
              <div class="table-wrap">
                <table>
                  <thead><tr><th>고객번호</th><th>고객명</th><th>성별</th><th>결혼 여부</th><th>생년월일</th><th>연락처</th><th>직업</th><th>회사</th><th>내부 등급</th><th>계약 상태</th><th></th></tr></thead>
                  <tbody>{{customerRows}}</tbody>
                </table>
              </div>
            </section>
            <section class="panel">
              <div class="panel-title"><h2>항목별 자료 추출</h2><span>CSV 형식</span></div>
              <div class="export-list">
                <div class="export-row"><div><b>고객 정보</b><span>역할 권한에 맞는 고객 프로필 데이터</span></div><a class="button ghost" href="/reports/export/customers">CSV 내려받기</a></div>
                <div class="export-row"><div><b>상담 기록</b><span>상담 일시, 선호 조건, 상담 메모</span></div><a class="button ghost" href="/reports/export/consulting-notes">CSV 내려받기</a></div>
                <div class="export-row"><div><b>계약 정보</b><span>계약일, 회원 등급, 결제 금액, 계약 상태</span></div><a class="button ghost" href="/reports/export/contracts">CSV 내려받기</a></div>
                <div class="export-row"><div><b>매칭 이력</b><span>매칭 대상, 만남 결과, 피드백, 상담사 평가</span></div><a class="button ghost" href="/reports/export/matching-history">CSV 내려받기</a></div>
              </div>
            </section>
            """;
        return Layout(context, antiforgeryField, "자료 추출", "reports", content);
    }

    public static string ErrorPage()
    {
        return """
            <!doctype html><html lang="ko"><head><meta charset="utf-8"><title>오류</title><link rel="stylesheet" href="/css/site.css"></head>
            <body class="login-body"><main class="login-shell"><section class="login-card"><div class="brand-mark">!</div><h1>요청을 처리하지 못했습니다.</h1><p class="muted">잠시 후 다시 시도하거나 관리자에게 문의하세요.</p><a class="button primary" href="/">처음으로</a></section></main></body></html>
            """;
    }

    private static string Layout(HttpContext context, string antiforgeryField, string title, string active, string content)
    {
        var username = context.User.Identity?.Name ?? "unknown";
        var displayName = context.User.FindFirstValue("display_name") ?? username;
        var role = AccessPolicy.DisplayRole(context.User);
        var adminNav = context.User.IsInRole(AccessPolicy.Admin)
            ? Nav("/admin", "관리자 콘솔", active == "admin")
            : string.Empty;
        var initial = string.IsNullOrWhiteSpace(username) ? "?" : username[..1].ToUpperInvariant();

        return $$"""
            <!doctype html>
            <html lang="ko">
            <head>
              <meta charset="utf-8">
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <title>{{E(title)}} | {{CompanyName}} CRM</title>
              <link rel="stylesheet" href="/css/site.css">
            </head>
            <body>
              <header class="topbar">
                <div class="topbar-left">
                  <a class="brand" href="/dashboard"><span>延</span><div><b>{{CompanyName}} <small>({{CompanyHanja}})</small></b><small>{{CompanyTagline}}</small></div></a>
                  <span class="division">상담운영본부</span>
                </div>
                <div class="user-area">
                  <span class="network-label">연수 사내망</span>
                  <span class="user-profile"><i>{{E(initial)}}</i><span><b>{{E(displayName)}} {{E(role)}}</b><small>{{E(username)}}</small></span></span>
                  <form method="post" action="/logout">{{antiforgeryField}}<button type="submit">로그아웃</button></form>
                </div>
              </header>
              <div class="app-shell">
                <aside class="sidebar">
                  <div class="side-user"><span>延</span><div><b>연수 CRM</b><small>Customer Relations</small></div></div>
                  <p class="menu-label">MAIN MENU</p>
                  {{Nav("/dashboard", "대시보드", active == "dashboard")}}
                  {{Nav("/customers", "고객 관리", active == "customers")}}
                  {{adminNav}}
                  <p class="menu-label">BUSINESS SUPPORT</p>
                  {{Nav("/attachments", "자료 첨부", active == "uploads")}}
                  {{Nav("/reports", "자료 추출", active == "reports")}}
                  <div class="side-note"><b>연수 개인정보 취급 시스템</b><span>조회 및 자료 추출 이력을 기록합니다.</span></div>
                </aside>
                <main class="content">{{content}}</main>
              </div>
            </body>
            </html>
            """;
    }

    private static string Nav(string href, string label, bool active) =>
        $"<a class=\"nav-link{(active ? " active" : string.Empty)}\" href=\"{href}\">{E(label)}</a>";

    private static string Pagination(string path, CustomerListFilters filters, CustomerListPage page)
    {
        if (page.TotalPages <= 1)
        {
            return string.Empty;
        }

        string Url(int pageNumber) => $"{path}?{CustomerQuery(filters, pageNumber)}";
        var previous = page.HasPrevious
            ? $"<a class=\"button ghost\" href=\"{Url(page.Page - 1)}\">이전</a>"
            : "<span class=\"button disabled\">이전</span>";
        var next = page.HasNext
            ? $"<a class=\"button ghost\" href=\"{Url(page.Page + 1)}\">다음</a>"
            : "<span class=\"button disabled\">다음</span>";

        var start = Math.Max(1, page.Page - 2);
        var end = Math.Min(page.TotalPages, page.Page + 2);
        var numbers = Enumerable.Range(start, end - start + 1)
            .Select(number => number == page.Page
                ? $"<span class=\"page-number active\">{number}</span>"
                : $"<a class=\"page-number\" href=\"{Url(number)}\">{number}</a>");

        return $"""
            <nav class="pagination" aria-label="고객 목록 페이지 이동">
              {previous}
              <span class="page-numbers">{string.Join("", numbers)}</span>
              {next}
            </nav>
            """;
    }

    private static string CustomerQuery(CustomerListFilters filters, int page)
    {
        var query = new List<string>();
        AddQuery(query, "search", filters.Search);
        AddQuery(query, "gender", filters.Gender);
        AddQuery(query, "maritalHistory", filters.MaritalHistory);
        AddQuery(query, "customerGrade", filters.CustomerGrade);
        AddQuery(query, "contractStatus", filters.ContractStatus);
        AddQuery(query, "page", page.ToString(CultureInfo.InvariantCulture));
        return string.Join("&", query);
    }

    private static void AddQuery(List<string> query, string key, string value)
    {
        if (!string.IsNullOrWhiteSpace(value))
        {
            query.Add($"{WebUtility.UrlEncode(key)}={WebUtility.UrlEncode(value)}");
        }
    }

    private static string Option(string value, string label, string selectedValue)
    {
        var selected = string.Equals(value, selectedValue, StringComparison.OrdinalIgnoreCase) ? " selected" : string.Empty;
        return $"<option value=\"{E(value)}\"{selected}>{E(label)}</option>";
    }

    private static string StatCard(string label, int value, string unit) =>
        $"<article class=\"stat-card\"><span>{E(label)}</span><strong>{value:N0}<small>{E(unit)}</small></strong></article>";

    private static string Info(string label, string value) =>
        $"<div class=\"profile-item\"><span>{E(label)}</span><b>{E(value)}</b></div>";

    private static string Input(
        string name,
        string label,
        string value,
        string type = "text",
        bool required = false,
        bool wide = false)
    {
        var requiredAttribute = required ? " required" : string.Empty;
        var wideClass = wide ? " wide" : string.Empty;
        return $"<label class=\"form-field{wideClass}\">{E(label)}<input type=\"{E(type)}\" name=\"{E(name)}\" value=\"{E(value)}\"{requiredAttribute}></label>";
    }

    private static string Select(string name, string label, string value, IReadOnlyList<string> options)
    {
        var optionHtml = string.Join("", options.Select(option => Option(option, option, value)));
        return $"<label class=\"form-field\">{E(label)}<select name=\"{E(name)}\">{optionHtml}</select></label>";
    }

    private static string TextArea(string name, string label, string value) =>
        $"<label class=\"form-field wide\">{E(label)}<textarea name=\"{E(name)}\" rows=\"4\">{E(value)}</textarea></label>";

    private static string DisplayPhone(HttpContext context, string value) => value;

    private static string DisplayCompany(HttpContext context, string value) => value;

    private static string DisplayGrade(HttpContext context, string value) => value;

    private static string DisplaySensitive(HttpContext context, string value) =>
        AccessPolicy.CanViewUnmaskedSensitiveData(context.User) ? value : "부장 이상 권한 필요";

    private static string DisplaySeniorSensitive(HttpContext context, string value) =>
        AccessPolicy.CanViewSeniorSensitiveData(context.User) ? value : "선임 이상 권한 필요";

    private static string DisplayMoney(HttpContext context, decimal amount) =>
        AccessPolicy.CanViewSeniorSensitiveData(context.User) ? Money(amount) : IncomeBand(amount);

    private static string DisplayPayment(HttpContext context, decimal amount) =>
        AccessPolicy.CanViewUnmaskedSensitiveData(context.User) ? Money(amount) : "부장 이상 권한 필요";

    private static string DisplayBody(HttpContext context, decimal heightCm, decimal weightKg) =>
        $"{heightCm:0.#}cm / {weightKg:0.#}kg";

    private static string DisplayAddress(HttpContext context, string value) =>
        AccessPolicy.CanViewSeniorSensitiveData(context.User) ? value : AddressRegion(value);

    private static string IncomeBand(decimal amount)
    {
        var band = Math.Floor(amount / 10000000m) * 1000;
        return $"{band:N0}만원대";
    }

    private static string AddressRegion(string value)
    {
        var parts = value.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        return parts.Length >= 2 ? $"{parts[0]} {parts[1]}" : value;
    }

    private static string GradeClass(string value) =>
        value.Equals("S", StringComparison.OrdinalIgnoreCase) ||
        value.Equals("A", StringComparison.OrdinalIgnoreCase) ||
        value.Equals("B", StringComparison.OrdinalIgnoreCase)
            ? value.ToLowerInvariant()
            : "limited";

    private static string Money(decimal amount) =>
        amount.ToString("#,##0", CultureInfo.InvariantCulture) + "원";

    private static string TableOrEmpty(IEnumerable<string> rows, string emptyMessage, int columns)
    {
        var rowList = rows.ToList();
        return rowList.Count == 0
            ? $"<tr><td colspan=\"{columns}\" class=\"empty\">{E(emptyMessage)}</td></tr>"
            : string.Join("", rowList);
    }
}
