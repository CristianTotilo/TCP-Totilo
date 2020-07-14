using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace CatalogoCervezas
{
    public partial class Facturacion : System.Web.UI.Page
    {
        public Venta venta = new Venta();
        public VentaDAO ventaDAO = new VentaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                venta = (Venta)Session["venta"];
                //venta.listaItems = (List<Item>)Session["listaVenta"];
                //venta.listaItems = (List<Item>)Session[Session.SessionID + "listaItems"];
                int b = venta.listaItems.Count;
                if (!IsPostBack)
                {

                    if (venta != null)
                    {
                        cargarRepeater();
                        ventaDAO.agregar(venta);
                    }


                }


            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
        }
        protected void cargarRepeater()
        {
            try
            {
                repetidor.DataSource = venta.listaItems;
                repetidor.DataBind();

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }

        }
    }
}