using System;
using System.Collections.Generic;
using System.Text;

namespace SocietyManagement.Application.Interfaces
{
    public interface IJwtService
    {
        string GenerateToken(Guid userId, string email);
    }
}
