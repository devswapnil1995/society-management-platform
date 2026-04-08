using System;
using System.Collections.Generic;
using System.Text;

namespace SocietyManagement.Domain.Entities
{  
    public class Tenant : BaseEntity
    {
        public string Name { get; set; } = string.Empty;
        public string City { get; set; } = string.Empty;
        public string Country { get; set; } = string.Empty;
        public string Status { get; set; } = "Active";
    }
}
