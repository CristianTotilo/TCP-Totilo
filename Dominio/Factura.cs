using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Factura
    {
        public Int64 ID { get; set; }
        public Usuario usuario { get; set; }
        public List<Item> listaItems { get; set; }
        public Domicilo domicilo { get; set; }
        public int CantidadItems { get; set; }


    }
}
