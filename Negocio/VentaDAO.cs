using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
   public class VentaDAO
    {
        public void agregar(Venta venta)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_agregar_venta");
                datos.ClearParameters();
                datos.agregarParametro("@IDUsuario", venta.usuario.ID);
                datos.agregarParametro("@IDDomicilioVenta", 10);
                datos.agregarParametro("@Fecha", venta.fecha);
                datos.agregarParametro("@Descuento1", venta.Descuento1);
                datos.agregarParametro("@Descuento2", venta.Descuento2);
                datos.agregarParametro("@SubTotal", venta.Subtotal);
                datos.agregarParametro("@Total", venta.Total);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
