using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Item
    {
        public Int64 ID { get; set; }
        public Articulo Articulo { get; set; }
        public int Cantidad { get; set; }
        public double precio()
        {
            return (double)Articulo.Precio * Cantidad;
        }
    }
}
