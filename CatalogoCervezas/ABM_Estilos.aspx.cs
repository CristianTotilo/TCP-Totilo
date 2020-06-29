using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace CatalogoCervezas
{
    public partial class ABM_Estilos : System.Web.UI.Page
    {
        public List<Estilo> listaEstilos= new List<Estilo>();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                EstilosDAO estilosDAO = new EstilosDAO();
                listaEstilos = estilosDAO.listar();
                Session[Session.SessionID + "listaEstilos"] = listaEstilos;

                if (!IsPostBack)
                {

                    string idEliminar = Request.QueryString["eliminarEstilo"];
                    if (idEliminar != null)
                    {
                        estilosDAO.Eliminar(Convert.ToInt64(idEliminar));
                        Session[Session.SessionID + "listaEstilos"] = listaEstilos;
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
                repetidor.DataSource = listaEstilos;
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