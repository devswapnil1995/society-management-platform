using System;
using System.Collections.Generic;
using System.Text;

namespace SocietyManagement.Domain.Entities
{
    public class User : BaseEntity
    {
        public string Email { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public string PasswordHash { get; set; } = string.Empty;
        public string Status { get; set; } = "Active";
    }
}
