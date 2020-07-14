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
            Int64 idVenta = 0;

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
                datos.ejecutarLector();
                if (datos.lector.Read())
                {
                    idVenta = datos.lector.GetInt64(0);
                    datos.cerrarConexion();
                }

                foreach (Item item in venta.listaItems)
                {
                    datos.setearSP("SP_agregar_articulo_x_venta");
                    datos.ClearParameters();
                    datos.agregarParametro("@IDVenta", idVenta);
                    datos.agregarParametro("@IDArticulo", item.Articulo.ID);
                    datos.agregarParametro("@Precio", item.Articulo.Precio);
                    datos.agregarParametro("@Cantidad", item.Cantidad);

                    datos.ejecutarAccion();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void cargarArticulo()
        {

        }

    }
}
