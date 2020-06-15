using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        public int ID { get; set; }
        public Marca marca { get; set; }
        public Estilo esilo { get; set; }
        public string Descripcion { get; set; }
        public float ABV { get; set; }
        public float IBU { get; set; }
        public float Valoracion { get; set; }
        public int Volumen { get; set; }
        public decimal Precio { get; set; }
        public string ImagenUrl { get; set; }
        public bool Estado { get; set; }
    }
}
