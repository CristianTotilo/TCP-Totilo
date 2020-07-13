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
    public partial class CarritoWeb : System.Web.UI.Page
    {
        public List<Articulo> listaArticulos { get; set; }
        public Carrito carrito = new Carrito();
        public  Usuario usuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                usuario = (Usuario)Session["usersession"];
                listaArticulos = (List<Articulo>)Session[Session.SessionID + "listaArticulos"];

                if ((Carrito)Session[Session.SessionID + "carrito"] == null)
                {
                    Session[Session.SessionID + "carrito"] = carrito;
                    carrito.ID = "carrito-" + Session.SessionID;
                    carrito = (Carrito)Session[Session.SessionID + "carrito"];
                }
                else
                {
                    carrito = (Carrito)Session[Session.SessionID + "carrito"];
                }
                if (!IsPostBack)
                {
                    string idArticulo = Request.QueryString["idsum"];
                    
                    if (carrito != null)
                    {

                        if (idArticulo != null)
                        {
                            AgregarAlCarrito(idArticulo);

                        }

                    }
                    string idComprar = Request.QueryString["comprar"];

                    if (idComprar != null && ContarCarrito() != 0 && usuario !=null)
                    {
                        GenerarVenta();
                        carrito.eliminatTodo();
                        Session[Session.SessionID + "carrito"] = carrito;
                        Response.Redirect("CatalogoArticulos.aspx",false);

                    }
                    string idSumar = Request.QueryString["sumar"];
                    if (idSumar != null)
                    {
                        carrito.sumarItem(Convert.ToInt32(idSumar));
                        Session[Session.SessionID + "carrito"] = carrito;
                    }
                    string idRestar = Request.QueryString["restar"];
                    if (idRestar != null)
                    {
                        carrito.restarItem(Convert.ToInt32(idRestar));
                        Session[Session.SessionID + "carrito"] = carrito;
                    }

                    string idEliminar = Request.QueryString["eliminar"];
                    if (idEliminar != null)
                    {
                        carrito.eliminarItem(Convert.ToInt32(idEliminar));
                        Session[Session.SessionID + "carrito"] = carrito;
                    }
                    string idEliminarTodo = Request.QueryString["eliminarTodo"];
                    if (idEliminarTodo != null)
                    {
                        carrito.eliminatTodo();
                        Session[Session.SessionID + "carrito"] = carrito;
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
        protected void GenerarVenta()
        {
            //Venta venta = new Venta();
            //venta.usuario.ID = usuario.ID;
            //venta.IDDomicilioVenta = 10;
            //venta.listaItems = carrito.listaItems;
            //venta.Subtotal = 
        }

        protected void cargarRepeater()
        {
            try
            {

                carrito = (Carrito)Session["carrito" + Session.SessionID];
                if (carrito != null)
                {
                    repetidorCarrito.DataSource = carrito.listaItems;
                    repetidorCarrito.DataBind();
                }
                else
                {
                    MensajeCarritoVacio();
                }

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }

        }

        protected void AgregarAlCarrito(string IdArticulo)
        {

            try
            {
                Articulo articuloParaAgregar = new Articulo();
                articuloParaAgregar = listaArticulos.Find(articulo => articulo.ID == Convert.ToInt32(IdArticulo));
                carrito.agregarItem(articuloParaAgregar);
                carrito.CantidadItems += 1;
                Session["carrito" + Session.SessionID] = carrito;
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
        }
        protected int ContarCarrito()
        {
            if (carrito == null)
                return 0;
            return carrito.getCantidad();
        }
        protected double SubtotalCarrito()
        {
            if (carrito == null)
                return 0;
            return carrito.preciosubTotal();
        }
        protected double TOTAL()
        {
            double total=SubtotalCarrito();
            return total;
        }
        protected string MensajeCarritoVacio()
        {
            if (ContarCarrito() == 0)
                return "No se agrego ningun articulo al carrito!";
            else
                return "";
        }
    }
}
