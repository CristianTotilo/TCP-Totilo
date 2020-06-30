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
    public partial class Form_Alta_Estilo : System.Web.UI.Page
    {
        public string urlImagen { get; set; }
        public List<Estilo> listaEstilos = new List<Estilo>();
        public EstilosDAO estilosDAO = new EstilosDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                listaEstilos = estilosDAO.listar();
                string idModificar = Request.QueryString["modificarEstilo"];

                if (!IsPostBack)
                {
                    //modifica
                    if (idModificar != null && idModificar != "")
                    {
                        cargarEstilo(idModificar);

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


        protected void cargarEstilo(string idModificar)
        {
            try
            {
                Estilo estiloModificar = new Estilo();
                estiloModificar = listaEstilos.Find(estilo => estilo.ID == Convert.ToInt32(idModificar));

                //carga estilo
                txt_nombre.Text = estiloModificar.Nombre;

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
        }

        protected void CargarB(object sender, EventArgs e)
        {
            Estilo estilo = new Estilo();
            string idModificar = Request.QueryString["modificarEstilo"];

            try
            {
                estilo.Nombre = txt_nombre.Text.Trim();

                if (idModificar != null && idModificar != "")
                {
                    estilo.ID = Int64.Parse(idModificar);
                    estilosDAO.modificar(estilo);
                    Response.Write("<script>alert('se modifico el estilo!!');</script>");
                }
                else
                {
                    estilosDAO.agregar(estilo);
                    Response.Write("<script>alert('se agrego el nuevo estilo!!');</script>");
                }


            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
            finally
            {
                Response.Redirect("ABM_Estilos.aspx");
            }

        }

    }
}