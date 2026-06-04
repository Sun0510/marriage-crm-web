using System.Security.Claims;

namespace MarriageCrm.Services;

public static class AccessPolicy
{
    public const string Counselor = "Counselor";
    public const string SeniorCounselor = "SeniorCounselor";
    public const string Manager = "Manager";
    public const string Admin = "Admin";

    public static bool CanViewUnmaskedSensitiveData(ClaimsPrincipal user) =>
        user.IsInRole(Admin) || user.IsInRole(Manager);

    public static bool CanViewExtendedBusinessData(ClaimsPrincipal user) =>
        CanViewUnmaskedSensitiveData(user) || user.IsInRole(SeniorCounselor);

    public static bool CanViewSeniorSensitiveData(ClaimsPrincipal user) =>
        CanViewUnmaskedSensitiveData(user) || user.IsInRole(SeniorCounselor);

    public static SensitiveDataScope GetSensitiveDataScope(ClaimsPrincipal user)
    {
        if (CanViewUnmaskedSensitiveData(user))
        {
            return SensitiveDataScope.Full;
        }

        if (user.IsInRole(SeniorCounselor))
        {
            return SensitiveDataScope.SeniorCounselor;
        }

        return SensitiveDataScope.Counselor;
    }

    public static string DisplayRole(ClaimsPrincipal user)
    {
        if (user.IsInRole(Admin))
        {
            return "Admin";
        }

        if (user.IsInRole(Manager))
        {
            return "Manager";
        }

        if (user.IsInRole(SeniorCounselor))
        {
            return "Senior Counselor";
        }

        return "Counselor";
    }
}

public enum SensitiveDataScope
{
    Counselor,
    SeniorCounselor,
    Full
}
