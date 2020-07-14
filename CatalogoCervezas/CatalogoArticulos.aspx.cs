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
    public partial class CatalogoArticulos : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos = new List<Articulo>();
        public List<Marca> listaMarcas = new List<Marca>();
        public List<Estilo> listaEstilos = new List<Estilo>();
        public Usuario usuario = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                CatalogoArticulosDAO ArticulosDAO = new CatalogoArticulosDAO();
                EstilosDAO estilosDAO = new EstilosDAO();
                MarcasDAO marcasDAO = new MarcasDAO();
                listaArticulos = ArticulosDAO.listar();
                listaEstilos = estilosDAO.listar();
                listaMarcas = marcasDAO.listar();

                usuario = (Usuario)Session["usersession"];
                Session[Session.SessionID + "listaArticulos"] = listaArticulos;

                if (!IsPostBack)
                {
                    string filtroMarca = Request.QueryString["filtroMarca"];
                    string filtroEstilo = Request.QueryString["filtroEstilo"];
                    if (filtroMarca != null)
                    {
                        FiltrarPorMarca(filtroMarca);
                    }
                    if (filtroEstilo != null)
                    {
                        FiltrarPorEstilo(filtroEstilo);
                    }
                    repetidor.DataSource = listaArticulos;
                    repetidor.DataBind();
                    string idfav = Request.QueryString["idfav"];
                    if (idfav != null)
                    {
                        if (usuario == null)
                        {
                            Response.Write("<script>alert('Debe Iniciar session agregar articulos a Favoritos.')</script>");
                        }
                    }
                    if (idfav != null && usuario != null)
                    {
                        UsuarioDAO usuarioDAO = new UsuarioDAO();
                        usuarioDAO.agregarFavorito(usuario.ID, idfav);
                        Response.Write("<script>alert('El articulo seleccionado se agrego a favoritos!')</script>");
                    }
                }
            }
            //catch (SqlException exsql)
            //{
            //    Response.Write("<script>alert('No se puede volver a agregar el mismo articulo!')</script>");
            //    Session.Add("Error", exsql.ToString());
            //}
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
        }
        protected void FiltrarPorMarca(string idMarca)
        {
            try
            {
                List<Articulo> articulosMarca = new List<Articulo>();
                articulosMarca = listaArticulos.FindAll(articulo => articulo.marca.ID == Int64.Parse(idMarca));
                listaArticulos = articulosMarca;
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
        protected void FiltrarPorEstilo(string idEstilo)
        {
            try
            {
                List<Articulo> articulosEstilo = new List<Articulo>();

                articulosEstilo = listaArticulos.FindAll(articulo => articulo.estilo.ID == Int64.Parse(idEstilo));
                listaArticulos = articulosEstilo;
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
        protected void btnFavoritos_click(object sender, EventArgs e)
        {
            try
            {
                CatalogoArticulosDAO ArticulosDAO = new CatalogoArticulosDAO();
                List<Articulo> listaFavoritos = ArticulosDAO.listarFavoritos(usuario.ID);
                listaArticulos = listaFavoritos;
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
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                List<Articulo> listaFiltrada;
                if (txt_Buscar.Text == "")
                    listaFiltrada = listaArticulos;
                else
                    listaFiltrada = listaArticulos.FindAll(articulo => articulo.Nombre.ToLower().Contains(txt_Buscar.Text.Trim().ToLower()));

                listaArticulos = listaFiltrada;
                MensajeVacio();
                repetidor.DataSource = listaArticulos;
                repetidor.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
        protected string MensajeVacio()
        {
            if (listaArticulos.Count() == 0)
                return "No se encontraron articulos!";
            else
                return "";
        }

    }
}
