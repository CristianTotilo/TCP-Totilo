using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Marca
    {
        public Int64 ID { get; set; }
        public Domicilo domicilio { get; set; }
        public string Nombre { get; set; }
        public bool Estado { get; set; }
    }
}
