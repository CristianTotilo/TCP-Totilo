using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Web.Services.Description;

namespace CatalogoCervezas
{
    public partial class Form_Alta_Articulo : System.Web.UI.Page
    {
    public string urlImagen { get; set; }
        public List<Marca> listaMarcas = new List<Marca>();
        public List<Estilo> listaEstilos = new List<Estilo>();
        public List<Articulo> listaArticulos = new List<Articulo>();
        public CatalogoArticulosDAO articulosDAO = new CatalogoArticulosDAO();
        public MarcasDAO marcasDAO = new MarcasDAO();
        public EstilosDAO estilosDAO = new EstilosDAO();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                listaMarcas = marcasDAO.listar();
                listaEstilos = estilosDAO.listar();
                listaArticulos = (List<Articulo>)Session[Session.SessionID + "listaArticulos"];
                Session[Session.SessionID + "listaMarcas"] = listaMarcas;
                Session[Session.SessionID + "listaEstilos"] = listaEstilos;
                string idModificar = Request.QueryString["modificarArticulo"];

                if (!IsPostBack)
                {
                    //modifica
                    if (idModificar != null && idModificar !="")
                    {
                        cargarArticulo(idModificar);

                    }
                    //agrega nuevo
                    else
                    {
                        cargarDropdownlist();
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

        protected void cargarDropdownlist()
        {
            try
            {
                //carga marcas
                ddlMarcas.DataSource = listaMarcas;
                ddlMarcas.DataValueField = "ID";
                ddlMarcas.DataTextField = "Nombre";
                ddlMarcas.DataBind();
                //carga estilos
                ddlEstilos.DataSource = listaEstilos;
                ddlEstilos.DataValueField = "ID";
                ddlEstilos.DataTextField = "Nombre";
                ddlEstilos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }

        }

        protected void cargarArticulo(string idModificar)
        {
            try
            {
                Articulo articuloModificar = new Articulo();
                articuloModificar = listaArticulos.Find(articulo => articulo.ID == Convert.ToInt32(idModificar));

                //carga marcas
                ddlMarcas.DataSource = listaMarcas;
                ddlMarcas.DataValueField = "ID";
                ddlMarcas.DataTextField = "Nombre";
                ddlMarcas.DataBind();
                //carga estilos
                ddlEstilos.DataSource = listaEstilos;
                ddlEstilos.DataValueField = "ID";
                ddlEstilos.DataTextField = "Nombre";
                ddlEstilos.DataBind();

                txt_nombre.Text = articuloModificar.Nombre;
                ddlMarcas.SelectedValue = articuloModificar.marca.ID.ToString();
                ddlEstilos.SelectedValue = articuloModificar.estilo.ID.ToString();
                txt_descripcion.Text = articuloModificar.Descripcion;
                txt_ABV.Text = articuloModificar.ABV.ToString();
                txt_IBU.Text = articuloModificar.IBU.ToString();
                txt_volumen.Text = articuloModificar.Volumen.ToString();
                txt_precio.Text = articuloModificar.Precio.ToString();
                txt_URLimagen.Text = articuloModificar.ImagenUrl;

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
        }
        protected void CargarImagen_Click(object sender, EventArgs e)
        {
            urlImagen = txt_URLimagen.Text;
        }

        protected void Cargar(object sender, EventArgs e)
        {
            Articulo articulo = new Articulo();
            Marca marca = new Marca();
            Estilo estilo = new Estilo();
            articulo.marca = marca;
            articulo.estilo = estilo;
            string idModificar = Request.QueryString["modificarArticulo"];

            try
            {
                articulo.Nombre = txt_nombre.Text.Trim();
                articulo.marca.ID = int.Parse(ddlMarcas.SelectedValue);
                articulo.estilo.ID =int.Parse(ddlEstilos.SelectedValue);
                articulo.Descripcion = txt_descripcion.Text.Trim();
                articulo.ABV = float.Parse(txt_ABV.Text.Trim());
                articulo.IBU = float.Parse(txt_IBU.Text.Trim());
                articulo.Volumen = Convert.ToInt32(txt_volumen.Text.Trim());
                articulo.Precio = Convert.ToDecimal(txt_precio.Text.Trim());
                articulo.ImagenUrl = txt_URLimagen.Text.Trim();

                if(idModificar!=null && idModificar != "")
                {
                    articulo.ID = Int64.Parse(idModificar);
                    articulosDAO.modificar(articulo);
                Response.Write("<script>alert('se modifico el articulo!!');</script>");
                }
                else
                {
                articulosDAO.agregar(articulo);
                Response.Write("<script>alert('se agrego el nuevo articulo!!');</script>");
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
                Response.Redirect("ABM_Articulos.aspx");
            }

        }

        protected void txt_URLimagen_TextChanged(object sender, EventArgs e)
        {
            urlImagen = txt_URLimagen.Text;
        }
    }
}
