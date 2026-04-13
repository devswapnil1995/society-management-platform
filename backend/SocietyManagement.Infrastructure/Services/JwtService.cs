using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SocietyManagement.Application.Interfaces;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Security.Cryptography;

namespace SocietyManagement.Infrastructure.Services
{
    public class JwtService : IJwtService
    {
        private readonly IConfiguration _config;

        public JwtService(IConfiguration config)
        {
            _config = config;
        }

        public string GenerateToken(Guid userId, string email)
        {
            var claims = new[]
            {
            new Claim(ClaimTypes.NameIdentifier, userId.ToString()),
            new Claim(ClaimTypes.Email, email)
        };

            var key = new SymmetricSecurityKey(
                // Ensure the signing key is at least 256 bits for HS256.
                // If the configured key is shorter, derive a 256-bit key by hashing it with SHA-256.
                GetSigningKeyBytes(_config["Jwt:Key"]!)
            );

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _config["Jwt:Issuer"],
                audience: _config["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddDays(7),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private static byte[] GetSigningKeyBytes(string secret)
        {
            if (string.IsNullOrEmpty(secret))
                throw new InvalidOperationException("JWT signing key is not configured (Jwt:Key).");

            var keyBytes = Encoding.UTF8.GetBytes(secret);

            // HS256 requires a key size of at least 256 bits (32 bytes).
            if (keyBytes.Length >= 32)
                return keyBytes;

            using var sha = SHA256.Create();
            return sha.ComputeHash(keyBytes);
        }
    }
}
