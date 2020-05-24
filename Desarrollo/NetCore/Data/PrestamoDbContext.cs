using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using NetCore.Models;

namespace NetCore.Data
{
    public  class PrestamoDbContext : DbContext
    {
        public PrestamoDbContext (DbContextOptions<PrestamoDbContext> options)
            : base(options)
        {
        }

        public DbSet<Cliente> Cliente { get; set; }
    }
}
