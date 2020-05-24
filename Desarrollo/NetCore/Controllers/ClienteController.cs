using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using NetCore.Data;
using NetCore.Models;

namespace NetCore.Controllers
{
    public class ClienteController : BaseController<Cliente>
    {
        public ClienteController(PrestamoDbContext context) : base(context)
        {
        }
    }
}
