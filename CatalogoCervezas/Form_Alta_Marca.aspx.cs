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
    public partial class Form_Alta_Marca : System.Web.UI.Page
    {
        public List<Marca> listaMarcas = new List<Marca>();
        public List<Provincia> listaProvincia = new List<Provincia>();
        public MarcasDAO marcasDAO = new MarcasDAO();
        public ProvinciaDAO provinciaDAO = new ProvinciaDAO();
        protected void Page_Load(object sender, EventArgs e)
        { 
            try
            {
                listaMarcas = marcasDAO.listar();
                listaProvincia = provinciaDAO.listar();
                string idModificar = Request.QueryString["modificarMarca"];

                if (!IsPostBack)
                {
                    //modifica
                    if (idModificar != null && idModificar != "")
                    {
                        cargarMarca(idModificar);

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
                //carga provincias
                ddlProvincia.DataSource = listaProvincia;
                ddlProvincia.DataValueField = "ID";
                ddlProvincia.DataTextField = "Nombre";
                ddlProvincia.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }

        }

        protected void cargarMarca(string idModificar)
        {
            try
            {
                Marca marcaModificar = new Marca();
               

                marcaModificar = listaMarcas.Find(marca => marca.ID == Convert.ToInt32(idModificar));

                //carga provincias
                ddlProvincia.DataSource = listaProvincia;
                ddlProvincia.DataValueField = "ID";
                ddlProvincia.DataTextField = "Nombre";
                ddlProvincia.DataBind();

                Session[Session.SessionID + "IDDomicilio"] = marcaModificar.domicilio.ID;
                txt_nombre.Text = marcaModificar.Nombre;
                ddlProvincia.SelectedValue = marcaModificar.domicilio.provincia.ID.ToString();
                txt_ciudad.Text = marcaModificar.domicilio.Ciudad;
                txt_direccion.Text = marcaModificar.domicilio.Calle;
                txt_numero.Text = marcaModificar.domicilio.NumeroAltura.ToString();
                txt_piso.Text = marcaModificar.domicilio.Piso.ToString();
                txt_departamento.Text = marcaModificar.domicilio.Depto;
                txt_referencia.Text = marcaModificar.domicilio.Referencia;
                txt_codigoPostal.Text = marcaModificar.domicilio.codigoPostal.ToString();

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
        }

        protected void CargarC(object sender, EventArgs e)
        {
            Marca marca = new Marca();
            Provincia provincia = new Provincia();
            Domicilo domicilio = new Domicilo();
            marca.domicilio = domicilio;
            marca.domicilio.provincia = provincia;
            string idModificar = Request.QueryString["modificarMarca"];

            try
            {
                marca.Nombre = txt_nombre.Text.Trim();
                marca.domicilio.provincia.ID = int.Parse(ddlProvincia.SelectedValue);
                marca.domicilio.Calle = txt_direccion.Text.Trim();
                marca.domicilio.Ciudad = txt_ciudad.Text.Trim();
                marca.domicilio.Referencia = txt_referencia.Text.Trim();
                marca.domicilio.Depto = txt_departamento.Text.Trim();
                if (txt_piso.Text == "")
                    txt_piso.Text = 0.ToString();
                marca.domicilio.Piso = Convert.ToInt32(txt_piso.Text.Trim());
                marca.domicilio.NumeroAltura = Convert.ToInt32(txt_numero.Text.Trim());
                marca.domicilio.codigoPostal = Convert.ToInt32(txt_codigoPostal.Text.Trim());

                if (idModificar != null && idModificar != "")
                {
                    marca.domicilio.ID = (Int64)Session[Session.SessionID + "IDDomicilio"];
                    marca.ID = Int64.Parse(idModificar);
                    marcasDAO.modificar(marca);
                    Response.Write("<script>alert('se modifico la marca!!');</script>");
                }
                else
                {
                    marcasDAO.agregar(marca);
                    Response.Write("<script>alert('se agrego la nueva marca!!');</script>");
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
                Response.Redirect("ABM_Marca.aspx");
            }

        }
    }

}