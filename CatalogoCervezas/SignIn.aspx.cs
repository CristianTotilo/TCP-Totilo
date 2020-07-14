using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace CatalogoCervezas
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = new Usuario();
            Provincia provincia = new Provincia();
            Domicilo domicilio = new Domicilo();
            TipoUsuario tipoUsuario = new TipoUsuario();
            usuario.tipoUsuario = tipoUsuario;
            usuario.domicilio = domicilio;
            usuario.domicilio.provincia = provincia;
            try
            {
                usuario.Email = txtUsuario.Text;
                usuario.Contraseña = txtPass.Text;
                usuario= (Usuario)usuarioDAO.login(usuario);
                if (usuario.ID != 0)
                {
                    Session.Add("usersession", usuario);
                    Response.Write("<script>alert('Sesion iniciada correctamente');</script>");
                    Response.Redirect("CatalogoArticulos.aspx",false);
                }
                else
                {
                    Response.Write("<script>alert('Usuario o Contraseña Erroneas');</script>");
                }

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