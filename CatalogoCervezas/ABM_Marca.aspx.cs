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
    public partial class ABM_Marca : System.Web.UI.Page
    {
          public  List<Marca> listaMarcas = new List<Marca>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                MarcasDAO marcasDAO = new MarcasDAO();
                listaMarcas = marcasDAO.listar();
                Session[Session.SessionID + "listaMarcas"] = listaMarcas;

                if (!IsPostBack)
                {

                    string idEliminar = Request.QueryString["eliminarMarca"];
                    if (idEliminar != null)
                    {
                        marcasDAO.Eliminar(Convert.ToInt64(idEliminar));
                        Session[Session.SessionID + "listaMarcas"] = listaMarcas;
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
                repetidor.DataSource = listaMarcas;
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