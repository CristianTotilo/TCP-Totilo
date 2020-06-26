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
    public partial class ABM_Articulos : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos = new List<Articulo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CatalogoArticulosDAO ArticulosDAO = new CatalogoArticulosDAO();
                listaArticulos = ArticulosDAO.listar();
                Session[Session.SessionID + "listaArticulos"] = listaArticulos;

                if (!IsPostBack)
                {

                    string idEliminar = Request.QueryString["eliminar"];
                    if (idEliminar != null)
                    {
                        ArticulosDAO.Eliminar(Convert.ToInt64(idEliminar));
                        Session[Session.SessionID + "listaArticulos"] = listaArticulos;
                    }

                    cargarRepeater();

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
                repetidor.DataSource = listaArticulos;
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