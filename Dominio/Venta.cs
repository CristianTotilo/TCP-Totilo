using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Venta
    {
        public Int64 ID { get; set; }
        public Int64 IDDomicilioVenta { get; set; }
        public Usuario usuario { get; set; }
        public DateTime fecha { get; set; }
        public List<Item> listaItems { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Descuento1 { get; set; }
        public decimal Descuento2 { get; set; }
        public decimal Total { get; set; }
        public Venta()
        {
            List<Item> lista = new List<Item>();
            listaItems = lista;
            Usuario user = new Usuario();
            usuario = user;
        }

    }

}
