using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace CatalogoCervezas
{
    public partial class SignUp : System.Web.UI.Page
    {
        char Sexo;
        public List<Provincia> listaProvincia = new List<Provincia>();
        //public List<Usuario> listaUsuario = new List<Usuario>();
        public UsuarioDAO usuarioDAO = new UsuarioDAO();
        public ProvinciaDAO provinciaDAO = new ProvinciaDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //listaUsuario = usuarioDAO.listar();
                listaProvincia = provinciaDAO.listar();
                //string idModificar = Request.QueryString["modificarUsuario"];

                if (!IsPostBack)
                {
                        cargarDropdownlist();
                    ////modifica
                    //if (idModificar != null && idModificar != "")
                    //{
                    //    cargarUsuariosidModificar);

                    //}
                    ////agrega nuevo
                    //else
                    //{
                    //}

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
        protected void cbMasculino_CheckedChanged(object sender, EventArgs e)
        {
            if (cbFemenino.Checked == true)
            {
                cbFemenino.Checked = false;
            }
        }

        protected void cbFemenino_CheckedChanged(object sender, EventArgs e)
        {
            if (cbMasculino.Checked == true)
            {
                cbMasculino.Checked = false;
            }
        }

        protected void btnSubmit3_Click(object sender, EventArgs e)
        {

            Usuario usuario = new Usuario();
            Provincia provincia = new Provincia();
            Domicilo domicilio = new Domicilo();
            TipoUsuario tipoUsuario = new TipoUsuario();
            usuario.tipoUsuario = tipoUsuario;
            usuario.domicilio = domicilio;
            usuario.domicilio.provincia = provincia;
            //string idModificar = Request.QueryString["modificarUsuario"];

            try
            {
                //usuario
                usuario.tipoUsuario.ID = 3;
                usuario.Nombre = txtNombre.Text.Trim();
                usuario.Apellido = txtApellido.Text.Trim();
                usuario.DNI = Convert.ToInt32(txtDNI.Text.Trim());
                if (cbFemenino.Checked)
                    Sexo = 'F';
                if (cbMasculino.Checked)
                    Sexo = 'M';
                usuario.Sexo = Sexo;
                usuario.Telefono = Convert.ToInt32(txtTelefono.Text.Trim());
                usuario.FechaNac = Convert.ToDateTime(txtFechaNac.Text.Trim());
                usuario.Email = txtEmail.Text.Trim();
                usuario.Contraseña = txtContra.Text.Trim();
                //domicilio
                usuario.domicilio.provincia.ID = int.Parse(ddlProvincia.SelectedValue);
                usuario.domicilio.Calle = txt_direccion.Text.Trim();
                usuario.domicilio.Ciudad = txt_ciudad.Text.Trim();
                usuario.domicilio.Referencia = txt_referencia.Text.Trim();
                usuario.domicilio.Depto = txt_departamento.Text.Trim();
                if (txt_piso.Text == "")
                    txt_piso.Text = 0.ToString();
                usuario.domicilio.Piso = Convert.ToInt32(txt_piso.Text.Trim());
                usuario.domicilio.NumeroAltura = Convert.ToInt32(txt_numero.Text.Trim());
                usuario.domicilio.codigoPostal = Convert.ToInt32(txt_codigoPostal.Text.Trim());

                usuarioDAO.agregar(usuario);
                Response.Write("<script>alert('se agrego el nuevo usuario!!');</script>");
                //if (idModificar != null && idModificar != "")
                //{
                //    usuario.domicilio.ID = (Int64)Session[Session.SessionID + "IDDomicilio"];
                //    usuario.ID = Int64.Parse(idModificar);
                //    marcasDAO.modificar(marca);
                //    Response.Write("<script>alert('se modifico la marca!!');</script>");
                //}
                //else
                //{
                //}


            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
                Session["Error" + Session.SessionID] = ex.ToString();
                Response.Redirect("Error.aspx");
            }
            finally
            {
                Response.Redirect("CatalogoArticulos.aspx");
            }



        }
        //public static string HashPassword(string password)
        //{
        //    byte[] salt;
        //    byte[] bytes;
        //    if (password == null)
        //    {
        //        throw new ArgumentNullException("password");
        //    }
        //    using (Rfc2898DeriveBytes rfc2898DeriveByte = new Rfc2898DeriveBytes(password, 16, 1000))
        //    {
        //        salt = rfc2898DeriveByte.Salt;
        //        bytes = rfc2898DeriveByte.GetBytes(32);
        //    }
        //    byte[] numArray = new byte[49];
        //    System.Buffer.BlockCopy(salt, 0, numArray, 1, 16);
        //    System.Buffer.BlockCopy(bytes, 0, numArray, 17, 32);
        //    return Convert.ToBase64String(numArray);
        //}

        public int GenerateSaltForPassword()
        {
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] saltBytes = new byte[4];
            rng.GetNonZeroBytes(saltBytes);
            return (((int)saltBytes[0]) << 24) + (((int)saltBytes[1]) << 16) + (((int)saltBytes[2]) << 8) + ((int)saltBytes[3]);
        }
        public byte[] ComputePasswordHash(string password, int salt)
        {
            byte[] saltBytes = new byte[4];
            saltBytes[0] = (byte)(salt >> 24);
            saltBytes[1] = (byte)(salt >> 16);
            saltBytes[2] = (byte)(salt >> 8);
            saltBytes[3] = (byte)(salt);
            byte[] passwordBytes = UTF8Encoding.UTF8.GetBytes(password);
            byte[] preHashed = new byte[saltBytes.Length + passwordBytes.Length];
            System.Buffer.BlockCopy(passwordBytes, 0, preHashed, 0, passwordBytes.Length);
            System.Buffer.BlockCopy(saltBytes, 0, preHashed, passwordBytes.Length, saltBytes.Length);
            SHA1 sha1 = SHA1.Create();
            return sha1.ComputeHash(preHashed);
        }

        public bool IsPasswordValid(string passwordToValidate, int salt, byte[] correctPasswordHash)
        {
            byte[] hashedPassword = ComputePasswordHash(passwordToValidate, salt);
            return hashedPassword.SequenceEqual(correctPasswordHash);
        }
    }
}