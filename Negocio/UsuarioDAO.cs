using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class UsuarioDAO
    {
        //public List<Usuario> listar()
        //{
        //    AccesoDatos datos = new AccesoDatos();
        //    List<Usuario> Listado = new List<Usuario>();

        //    try
        //    {
        //        datos.setearQuery("select M.IDMarca,M.IDDomicilio,M.NombreMarca,M.Estado,D.Calle,D.Ciudad,D.CodigoPostal,D.Depto,D.Numero,D.Piso,D.Referencia,P.IDProvincia,P.NombreProvincia from Marcas as M left join Domicilio as D on D.IDDomicilio=M.IDDomicilio left join Provincias as P on P.IDProvincia=D.IDProvincia");

        //        datos.ejecutarLector();
        //        while (datos.lector.Read())
        //        {
        //            Usuario usuario = new Usuario();
        //            Domicilo domicilio = new Domicilo();
        //            Provincia provincia = new Provincia();
        //            usuario.domicilio = domicilio;
        //            usuario.domicilio.provincia = provincia;


        //            if (!DBNull.Value.Equals(datos.lector["Estado"]))
        //                usuario.Estado = datos.lector.GetBoolean(3);

        //            if (usuario.Estado == true)
        //            {
        //                usuario.ID = datos.lector.GetInt64(0);

        //                usuario.domicilio.ID = datos.lector.GetInt64(1);

        //                if (!DBNull.Value.Equals(datos.lector["NombreMarca"]))
        //                    usuario.Nombre = datos.lector.GetString(2);
        //                else
        //                    usuario.Nombre = "N/A";

        //                if (!DBNull.Value.Equals(datos.lector["Calle"]))
        //                    usuario.domicilio.Calle = datos.lector.GetString(4);
        //                else
        //                    usuario.domicilio.Calle = "N/A";

        //                if (!DBNull.Value.Equals(datos.lector["Ciudad"]))
        //                    usuario.domicilio.Ciudad = datos.lector.GetString(5);
        //                else
        //                    usuario.domicilio.Ciudad = "N/A";

        //                if (!DBNull.Value.Equals(datos.lector["CodigoPostal"]))
        //                    usuario.domicilio.codigoPostal = datos.lector.GetInt32(6);
        //                else
        //                    usuario.domicilio.codigoPostal = 0;

        //                if (!DBNull.Value.Equals(datos.lector["Depto"]))
        //                    usuario.domicilio.Depto = datos.lector.GetString(7);
        //                else
        //                    usuario.domicilio.Depto = "N/A";

        //                if (!DBNull.Value.Equals(datos.lector["Numero"]))
        //                    usuario.domicilio.NumeroAltura = datos.lector.GetInt32(8);
        //                else
        //                    usuario.domicilio.NumeroAltura = 0;

        //                if (!DBNull.Value.Equals(datos.lector["Piso"]))
        //                    usuario.domicilio.Piso = datos.lector.GetInt32(9);
        //                else
        //                    usuario.domicilio.Piso = 0;

        //                if (!DBNull.Value.Equals(datos.lector["Referencia"]))
        //                    usuario.domicilio.Referencia = datos.lector.GetString(10);
        //                else
        //                    usuario.domicilio.Referencia = "N/A";

        //                if (!DBNull.Value.Equals(datos.lector["IDProvincia"]))
        //                    usuario.domicilio.provincia.ID = datos.lector.GetInt32(11);
        //                else
        //                    usuario.domicilio.provincia.ID = 0;

        //                if (!DBNull.Value.Equals(datos.lector["NombreProvincia"]))
        //                    usuario.domicilio.provincia.Nombre = datos.lector.GetString(12);
        //                else
        //                    usuario.domicilio.provincia.Nombre = "N/A";

        //                Listado.Add(usuario);
        //            }
        //        }

        //        return Listado;
        //    }

        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //    finally
        //    {
        //        datos.cerrarConexion();
        //    }
        //}
        public Usuario login(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearSP("SP_ConsultarUsuario");
                datos.ClearParameters();
                datos.agregarParametro("@Email", usuario.Email);
                datos.agregarParametro("@Contraseña", usuario.Contraseña);
                //0.Estado,1.IDUsuario,2.Nombre,3.Apellido,4.DNI,5.Email,6.FechaNac,7.Sexo,8.Telefono,9.IDDomicilio,10.Calle,11.Ciudad,12.CodigoPostal,13.Depto,14.IDProvincia,15.Numero,16.Piso,17.Referencia
                //datos.ejecutarAccion();
                datos.ejecutarLector();
                if (datos.lector.Read()) {
                      
                    usuario.Estado = datos.lector.GetBoolean(0);

                    if (usuario.Estado == true)
                    {
                        usuario.ID = datos.lector.GetInt64(1);
                        usuario.Nombre = datos.lector.GetString(2);
                        usuario.Apellido = datos.lector.GetString(3);
                        usuario.DNI = datos.lector.GetInt32(4);
                        usuario.Email = datos.lector.GetString(5);
                        usuario.FechaNac = datos.lector.GetDateTime(6);
                        usuario.Sexo = datos.GetAChar(datos.lector, 7); // Calling method
                        usuario.Telefono = datos.lector.GetInt32(8);
                        usuario.domicilio.ID = datos.lector.GetInt64(9);
                        usuario.domicilio.Calle = datos.lector.GetString(10);
                        usuario.domicilio.Ciudad = datos.lector.GetString(11);
                        usuario.domicilio.codigoPostal = datos.lector.GetInt32(12);
                        if (!DBNull.Value.Equals(datos.lector["Depto"]))
                            usuario.domicilio.Depto = datos.lector.GetString(13);
                        else
                            usuario.domicilio.Depto = "N/A";
                        usuario.domicilio.provincia.ID = datos.lector.GetInt32(14);
                        usuario.domicilio.NumeroAltura = datos.lector.GetInt32(15);
                        if (!DBNull.Value.Equals(datos.lector["Piso"]))
                            usuario.domicilio.Piso = datos.lector.GetInt32(16);
                        else
                            usuario.domicilio.Piso = 0;
                        if (!DBNull.Value.Equals(datos.lector["Referencia"]))
                            usuario.domicilio.Referencia = datos.lector.GetString(17);
                        else
                            usuario.domicilio.Referencia = "N/A";

                    }
                }

                return usuario;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void agregar(Usuario usuario)//Agrega usuario + domicilio en un SP
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_agregar_usuario_domicilio");
                datos.ClearParameters();
                //Usuario
                datos.agregarParametro("@IDTipoUsuario", usuario.tipoUsuario.ID);
                if (usuario.Nombre == "")
                    usuario.Nombre = "N/A";
                datos.agregarParametro("@Nombre", usuario.Nombre);
                if (usuario.Apellido == "")
                    usuario.Apellido = "N/A";
                datos.agregarParametro("@Apellido", usuario.Apellido);
                datos.agregarParametro("@Sexo", usuario.Sexo);
                datos.agregarParametro("@DNI", usuario.DNI);
                datos.agregarParametro("@FechaNac", usuario.FechaNac.Date);
                datos.agregarParametro("@Telefono", usuario.Telefono);
                datos.agregarParametro("@Email", usuario.Email);
                datos.agregarParametro("@Contraseña", usuario.Contraseña);
                datos.agregarParametro("@Estado", 1);
                //Domiilio
                datos.agregarParametro("@IDProvincia", usuario.domicilio.provincia.ID);
                if (usuario.domicilio.Ciudad == "")
                    usuario.domicilio.Ciudad = "N/A";
                datos.agregarParametro("@Ciudad", usuario.domicilio.Ciudad);
                if (usuario.domicilio.Calle == "")
                    usuario.domicilio.Calle = "N/A";
                datos.agregarParametro("@Calle", usuario.domicilio.Calle);
                if (usuario.domicilio.NumeroAltura == 0)
                    usuario.domicilio.NumeroAltura = 0;
                datos.agregarParametro("@Numero", usuario.domicilio.NumeroAltura);
                datos.agregarParametro("@Piso", usuario.domicilio.Piso);
                datos.agregarParametro("@Depto", usuario.domicilio.Depto);
                datos.agregarParametro("@Referencia", usuario.domicilio.Referencia);
                datos.agregarParametro("@CodigoPostal", usuario.domicilio.codigoPostal);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //public void modificar(Usuario usuario)//modifica usuario + domicilio
        //{
        //    AccesoDatos datos = new AccesoDatos();
        //    try
        //    {

        //        datos.setearSP("SP_modificar_usuario");
        //        datos.ClearParameters();
        //        //Usuario
        //        if (usuario.Nombre == "")
        //            usuario.Nombre = "N/A";
        //        datos.agregarParametro("@Nombre", usuario.Nombre);
        //        if (usuario.Apellido == "")
        //            usuario.Apellido = "N/A";
        //        datos.agregarParametro("@Apellido", usuario.Apellido);
        //        datos.agregarParametro("@Sexo", usuario.Apellido);
        //        datos.agregarParametro("@DNI", usuario.DNI);
        //        datos.agregarParametro("@FechaNac", usuario.FechaNac.Date);
        //        datos.agregarParametro("@Telefono", usuario.Telefono);
        //        datos.agregarParametro("@Email", usuario.Email);
        //        datos.agregarParametro("@Contraseña", usuario.Contraseña);
        //        datos.ejecutarAccion();
        //        datos.setearSP("SP_modificar_domicilio");
        //        datos.ClearParameters();
        //        //Domicilio
        //        datos.agregarParametro("@IDDomicilio", usuario.domicilio.ID);
        //        datos.agregarParametro("@IDProvincia", usuario.domicilio.provincia.ID);
        //        datos.agregarParametro("@Ciudad", usuario.domicilio.Ciudad);
        //        datos.agregarParametro("@Calle", usuario.domicilio.Calle);
        //        datos.agregarParametro("@Numero", usuario.domicilio.NumeroAltura);
        //        datos.agregarParametro("@Piso", usuario.domicilio.Piso);
        //        datos.agregarParametro("@Depto", usuario.domicilio.Depto);
        //        datos.agregarParametro("@Referencia", usuario.domicilio.Referencia);
        //        datos.agregarParametro("@CodigoPostal", usuario.domicilio.codigoPostal);
        //        datos.ejecutarAccion();

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}

        ////baja logica
        //public void Eliminar(Int64 ID)
        //{
        //    AccesoDatos datos = new AccesoDatos();

        //    try
        //    {
        //        datos.setearSP("SP_eliminar_usuario");
        //        datos.agregarParametro("@IDUsuario", ID);
        //        datos.ejecutarAccion();

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}
    }
}
