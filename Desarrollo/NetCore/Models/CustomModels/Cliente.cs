using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace NetCore.Models
{
    [ModelMetadataType(typeof(Cliente_))]
    public partial class Cliente
    {
        // Buddy class
        sealed class Cliente_
        {
            [Display(Name = "Nombre del cliente")]
            public string Nombre { get; set; }

            [Range(18, 120, ErrorMessage = "Edad fuera de rango 18..120")]
            public int Edad { get; set; }
        }
    }
}


