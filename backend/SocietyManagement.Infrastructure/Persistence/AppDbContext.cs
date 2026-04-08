using Microsoft.EntityFrameworkCore;
using SocietyManagement.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace SocietyManagement.Infrastructure.Persistence
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Tenant> Tenants => Set<Tenant>();

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.HasDefaultSchema("sm");

            modelBuilder.Entity<Tenant>(entity =>
            {
                entity.HasKey(x => x.Id);
                entity.Property(x => x.Name).IsRequired().HasMaxLength(200);
            });
        }
    }
}
