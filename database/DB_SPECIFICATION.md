# 연수 CRM DB 명세서

## 1. 개요

| 항목 | 내용 |
| --- | --- |
| DB 이름 | `MarriageCrm` |
| DBMS | Microsoft SQL Server |
| DB 서버 | VM8 Ubuntu + MSSQL, `10.10.30.30:1433` |
| 웹 서버 | VM5 Windows Server 2019 + IIS, `10.10.30.20` |
| 회사명 | 연수 |
| 한자 | 延繡 |
| 설립일 | 2020-02-03 |
| 사고 발생/확인일 | 2022-05-30 |
| 고객 가입 기간 | 2020-02-03부터 2022-05-29까지 |

모든 개인정보는 보안 사고 분석 교육을 위한 가상 데이터입니다.

## 2. 주요 테이블

| 테이블 | 목적 | 최종 데이터 규모 |
| --- | --- | ---: |
| `dbo.company_profile` | 회사 기본 정보, 설립일 | 1 |
| `dbo.security_incidents` | 정보유출 사고 발생/확인 시점 | 1 |
| `dbo.customers` | 고객 기본정보와 민감 프로필 | 2,000 |
| `dbo.consulting_notes` | 상담 이력, 선호 조건, 민감 상담 메모 | 10,000 |
| `dbo.contracts` | 고객별 계약 정보 | 2,000 |
| `dbo.matching_history` | 고객 간 매칭 이력 | 4,018 |
| `dbo.uploaded_files` | CRM 자료 첨부 파일 이력 | 1,311 |
| `dbo.customer_portal_accounts` | 시나리오용 고객 포털 계정 | 19 |
| `dbo.app_users` | 상담사, 선임 상담사, 부장, 관리자 계정 | 환경별 생성 |

## 3. 핵심 컬럼

`dbo.customers`

| 컬럼 | 설명 |
| --- | --- |
| `id` | 고객 번호, 1부터 순차 부여 |
| `name` | 고객명 |
| `gender` | `남성`, `여성`, `비공개` |
| `birth_date` | 생년월일 |
| `phone` | 연락처 |
| `address` | 주소 |
| `occupation` | 직업 |
| `company_name` | 재직 회사 |
| `education` | 최종 학력 |
| `annual_income` | 연봉 |
| `height_cm`, `weight_kg` | 신체 조건 |
| `religion`, `hobbies`, `personality` | 종교, 취미, 성격 |
| `family_relations`, `family_details` | 가족관계와 가족 관련 민감 메모 |
| `asset_summary` | 자산 요약 |
| `marital_history` | 결혼/이혼/재혼 관련 이력 |
| `past_history` | 과거 상담 이력 |
| `customer_grade` | 내부 등급 `S`, `A`, `B` |
| `created_at` | 가입일시, 2020-02-03 ~ 2022-05-29 |

`dbo.consulting_notes`

| 컬럼 | 설명 |
| --- | --- |
| `customer_id` | 고객 번호 |
| `consulted_at` | 상담일시 |
| `counselor_name` | 상담사명 |
| `preference` | 배우자 선호 조건 |
| `counselor_note` | 상담사 업무 메모 |
| `sensitive_details` | 자산, 과거 이력 등 민감 상담 내용 |

`dbo.contracts`

| 컬럼 | 설명 |
| --- | --- |
| `customer_id` | 고객 번호 |
| `contract_date` | 계약일 |
| `end_date` | 계약 종료 예정일 |
| `membership_level` | `STANDARD`, `PREMIUM` |
| `payment_amount` | 결제 금액 |
| `contract_status` | `ACTIVE`, `EXPIRED`, `CANCELLED` |

`dbo.matching_history`

| 컬럼 | 설명 |
| --- | --- |
| `customer_id` | 기준 고객 |
| `matched_customer_id` | 매칭 상대 |
| `matched_at` | 매칭일 |
| `meeting_result` | 만남 완료, 일정 조율 중, 추천 보류, 후속 상담 예정 |
| `feedback` | 매칭 피드백 |
| `counselor_evaluation` | 상담사 평가 |

`dbo.uploaded_files`

| 컬럼 | 설명 |
| --- | --- |
| `uploaded_at` | 업로드 시각, 2022-05-29 이전으로 정렬 |
| `uploaded_by` | 업로드 사용자 |
| `client_ip` | 접속 IP |
| `original_name`, `stored_name` | 원본 파일명과 서버 저장 파일명 |
| `mime_type` | 파일 MIME 타입 |
| `size_bytes` | 파일 크기 |
| `sha256` | 파일 해시 |
| `category` | `CUSTOMER_DOCUMENT`, `CONSULTING_MATERIAL`, `CONTRACT` |

## 4. 요청 고객 정리

`customer-data-reset.sql`에는 요청 고객이 직접 포함되어 있습니다.

| 고객 | 계정 | 비고 |
| --- | --- | --- |
| 권순형 | `kwon.soonhyung` | 히나와 매칭 |
| 히나 | `hina` | 권순형과 매칭 |
| 김태훈 | `kim.taehoon` | 쵸단과 매칭 |
| 쵸단 | `cho.dan` | 김태훈과 매칭 |
| 이희윤 | `lee.heeyoon` | 위하준과 매칭 |
| 위하준 | `wi.hajoon` | 이희윤과 매칭 |
| 이휘민 | `lee.hwimin` | 카더가든과 매칭 |
| 카더가든 | `car.thegarden` | 이휘민과 매칭 |
| 윤영아 | `yoon.younga` | 공유와 매칭, `yoon.younga1/2` 제거 |
| 공유 | `gong.yoo` | 윤영아와 매칭 |

## 5. 적용 파일

최종 DB 구축은 아래 파일 하나만 실행합니다.

```text
database/yeonsu-crm-all-in-one.sql
```

이 파일에는 스키마 생성, 직원 계정 생성, 회사/사고 정보, 고객 2,000명, 상담 10,000건, 계약 2,000건, 매칭 4,018건, 업로드 파일 이력 1,311건, 검증 쿼리가 모두 포함되어 있습니다.

감사 설정 SQL은 서버의 `/var/opt/mssql/audit` 경로 준비가 필요하므로 단일 실행 파일 안에서는 주석 참고 섹션으로만 보존합니다.
