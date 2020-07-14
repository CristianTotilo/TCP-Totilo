using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
//using iTextSharp.text.pdf;
//using System.IO;


namespace CatalogoCervezas
{
    public partial class Facturacion : System.Web.UI.Page
    {
        public Venta venta = new Venta();
        public VentaDAO ventaDAO = new VentaDAO();
        public ProvinciaDAO provinciaDAO = new ProvinciaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                venta = (Venta)Session["venta"];
                int b = venta.listaItems.Count;
                if (!IsPostBack)
                {

                    if (venta != null)
                    {
                        BuscarProvincia(venta);
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
        //protected void btnPrint_Click(object sender, EventArgs e)
        //{
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-disposition", "attachment;filename=print.pdf");
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);

        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);

        //    panelPDF.RenderControl(hw);
        //    StringReader sr = new StringReader(sw.ToString());
        //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 10f);
        //    HTMLWorker htmlParser = new HTMLWorker(pdfDoc);
        //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

        //    pdfDoc.Open();
        //    htmlParser.Parse(sr);
        //    pdfDoc.Close();

        //    Response.Write(pdfDoc);
        //    Response.End();
        //}

        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //    return;
        //}

        protected void BuscarProvincia(Venta venta)
        {
            List<Provincia> listadoProvincias = new List<Provincia>();
            listadoProvincias = provinciaDAO.listar();
            int idProv = venta.usuario.domicilio.provincia.ID;
            venta.usuario.domicilio.provincia = listadoProvincias.Find( prov => prov.ID == idProv);

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

        protected void volver_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("CatalogoArticulos.aspx", false);
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