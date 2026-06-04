using System.Security.Cryptography;

namespace MarriageCrm.Services;

public static class PasswordHasher
{
    public static bool Verify(string password, byte[] salt, byte[] expectedHash, int iterations)
    {
        if (salt.Length == 0 || expectedHash.Length == 0 || iterations <= 0)
        {
            return false;
        }

        var actualHash = Rfc2898DeriveBytes.Pbkdf2(
            password,
            salt,
            iterations,
            HashAlgorithmName.SHA256,
            expectedHash.Length);

        return CryptographicOperations.FixedTimeEquals(actualHash, expectedHash);
    }
}
