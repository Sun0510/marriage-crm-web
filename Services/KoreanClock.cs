namespace MarriageCrm.Services;

public static class KoreanClock
{
    private static readonly TimeZoneInfo SeoulTimeZone = GetSeoulTimeZone();

    public static DateTimeOffset Now => TimeZoneInfo.ConvertTime(DateTimeOffset.UtcNow, SeoulTimeZone);

    public static DateTime NowDateTime => Now.DateTime;

    private static TimeZoneInfo GetSeoulTimeZone()
    {
        try
        {
            return TimeZoneInfo.FindSystemTimeZoneById("Korea Standard Time");
        }
        catch (TimeZoneNotFoundException)
        {
            return TimeZoneInfo.FindSystemTimeZoneById("Asia/Seoul");
        }
        catch (InvalidTimeZoneException)
        {
            return TimeZoneInfo.FindSystemTimeZoneById("Asia/Seoul");
        }
    }
}
