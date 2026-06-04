namespace MarriageCrm.Models;

public sealed record DashboardStats(
    int CustomerCount,
    int ActiveContractCount,
    int ConsultingNoteCount,
    int MatchingHistoryCount,
    int RecentUploadCount);

public sealed record AppUserAuth(
    int Id,
    string Username,
    string DisplayName,
    string Role,
    bool IsActive,
    byte[] PasswordSalt,
    byte[] PasswordHash,
    int PasswordIterations);

public sealed record AppUserSummary(
    int Id,
    string Username,
    string DisplayName,
    string Role,
    string Department,
    bool IsActive,
    DateTime CreatedAt,
    DateTime? LastLoginAt,
    int FailedLoginCount);

public sealed record CustomerSummary(
    int Id,
    string Name,
    string Gender,
    string MaritalHistory,
    DateOnly BirthDate,
    string Phone,
    string Occupation,
    string CompanyName,
    string CustomerGrade,
    string MembershipLevel,
    string ContractStatus);

public sealed record CustomerListFilters(
    string Search,
    string Gender,
    string MaritalHistory,
    string CustomerGrade,
    string ContractStatus);

public sealed record CustomerListPage(
    IReadOnlyList<CustomerSummary> Customers,
    int Page,
    int PageSize,
    int TotalCount)
{
    public int TotalPages => Math.Max(1, (int)Math.Ceiling(TotalCount / (double)PageSize));
    public bool HasPrevious => Page > 1;
    public bool HasNext => Page < TotalPages;
}

public sealed record CustomerProfile(
    int Id,
    string Name,
    string Gender,
    DateOnly BirthDate,
    string Phone,
    string Address,
    string Occupation,
    string CompanyName,
    string Education,
    decimal AnnualIncome,
    decimal HeightCm,
    decimal WeightKg,
    string Religion,
    string Hobbies,
    string Personality,
    string FamilyRelations,
    string FamilyDetails,
    string AssetSummary,
    string MaritalHistory,
    string PastHistory,
    string CustomerGrade,
    DateTime CreatedAt,
    IReadOnlyList<ConsultingNote> Notes,
    IReadOnlyList<Contract> Contracts,
    IReadOnlyList<MatchingHistory> Matches);

public sealed record CustomerFormData(
    string Name,
    string Gender,
    DateOnly BirthDate,
    string Phone,
    string Address,
    string Occupation,
    string CompanyName,
    string Education,
    decimal AnnualIncome,
    decimal HeightCm,
    decimal WeightKg,
    string Religion,
    string Hobbies,
    string Personality,
    string FamilyRelations,
    string FamilyDetails,
    string AssetSummary,
    string MaritalHistory,
    string PastHistory,
    string CustomerGrade)
{
    public static CustomerFormData Empty => new(
        string.Empty,
        "Undisclosed",
        DateOnly.FromDateTime(DateTime.Today.AddYears(-30)),
        string.Empty,
        string.Empty,
        string.Empty,
        string.Empty,
        string.Empty,
        0,
        170,
        65,
        "None",
        string.Empty,
        string.Empty,
        string.Empty,
        string.Empty,
        string.Empty,
        "Single",
        "No notable past history",
        "B");
}

public sealed record ConsultingNote(
    int Id,
    DateTime ConsultedAt,
    string CounselorName,
    string Preference,
    string CounselorNote,
    string SensitiveDetails);

public sealed record Contract(
    int Id,
    DateOnly ContractDate,
    DateOnly? EndDate,
    string MembershipLevel,
    decimal PaymentAmount,
    string ContractStatus);

public sealed record MatchingHistory(
    int Id,
    DateOnly MatchedAt,
    string MatchedCustomerName,
    string MeetingResult,
    string Feedback,
    string CounselorEvaluation);

public sealed record UploadRecord(
    long Id,
    DateTime UploadedAt,
    string UploadedBy,
    string ClientIp,
    string OriginalName,
    string StoredName,
    string MimeType,
    long SizeBytes,
    string Sha256,
    string Category);

public sealed record ExportTable(
    string FileName,
    IReadOnlyList<string> Headers,
    IReadOnlyList<IReadOnlyList<string>> Rows);
