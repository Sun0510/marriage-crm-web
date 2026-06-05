param(
    [int]$CustomerCount = 500,
    [string]$OutputRoot = (Join-Path $PSScriptRoot "..\..\..\generated-customer-db-aligned")
)

$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$outputRoot = [System.IO.Path]::GetFullPath($OutputRoot)
$documentRoot = Join-Path $outputRoot "customer-documents"
$databaseOutput = Join-Path (Join-Path $PSScriptRoot "..\database") "customer-data-reset.sql"
$zipPath = Join-Path $outputRoot "customer-documents-db-aligned.zip"
$manifestPath = Join-Path $outputRoot "customer-document-manifest.csv"

New-Item -ItemType Directory -Force -Path $outputRoot | Out-Null
if (Test-Path $documentRoot) {
    Remove-Item -LiteralPath $documentRoot -Recurse -Force
}
New-Item -ItemType Directory -Force -Path $documentRoot | Out-Null

$lastNames = @("김", "이", "박", "최", "정", "강", "윤", "한", "오", "임", "서", "신")
$givenNames = @("하나", "도윤", "서연", "민재", "수빈", "지호", "채원", "유나", "지수", "현우", "수민", "재원", "은지", "상훈", "미나", "태양", "지원", "서준", "나린", "혜리")
$companies = @("서울핀테크파트너스", "한빛바이오랩", "오리온모빌리티", "유니슨자산운용", "제이스페이스커넥트", "블루오션제약", "메트로건설", "노블인사그룹", "프라임법률사무소", "비전메디컬센터", "스타전자", "인사이트리서치", "하나항공비즈", "마로디자인", "미래회계법인", "어반커머스")
$jobs = @("소프트웨어 엔지니어", "변호사", "회계사", "의사", "약사", "공공기관 사무직", "전략 컨설턴트", "브랜드 매니저", "금융 애널리스트", "건축사", "연구원", "인사 담당자", "데이터 분석가", "세무사", "교사", "스튜디오 대표", "사용자경험 디자이너", "프로덕트 매니저")
$regions = @("서울특별시 강남구", "서울특별시 마포구", "서울특별시 송파구", "경기도 성남시 분당구", "경기도 수원시 영통구", "인천광역시 연수구", "부산광역시 해운대구", "대구광역시 수성구", "대전광역시 유성구", "광주광역시 서구", "세종특별자치시", "경기도 고양시 일산동구")
$religions = @("무교", "기독교", "천주교", "불교", "원불교", "비공개")
$hobbies = @("골프, 사교 모임", "등산, 사진 촬영", "독서, 클래식 공연", "와인 시음, 테니스", "요리, 여행", "필라테스, 미술관 관람", "영화 감상, 전시 관람", "캠핑, 드라이브", "수영, 피트니스", "봉사활동, 음악 감상")
$personalities = @("차분하고 책임감이 강하며 감정 표현이 신중함", "외향적이고 일정 관리가 꼼꼼하며 주도적인 성향", "분석적이고 현실적인 의사결정을 선호함", "가족 중심적이고 배려심이 깊음", "커리어 지향성이 강하고 재무 계획이 명확함", "관계에서 신뢰와 안정감을 중요하게 여김", "갈등 상황에서 조율을 선호하고 유연한 편", "독립적인 성향이 강하고 사생활 경계를 중요하게 여김")
$familyDetails = @("부모님 노후 지원 계획이 있으며 형제와 재산 부담 협의 이력이 있음", "부모님과 가까운 거리에 거주하기를 희망하여 결혼 후 주거지 협의가 필요함", "가족 사업 지분 일부를 보유하고 있어 명절 일정 조율이 민감함", "어머니 건강 문제로 장거리 거주를 부담스러워함", "형제가 해외에 거주하여 부모 부양 책임을 주로 본인이 부담함", "가족 간 종교 차이로 배우자 조건 협의가 필요함", "부모님 이혼 이력으로 안정적인 가족관계를 중요하게 봄", "가족 공개 시점을 천천히 가져가기를 희망함")
$assetSummaries = @("자가 아파트 1채, 예금 1억 2천만 원, 국내 주식 보유", "전세 보증금 2억 5천만 원, 연금계좌 및 상장지수펀드 보유", "오피스텔 1채 임대 수익, 잔여 대출 9천만 원", "부모님 명의 부동산 상속 가능성 상담 기록 있음", "예금 7천만 원, 퇴직연금, 차량 리스 이용", "비상금 계좌 보유, 투자 손실 이력 상담 기록 있음", "자가 없음, 현금성 자산 1억 미만, 신용대출 상환 중", "분양권 보유, 중도금 대출 실행 예정", "가족 공동명의 토지 지분 보유", "개인사업 매출 변동성이 있으며 세무 상담 이력 존재")
$pastHistories = @("단기 약혼 종료 1회 경과, 이혼 이력 없음", "해외 장기 출장 2회 이력으로 일정 조율 필요", "이전 교제 종료 사유에 대한 상담 메모 존재", "건강검진 특이 소견은 없으나 가족력 질문에 민감함", "결혼정보회사 이전 가입 이력 있음, 매칭 불만족 경험", "개인사업 실패 후 신용 회복 여부 확인 필요", "유학 및 해외 거주 이력, 장거리 관계 경험 있음", "동거 상담 이력 있음, 가족 공개 전 충분한 교제 기간 희망")
$meetingResults = @("만남 완료", "일정 조율 중", "추천 보류", "후속 상담 예정")
$counselorNames = @("김하나", "이도윤", "박서연", "최민재", "정수빈", "강지호", "윤채원", "한유나")
$preferenceTemplates = @("직업 안정성과 생활권이 유사한 상대를 선호함", "가족관계가 원만하고 결혼 의사가 명확한 상대를 희망함", "자산 형성 수준과 재무관이 비슷한 상대를 우선 검토함", "종교와 취미가 크게 충돌하지 않는 상대를 원함", "대화 방식이 차분하고 갈등 조율이 가능한 상대를 선호함")
$counselorMemoTemplates = @("상담 신청서와 초기 면담 내용을 바탕으로 우선 조건을 정리함", "직장 위치, 연봉, 가족 상황, 주거 계획을 종합 검토함", "과거 이력 공개 범위와 매칭 전 고지 필요성을 확인함", "선호 조건이 넓어 추가 후보군을 검토하기로 함", "다음 상담에서 가족 소개 시점과 결혼 준비 일정을 확인할 예정임")

function Sql([string]$value) {
    return "N'$($value.Replace("'", "''"))'"
}

function SqlDate([datetime]$value) {
    return "'$($value.ToString("yyyy-MM-dd"))'"
}

function SqlDateTime([datetime]$value) {
    return "'$($value.ToString("yyyy-MM-ddTHH:mm:ss"))'"
}

function SafeFileName([string]$value) {
    foreach ($invalid in [System.IO.Path]::GetInvalidFileNameChars()) {
        $value = $value.Replace($invalid, "_")
    }

    return $value
}

function Money([decimal]$amount) {
    return "{0:N0}원" -f $amount
}

function EscapeXml([string]$value) {
    if ($null -eq $value) {
        return ""
    }

    return [System.Security.SecurityElement]::Escape($value)
}

function Paragraph([string]$value, [bool]$bold = $false, [int]$fontSize = 20, [string]$color = "1F2937") {
    $boldXml = if ($bold) { "<w:b/>" } else { "" }
    return "<w:p><w:r><w:rPr>$boldXml<w:color w:val=""$color""/><w:sz w:val=""$fontSize""/></w:rPr><w:t xml:space=""preserve"">$(EscapeXml $value)</w:t></w:r></w:p>"
}

function Title([string]$value) { Paragraph $value $true 32 "18324B" }
function Section([string]$value) { Paragraph $value $true 24 "27659A" }
function Meta([string]$value) { Paragraph $value $false 18 "526071" }
function Row([string]$label, [string]$value) { Paragraph "$label`: $value" $false 20 "1F2937" }
function Mask([string]$reason) { return "마스킹됨 - $reason" }

function TableCell([string]$value, [int]$width, [bool]$bold = $false, [string]$shade = "FFFFFF") {
    $boldXml = if ($bold) { "<w:b/>" } else { "" }
    return "<w:tc><w:tcPr><w:tcW w:w=""$width"" w:type=""dxa""/><w:shd w:fill=""$shade""/><w:tcMar><w:top w:w=""80"" w:type=""dxa""/><w:left w:w=""120"" w:type=""dxa""/><w:bottom w:w=""80"" w:type=""dxa""/><w:right w:w=""120"" w:type=""dxa""/></w:tcMar></w:tcPr><w:p><w:r><w:rPr>$boldXml<w:sz w:val=""18""/></w:rPr><w:t xml:space=""preserve"">$(EscapeXml $value)</w:t></w:r></w:p></w:tc>"
}

function TableRow([string]$label, [string]$value) {
    return "<w:tr>$(TableCell $label 2600 $true 'EAF2F8')$(TableCell $value 6500 $false 'FFFFFF')</w:tr>"
}

function InfoTable([array]$rows) {
    $rowXml = [string]::Join([Environment]::NewLine, ($rows | ForEach-Object { TableRow $_[0] $_[1] }))
    return "<w:tbl><w:tblPr><w:tblW w:w=""9100"" w:type=""dxa""/><w:tblBorders><w:top w:val=""single"" w:sz=""6"" w:color=""CBD5E1""/><w:left w:val=""single"" w:sz=""6"" w:color=""CBD5E1""/><w:bottom w:val=""single"" w:sz=""6"" w:color=""CBD5E1""/><w:right w:val=""single"" w:sz=""6"" w:color=""CBD5E1""/><w:insideH w:val=""single"" w:sz=""6"" w:color=""CBD5E1""/><w:insideV w:val=""single"" w:sz=""6"" w:color=""CBD5E1""/></w:tblBorders></w:tblPr>$rowXml</w:tbl>"
}

function StatusBox([string]$value) {
    return "<w:tbl><w:tblPr><w:tblW w:w=""9100"" w:type=""dxa""/><w:tblBorders><w:top w:val=""single"" w:sz=""8"" w:color=""94A3B8""/><w:left w:val=""single"" w:sz=""8"" w:color=""94A3B8""/><w:bottom w:val=""single"" w:sz=""8"" w:color=""94A3B8""/><w:right w:val=""single"" w:sz=""8"" w:color=""94A3B8""/></w:tblBorders></w:tblPr><w:tr>$(TableCell $value 9100 $false 'F8FAFC')</w:tr></w:tbl>"
}

function WriteZipEntry($archive, [string]$name, [string]$content) {
    $entry = $archive.CreateEntry($name, [System.IO.Compression.CompressionLevel]::Fastest)
    $writer = [System.IO.StreamWriter]::new($entry.Open(), [System.Text.UTF8Encoding]::new($false))
    try {
        $writer.Write($content)
    }
    finally {
        $writer.Dispose()
    }
}

function NewDocx([string]$path, [string[]]$rows) {
    if (Test-Path $path) {
        Remove-Item -LiteralPath $path -Force
    }

    $archive = [System.IO.Compression.ZipFile]::Open($path, [System.IO.Compression.ZipArchiveMode]::Create)
    try {
        WriteZipEntry $archive "[Content_Types].xml" "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Types xmlns=""http://schemas.openxmlformats.org/package/2006/content-types""><Default Extension=""rels"" ContentType=""application/vnd.openxmlformats-package.relationships+xml""/><Default Extension=""xml"" ContentType=""application/xml""/><Override PartName=""/word/document.xml"" ContentType=""application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml""/></Types>"
        WriteZipEntry $archive "_rels/.rels" "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><Relationships xmlns=""http://schemas.openxmlformats.org/package/2006/relationships""><Relationship Id=""rId1"" Type=""http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument"" Target=""word/document.xml""/></Relationships>"
        $documentXml = "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?><w:document xmlns:w=""http://schemas.openxmlformats.org/wordprocessingml/2006/main""><w:body>$([string]::Join([Environment]::NewLine, $rows))<w:sectPr><w:pgSz w:w=""11906"" w:h=""16838""/><w:pgMar w:top=""1134"" w:right=""1134"" w:bottom=""1134"" w:left=""1134""/></w:sectPr></w:body></w:document>"
        WriteZipEntry $archive "word/document.xml" $documentXml
    }
    finally {
        $archive.Dispose()
    }
}

function NewCustomer([int]$id) {
    $grade = if (($id % 10) -in 0, 1) { "S" } elseif (($id % 10) -in 2, 3, 4, 5) { "A" } else { "B" }
    $income = if ($grade -eq "S") { 95000000 + (($id % 90) * 1000000) } elseif ($grade -eq "A") { 65000000 + (($id % 45) * 1000000) } else { 38000000 + (($id % 35) * 1000000) }
    $payment = if ($grade -eq "S") { 7800000 } elseif ($grade -eq "A") { 4800000 } else { 2600000 }
    $customer = [ordered]@{
        Id = $id
        Name = "$($lastNames[$id % $lastNames.Count])$($givenNames[$id % $givenNames.Count])"
        Gender = if ($id % 2 -eq 0) { "남성" } else { "여성" }
        BirthDate = Get-Date -Year (1981 + ($id % 15)) -Month (1 + ($id % 12)) -Day (1 + ($id % 27))
        Phone = "010-{0:D4}-{1:D4}" -f (2000 + $id), (5000 + $id)
        Address = "$($regions[$id % $regions.Count]) $(($id % 80) + 1)길 $(($id % 120) + 1)"
        Occupation = $jobs[$id % $jobs.Count]
        Company = $companies[$id % $companies.Count]
        Education = @("대학 졸업", "대학원 졸업", "박사 과정 수료", "해외 대학 졸업", "전문대 졸업")[$id % 5]
        AnnualIncome = [decimal]$income
        HeightCm = [decimal](155 + ($id % 36) + $(if ($id % 2 -eq 0) { 0.3 } else { 0.8 }))
        WeightKg = [decimal](47 + ($id % 44) + $(if ($id % 3 -eq 0) { 0.2 } else { 0.7 }))
        Religion = $religions[$id % $religions.Count]
        Hobbies = $hobbies[$id % $hobbies.Count]
        Personality = $personalities[$id % $personalities.Count]
        FamilyRelations = @("부모님, 여동생 1명", "어머니, 언니 1명", "부모님, 오빠 1명", "부모님, 누나 1명", "아버지, 여동생 1명", "어머니와 단둘이 거주", "부모님, 외동", "부모님, 남동생 1명")[$id % 8]
        FamilyDetails = $familyDetails[$id % $familyDetails.Count]
        AssetSummary = $assetSummaries[$id % $assetSummaries.Count]
        MaritalHistory = @("미혼", "미혼, 단기 약혼 이력 있음", "이혼 이력 상담 필요", "재혼 검토", "미혼, 결혼 준비 경험 있음")[$id % 5]
        PastHistory = $pastHistories[$id % $pastHistories.Count]
        CustomerGrade = $grade
        CreatedAt = (Get-Date "2026-06-04T00:00:00").AddDays(-($id % 240))
        Counselor = $counselorNames[$id % $counselorNames.Count]
        Preference = if ($grade -eq "S") { "자산, 학력, 가족 배경이 유사한 프리미엄 후보를 우선 선호함" } elseif ($grade -eq "A") { "직업 안정성과 생활권이 맞는 후보를 우선 선호함" } else { "기본 선호 조건과 성격 조화를 중심으로 추천 희망" }
        CounselorNote = "회사, 연봉, 가족 상황, 거주 계획, 매칭 위험 요소를 종합 검토함"
        ContractDate = (Get-Date "2026-06-04").AddDays(-($id % 180))
        ContractEndDate = (Get-Date "2027-06-04").AddDays(-($id % 60))
        MembershipLevel = if ($grade -in @("S", "A")) { "프리미엄" } else { "스탠다드" }
        PaymentAmount = [decimal]$payment
        ContractStatus = if ($id % 17 -eq 0) { "만료" } else { "유효" }
        MatchedCustomerId = if ($id -lt $CustomerCount) { $id + 1 } else { 1 }
        MatchedAt = (Get-Date "2026-06-04").AddDays(-($id % 90))
        MeetingResult = $meetingResults[$id % $meetingResults.Count]
        Feedback = "생활권은 유사하나 가족 조건과 통근 거리에 대한 추가 확인이 필요함"
        CounselorEvaluation = if ($grade -eq "S") { "다음 프리미엄 매칭 전 선임 상담사 검토 권장" } else { "표준 후속 상담 절차에 따라 진행 가능" }
    }
    $customer.SensitiveDetails = "민감 상담 내용: $($customer.AssetSummary) / $($customer.PastHistory)"
    return [pscustomobject]$customer
}

function NewConsultingNotes($customer) {
    $noteCount = (($customer.Id - 1) % 3) + 1
    $notes = [System.Collections.Generic.List[object]]::new()

    for ($index = 0; $index -lt $noteCount; $index++) {
        $counselorIndex = ($customer.Id + $index) % $counselorNames.Count
        $consultedAt = $customer.CreatedAt.AddDays(3 + ($index * 9)).AddHours(10 + $index)
        $notes.Add([pscustomobject]@{
            ConsultedAt = $consultedAt
            CounselorName = $counselorNames[$counselorIndex]
            Preference = $preferenceTemplates[($customer.Id + $index) % $preferenceTemplates.Count]
            CounselorNote = $counselorMemoTemplates[($customer.Id + $index) % $counselorMemoTemplates.Count]
            SensitiveDetails = "민감 상담 내용: $($customer.AssetSummary) / $($customer.PastHistory)"
        })
    }

    return $notes
}

function CustomerFileName($customer, [int]$permissionNumber) {
    return SafeFileName ("{0}_{1:D6}_{2}.docx" -f $customer.Name, $customer.Id, $permissionNumber)
}

function NewDocumentRows($customer, [int]$permissionNumber) {
    $canSenior = $permissionNumber -ge 2
    $canFull = $permissionNumber -eq 3
    $address = if ($permissionNumber -eq 1) { ($customer.Address -split " ")[0..1] -join " " } else { $customer.Address }
    $income = if ($permissionNumber -eq 1) {
        $bandStart = [Math]::Floor($customer.AnnualIncome / 10000000) * 10000000
        "연봉 구간: $(Money $bandStart) - $(Money ($bandStart + 9999999))"
    } else {
        Money $customer.AnnualIncome
    }
    $notes = NewConsultingNotes $customer
    $counselorSummary = [string]::Join(", ", ($notes | Select-Object -ExpandProperty CounselorName -Unique))
    $noteLines = [System.Collections.Generic.List[string]]::new()
    foreach ($note in $notes) {
        $noteLines.Add("$($note.ConsultedAt.ToString("yyyy-MM-dd HH:mm")) / $($note.CounselorName) / 선호 조건: $($note.Preference) / 상담 메모: $($note.CounselorNote)")
        if ($canSenior) {
            $noteLines.Add("민감 상담 내용: $($note.SensitiveDetails)")
        }
        else {
            $noteLines.Add("민감 상담 내용: $(Mask "선임 상담사 이상 권한 필요")")
        }
    }
    $noteSummary = [string]::Join([Environment]::NewLine, $noteLines)

    $permissionLabel = switch ($permissionNumber) {
        1 { "일반 상담사 열람본" }
        2 { "선임 상담사 열람본" }
        default { "부장/관리자 전체 열람본" }
    }

    return @(
        (Title "연수(延續) CRM 고객 업무 파일"),
        (StatusBox "문서상태: 직원 업로드 원본 기준 / 열람권한: $permissionLabel / 고객번호: $("{0:D6}" -f $customer.Id)"),
        (Meta "본 문서는 상담 신청서, 상담 기록, 계약 정보, 매칭 이력을 취합한 내부 업무용 문서입니다."),
        (Meta "파일명: $(CustomerFileName $customer $permissionNumber)"),
        (Meta "파일명 규칙: 고객이름_고객번호_상담사권한번호.docx"),
        (Section "문서 관리 정보"),
        (InfoTable @(
            @("문서 구분", "고객 상담 종합 기록"),
            @("작성 부서", "고객상담팀"),
            @("참여 상담사", $counselorSummary),
            @("작성 기준일", $customer.CreatedAt.AddDays(3).ToString("yyyy-MM-dd HH:mm")),
            @("접근 권한", $permissionLabel)
        )),
        (Section "1. 고객 기본 정보"),
        (InfoTable @(
            @("고객번호", ("{0:D6}" -f $customer.Id)),
            @("고객명", $customer.Name),
            @("성별", $customer.Gender),
            @("가입일시", $customer.CreatedAt.ToString("yyyy-MM-dd HH:mm")),
            @("생년월일", $customer.BirthDate.ToString("yyyy-MM-dd")),
            @("연락처", $customer.Phone),
            @("주소", $address)
        )),
        (Section "2. 직업 및 내부 등급"),
        (InfoTable @(
            @("직업", $customer.Occupation),
            @("재직 회사", $customer.Company),
            @("최종 학력", $customer.Education),
            @("연봉", $income),
            @("고객 등급", $customer.CustomerGrade)
        )),
        (Section "3. 상담 프로필"),
        (InfoTable @(
            @("신체 조건", ("{0:0.0}cm / {1:0.0}kg" -f $customer.HeightCm, $customer.WeightKg)),
            @("종교", $customer.Religion),
            @("취미", $customer.Hobbies),
            @("성격", $customer.Personality),
            @("가족 관계", $customer.FamilyRelations),
            @("가족 상세", $(if ($canSenior) { $customer.FamilyDetails } else { Mask "선임 상담사 이상 권한 필요" })),
            @("자산 정보", $(if ($canFull) { $customer.AssetSummary } else { Mask "부장 또는 관리자 권한 필요" })),
            @("결혼 이력", $customer.MaritalHistory),
            @("과거 이력", $(if ($canFull) { $customer.PastHistory } else { Mask "부장 또는 관리자 권한 필요" }))
        )),
        (Section "4. 상담 기록"),
        (InfoTable @(
            @("상담 이력 수", "$($notes.Count)건"),
            @("참여 상담사", $counselorSummary),
            @("상담 상세", $noteSummary)
        )),
        (Section "5. 계약 정보"),
        (InfoTable @(
            @("계약일", $customer.ContractDate.ToString("yyyy-MM-dd")),
            @("종료일", $customer.ContractEndDate.ToString("yyyy-MM-dd")),
            @("회원 등급", $customer.MembershipLevel),
            @("결제 금액", $(if ($canFull) { Money $customer.PaymentAmount } else { Mask "부장 또는 관리자 권한 필요" })),
            @("계약 상태", $customer.ContractStatus)
        )),
        (Section "6. 매칭 이력"),
        (InfoTable @(
            @("매칭일", $customer.MatchedAt.ToString("yyyy-MM-dd")),
            @("상대 고객번호", ("{0:D6}" -f $customer.MatchedCustomerId)),
            @("만남 결과", $customer.MeetingResult),
            @("피드백", $(if ($canSenior) { $customer.Feedback } else { Mask "선임 상담사 이상 권한 필요" })),
            @("상담사 평가", $(if ($canSenior) { $customer.CounselorEvaluation } else { Mask "선임 상담사 이상 권한 필요" }))
        )),
        (Meta "※ 본 문서는 보안 사고 원인 분석 실습을 위한 가상 고객 데이터이며, 실제 개인정보가 아닙니다.")
    )
}

$customers = for ($id = 1; $id -le $CustomerCount; $id++) { NewCustomer $id }

$sqlLines = [System.Collections.Generic.List[string]]::new()
$sqlLines.Add("/*")
$sqlLines.Add("  Reset fictional CRM customer data and reassign customer IDs from 1.")
$sqlLines.Add("  Generated by scripts/generate-customer-data-package.ps1.")
$sqlLines.Add("*/")
$sqlLines.Add("USE MarriageCrm;")
$sqlLines.Add("GO")
$sqlLines.Add("SET XACT_ABORT ON;")
$sqlLines.Add("BEGIN TRANSACTION;")
$sqlLines.Add("DELETE FROM dbo.matching_history;")
$sqlLines.Add("DELETE FROM dbo.contracts;")
$sqlLines.Add("DELETE FROM dbo.consulting_notes;")
$sqlLines.Add("DELETE FROM dbo.customers;")
$sqlLines.Add("IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_customers_gender')")
$sqlLines.Add("    ALTER TABLE dbo.customers DROP CONSTRAINT CK_customers_gender;")
$sqlLines.Add("ALTER TABLE dbo.customers WITH CHECK ADD CONSTRAINT CK_customers_gender CHECK (gender IN (N'남성', N'여성', N'비공개'));")
$sqlLines.Add("IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_contracts_membership_level')")
$sqlLines.Add("    ALTER TABLE dbo.contracts DROP CONSTRAINT CK_contracts_membership_level;")
$sqlLines.Add("IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = N'CK_contracts_contract_status')")
$sqlLines.Add("    ALTER TABLE dbo.contracts DROP CONSTRAINT CK_contracts_contract_status;")
$sqlLines.Add("ALTER TABLE dbo.contracts WITH CHECK ADD CONSTRAINT CK_contracts_membership_level CHECK (membership_level IN (N'스탠다드', N'프리미엄'));")
$sqlLines.Add("ALTER TABLE dbo.contracts WITH CHECK ADD CONSTRAINT CK_contracts_contract_status CHECK (contract_status IN (N'유효', N'만료', N'해지'));")
$sqlLines.Add("DBCC CHECKIDENT (N'dbo.customers', RESEED, 0) WITH NO_INFOMSGS;")
$sqlLines.Add("DBCC CHECKIDENT (N'dbo.consulting_notes', RESEED, 0) WITH NO_INFOMSGS;")
$sqlLines.Add("DBCC CHECKIDENT (N'dbo.contracts', RESEED, 0) WITH NO_INFOMSGS;")
$sqlLines.Add("DBCC CHECKIDENT (N'dbo.matching_history', RESEED, 0) WITH NO_INFOMSGS;")
$sqlLines.Add("SET IDENTITY_INSERT dbo.customers ON;")

foreach ($customer in $customers) {
    $sqlLines.Add(("INSERT INTO dbo.customers (id, name, gender, birth_date, phone, address, occupation, company_name, education, annual_income, height_cm, weight_kg, religion, hobbies, personality, family_relations, family_details, asset_summary, marital_history, past_history, customer_grade, created_at) VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}, {8}, {9}, {10:0.0}, {11:0.0}, {12}, {13}, {14}, {15}, {16}, {17}, {18}, {19}, {20}, {21});" -f
        $customer.Id, (Sql $customer.Name), (Sql $customer.Gender), (SqlDate $customer.BirthDate), (Sql $customer.Phone), (Sql $customer.Address), (Sql $customer.Occupation), (Sql $customer.Company), (Sql $customer.Education), $customer.AnnualIncome, $customer.HeightCm, $customer.WeightKg, (Sql $customer.Religion), (Sql $customer.Hobbies), (Sql $customer.Personality), (Sql $customer.FamilyRelations), (Sql $customer.FamilyDetails), (Sql $customer.AssetSummary), (Sql $customer.MaritalHistory), (Sql $customer.PastHistory), (Sql $customer.CustomerGrade), (SqlDateTime $customer.CreatedAt)))
}

$sqlLines.Add("SET IDENTITY_INSERT dbo.customers OFF;")
$sqlLines.Add("SET IDENTITY_INSERT dbo.consulting_notes ON;")

$noteId = 1
foreach ($customer in $customers) {
    foreach ($note in (NewConsultingNotes $customer)) {
        $sqlLines.Add(("INSERT INTO dbo.consulting_notes (id, customer_id, consulted_at, counselor_name, preference, counselor_note, sensitive_details) VALUES ({0}, {1}, {2}, {3}, {4}, {5}, {6});" -f
            $noteId, $customer.Id, (SqlDateTime $note.ConsultedAt), (Sql $note.CounselorName), (Sql $note.Preference), (Sql $note.CounselorNote), (Sql $note.SensitiveDetails)))
        $noteId++
    }
}

$sqlLines.Add("SET IDENTITY_INSERT dbo.consulting_notes OFF;")
$sqlLines.Add("SET IDENTITY_INSERT dbo.contracts ON;")

foreach ($customer in $customers) {
    $sqlLines.Add(("INSERT INTO dbo.contracts (id, customer_id, contract_date, end_date, membership_level, payment_amount, contract_status) VALUES ({0}, {0}, {1}, {2}, {3}, {4}, {5});" -f
        $customer.Id, (SqlDate $customer.ContractDate), (SqlDate $customer.ContractEndDate), (Sql $customer.MembershipLevel), $customer.PaymentAmount, (Sql $customer.ContractStatus)))
}

$sqlLines.Add("SET IDENTITY_INSERT dbo.contracts OFF;")
$sqlLines.Add("SET IDENTITY_INSERT dbo.matching_history ON;")

foreach ($customer in $customers) {
    $sqlLines.Add(("INSERT INTO dbo.matching_history (id, customer_id, matched_customer_id, matched_at, meeting_result, feedback, counselor_evaluation) VALUES ({0}, {0}, {1}, {2}, {3}, {4}, {5});" -f
        $customer.Id, $customer.MatchedCustomerId, (SqlDate $customer.MatchedAt), (Sql $customer.MeetingResult), (Sql $customer.Feedback), (Sql $customer.CounselorEvaluation)))
}

$sqlLines.Add("SET IDENTITY_INSERT dbo.matching_history OFF;")
$sqlLines.Add("COMMIT TRANSACTION;")
$sqlLines.Add("GO")
$sqlLines.Add("SELECT MIN(id) AS min_customer_id, MAX(id) AS max_customer_id, COUNT(*) AS customer_count FROM dbo.customers;")
$sqlLines.Add("SELECT TOP (10) id, name, customer_grade FROM dbo.customers ORDER BY id;")

[System.IO.File]::WriteAllLines($databaseOutput, $sqlLines, [System.Text.UTF8Encoding]::new($false))

$manifestRows = [System.Collections.Generic.List[object]]::new()
foreach ($customer in $customers) {
    $customerDirectory = Join-Path $documentRoot ("{0:D6}" -f $customer.Id)
    New-Item -ItemType Directory -Force -Path $customerDirectory | Out-Null

    foreach ($permissionNumber in 1, 2, 3) {
        $fileName = CustomerFileName $customer $permissionNumber
        $path = Join-Path $customerDirectory $fileName
        NewDocx $path (NewDocumentRows $customer $permissionNumber)
        $manifestRows.Add([pscustomobject]@{
            CustomerId = "{0:D6}" -f $customer.Id
            CustomerName = $customer.Name
            PermissionNumber = $permissionNumber
            FileName = $fileName
            RelativePath = ("{0:D6}\{1}" -f $customer.Id, $fileName)
        })
    }
}

$manifestRows | Export-Csv -NoTypeInformation -Encoding UTF8 -Path $manifestPath

if (Test-Path $zipPath) {
    Remove-Item -LiteralPath $zipPath -Force
}

$archive = [System.IO.Compression.ZipFile]::Open($zipPath, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    $root = (Get-Item $documentRoot).FullName.TrimEnd("\")
    foreach ($file in Get-ChildItem -Recurse -File $root) {
        $relativePath = $file.FullName.Substring($root.Length + 1).Replace("\", "/")
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($archive, $file.FullName, $relativePath, [System.IO.Compression.CompressionLevel]::Fastest) | Out-Null
    }
}
finally {
    $archive.Dispose()
}

$zipCheck = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
try {
    $entryCount = $zipCheck.Entries.Count
}
finally {
    $zipCheck.Dispose()
}

Write-Host "Generated SQL: $databaseOutput"
Write-Host "Generated documents: $documentRoot"
Write-Host "Generated ZIP: $zipPath"
Write-Host "Manifest: $manifestPath"
Write-Host "Customers: $CustomerCount"
Write-Host "Word files: $entryCount"
