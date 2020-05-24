using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NetCore.Models
{
    public partial class Cliente
    {
        public int ClienteID { get; set; }
        public string Nombre { get; set; }
        public byte Edad { get; set; }
    }
}
