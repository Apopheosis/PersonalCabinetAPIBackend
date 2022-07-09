using System;
using Microsoft.EntityFrameworkCore;
using PersonalCabinetAPI.DTO;

namespace PersonalCabinetAPI
{
    public class DatabaseContext: DbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options)
            : base(options)
        {
            AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
        }
        public DbSet<Operation> data_all { get; set; }
        public DbSet<Account> accounts { get; set; }
        public DbSet<Airline> airline_company { get; set; }
    }
}