using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;
using SocietyManagement.Application.Interfaces;
using SocietyManagement.Infrastructure.Persistence;

namespace SocietyManagement.Api.Controllers
{
    [ApiController]
    [Route("api/auth")]
    public class AuthController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IPasswordHasher _hasher;
        private readonly IJwtService _jwt;

        public AuthController(
            AppDbContext context,
            IPasswordHasher hasher,
            IJwtService jwt)
        {
            _context = context;
            _hasher = hasher;
            _jwt = jwt;
        }

        [HttpPost("login")]
        public IActionResult Login(LoginRequest request)
        {
            var user = _context.Users
                .FirstOrDefault(x => x.Email == request.Email);

            if (user == null || !_hasher.Verify(request.Password, user.PasswordHash))
                return Unauthorized("Invalid credentials");

            var token = _jwt.GenerateToken(user.Id, user.Email);

            return Ok(new { token });
        }
    }
}
