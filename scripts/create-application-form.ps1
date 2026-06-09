param(
    [string]$OutputPath = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $projectRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..")).Path
    $outputDir = Join-Path $projectRoot "forms"
    $OutputPath = Join-Path $outputDir "연수_상담신청서_양식.docx"
}
else {
    $outputDir = Split-Path -Parent $OutputPath
}

New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("yeonsu-form-" + [guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $tempRoot "_rels") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $tempRoot "word") | Out-Null

function Write-Utf8NoBom {
    param(
        [string]$Path,
        [string]$Content
    )

    $encoding = [System.Text.UTF8Encoding]::new($false)
    [System.IO.File]::WriteAllText($Path, $Content, $encoding)
}

function Escape-Xml {
    param([string]$Text)
    return [System.Security.SecurityElement]::Escape($Text)
}

function Paragraph {
    param(
        [string]$Text,
        [string]$Style = "normal"
    )

    $escaped = Escape-Xml $Text
    $props = switch ($Style) {
        "title" {
            '<w:pPr><w:jc w:val="center"/><w:spacing w:after="160"/></w:pPr><w:rPr><w:b/><w:sz w:val="36"/><w:color w:val="1A2438"/></w:rPr>'
        }
        "subtitle" {
            '<w:pPr><w:jc w:val="center"/><w:spacing w:after="220"/></w:pPr><w:rPr><w:sz w:val="20"/><w:color w:val="7A5B2F"/></w:rPr>'
        }
        "section" {
            '<w:pPr><w:spacing w:before="260" w:after="120"/></w:pPr><w:rPr><w:b/><w:sz w:val="24"/><w:color w:val="1A2438"/></w:rPr>'
        }
        default {
            '<w:pPr><w:spacing w:after="100"/></w:pPr><w:rPr><w:sz w:val="20"/></w:rPr>'
        }
    }

    return "<w:p>$props<w:r><w:t>$escaped</w:t></w:r></w:p>"
}

function Cell {
    param(
        [string]$Text,
        [string]$Shade = ""
    )

    $escaped = Escape-Xml $Text
    $fill = if ([string]::IsNullOrWhiteSpace($Shade)) { "" } else { '<w:shd w:fill="' + $Shade + '"/>' }
    return @"
<w:tc>
  <w:tcPr>
    <w:tcW w:w="2500" w:type="dxa"/>
    $fill
    <w:tcBorders>
      <w:top w:val="single" w:sz="4" w:color="D7C5AD"/>
      <w:left w:val="single" w:sz="4" w:color="D7C5AD"/>
      <w:bottom w:val="single" w:sz="4" w:color="D7C5AD"/>
      <w:right w:val="single" w:sz="4" w:color="D7C5AD"/>
    </w:tcBorders>
  </w:tcPr>
  <w:p><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>$escaped</w:t></w:r></w:p>
</w:tc>
"@
}

function Row {
    param(
        [string]$Label1,
        [string]$Value1,
        [string]$Label2,
        [string]$Value2
    )

    return "<w:tr>$(Cell $Label1 'F6EFE4')$(Cell $Value1)$(Cell $Label2 'F6EFE4')$(Cell $Value2)</w:tr>"
}

function FullRow {
    param(
        [string]$Label,
        [string]$Value
    )

    $escaped = Escape-Xml $Value
    return @"
<w:tr>
  $(Cell $Label 'F6EFE4')
  <w:tc>
    <w:tcPr>
      <w:gridSpan w:val="3"/>
      <w:tcW w:w="7500" w:type="dxa"/>
      <w:tcBorders>
        <w:top w:val="single" w:sz="4" w:color="D7C5AD"/>
        <w:left w:val="single" w:sz="4" w:color="D7C5AD"/>
        <w:bottom w:val="single" w:sz="4" w:color="D7C5AD"/>
        <w:right w:val="single" w:sz="4" w:color="D7C5AD"/>
      </w:tcBorders>
    </w:tcPr>
    <w:p><w:r><w:rPr><w:sz w:val="19"/></w:rPr><w:t>$escaped</w:t></w:r></w:p>
  </w:tc>
</w:tr>
"@
}

function Table {
    param([string[]]$Rows)

    $content = $Rows -join ""
    return @"
<w:tbl>
  <w:tblPr>
    <w:tblW w:w="10000" w:type="dxa"/>
    <w:tblBorders>
      <w:top w:val="single" w:sz="6" w:color="B99765"/>
      <w:left w:val="single" w:sz="6" w:color="D7C5AD"/>
      <w:bottom w:val="single" w:sz="6" w:color="D7C5AD"/>
      <w:right w:val="single" w:sz="6" w:color="D7C5AD"/>
      <w:insideH w:val="single" w:sz="4" w:color="D7C5AD"/>
      <w:insideV w:val="single" w:sz="4" w:color="D7C5AD"/>
    </w:tblBorders>
  </w:tblPr>
  $content
</w:tbl>
"@
}

$body = ""
$body += Paragraph "연수(延繡) 상담 신청서" "title"
$body += Paragraph "인연을 수놓다 · 고객 작성용" "subtitle"
$body += Paragraph "본 신청서는 상담 예약 및 맞춤 매칭 검토를 위해 고객이 직접 작성하는 문서입니다. 작성된 내용은 상담사가 확인 후 CRM에 등록합니다."

$body += Paragraph "1. 기본 인적사항" "section"
$body += Table @(
    (Row "성명" "" "성별" "□ 남성  □ 여성  □ 비공개"),
    (Row "생년월일" "YYYY-MM-DD" "연락처" ""),
    (Row "이메일" "" "가입 희망일" "YYYY-MM-DD"),
    (FullRow "주소" "")
)

$body += Paragraph "2. 직업 및 학력" "section"
$body += Table @(
    (Row "직업" "" "재직 회사" ""),
    (Row "직무/직책" "" "근속 기간" ""),
    (Row "최종 학력" "" "전공" ""),
    (Row "연봉" "약        만 원" "근무 지역" "")
)

$body += Paragraph "3. 결혼 및 가족 관련 정보" "section"
$body += Table @(
    (Row "결혼 여부" "□ 미혼  □ 이혼  □ 재혼 검토  □ 기타" "자녀 여부" "□ 없음  □ 있음"),
    (FullRow "가족관계" "예: 부모님, 형제자매, 동거 여부 등"),
    (FullRow "가족 관련 참고사항" "예: 부모 부양, 종교 차이, 거주 계획 등 상담에 필요한 내용")
)

$body += Paragraph "4. 개인 성향 및 생활 정보" "section"
$body += Table @(
    (Row "종교" "" "취미" ""),
    (Row "키" "       cm" "몸무게" "       kg"),
    (FullRow "성격 및 가치관" ""),
    (FullRow "건강/생활 관련 참고사항" "상담 및 매칭에 참고할 내용이 있을 경우 작성")
)

$body += Paragraph "5. 자산 및 과거 이력 관련 참고사항" "section"
$body += Table @(
    (FullRow "자산/주거 현황" "예: 자가/전세/월세, 예금, 대출 등 본인이 공개 가능한 범위"),
    (FullRow "과거 결혼·교제 관련 이력" "예: 약혼, 이혼, 장기 교제, 결혼정보회사 이용 경험 등"),
    (FullRow "상담 전 미리 알리고 싶은 민감 사항" "")
)

$body += Paragraph "6. 희망 배우자 조건" "section"
$body += Table @(
    (Row "희망 연령대" "" "희망 거주 지역" ""),
    (Row "희망 직업/직군" "" "희망 학력" ""),
    (Row "종교 조건" "" "결혼 희망 시기" ""),
    (FullRow "중요하게 생각하는 조건" "예: 성격, 가족관, 경제관, 생활권, 자녀 계획 등"),
    (FullRow "피하고 싶은 조건" "")
)

$body += Paragraph "7. 상담 요청사항 및 동의" "section"
$body += Table @(
    (FullRow "상담사에게 요청하고 싶은 내용" ""),
    (FullRow "개인정보 수집·이용 동의" "□ 동의함  □ 동의하지 않음"),
    (FullRow "민감정보 상담 활용 동의" "□ 동의함  □ 동의하지 않음"),
    (Row "작성일" "YYYY-MM-DD" "신청인 서명" "")
)

$body += Paragraph "※ 본 양식은 보안 사고 원인 분석 실습을 위한 가상 결혼정보회사 CRM 시나리오용 문서입니다."

$contentTypes = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>
'@

$rels = @'
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>
'@

$document = @"
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>
    $body
    <w:sectPr>
      <w:pgSz w:w="11906" w:h="16838"/>
      <w:pgMar w:top="900" w:right="900" w:bottom="900" w:left="900" w:header="708" w:footer="708" w:gutter="0"/>
    </w:sectPr>
  </w:body>
</w:document>
"@

try {
    Write-Utf8NoBom (Join-Path $tempRoot "[Content_Types].xml") $contentTypes
    Write-Utf8NoBom (Join-Path $tempRoot "_rels\.rels") $rels
    Write-Utf8NoBom (Join-Path $tempRoot "word\document.xml") $document

    if (Test-Path -LiteralPath $OutputPath) {
        Remove-Item -LiteralPath $OutputPath -Force
    }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::CreateFromDirectory($tempRoot, $OutputPath)
    Get-Item -LiteralPath $OutputPath
}
finally {
    Remove-Item -LiteralPath $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}
