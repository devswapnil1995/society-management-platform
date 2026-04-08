using System;
using System.Collections.Generic;
using System.Text;

namespace SocietyManagement.Domain.Entities
{
    public abstract class BaseEntity
    {
        public Guid Id { get; set; }
        public Guid TenantId { get; set; }  // 🔥 MULTI-TENANT RULE
        public DateTime CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }
    }
}
