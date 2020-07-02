using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class MarcasDAO
    {
        public List<Marca> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Marca> Listado = new List<Marca>();

            try
            {
                datos.setearQuery("select M.IDMarca,M.IDDomicilio,M.NombreMarca,M.Estado,D.Calle,D.Ciudad,D.CodigoPostal,D.Depto,D.Numero,D.Piso,D.Referencia,P.IDProvincia,P.NombreProvincia from Marcas as M left join Domicilio as D on D.IDDomicilio=M.IDDomicilio left join Provincias as P on P.IDProvincia=D.IDProvincia");

                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    Marca marca = new Marca();
                    Domicilo domicilio = new Domicilo();
                    Provincia provincia = new Provincia();
                    marca.domicilio = domicilio;
                    marca.domicilio.provincia = provincia;


                    if (!DBNull.Value.Equals(datos.lector["Estado"]))
                        marca.Estado = datos.lector.GetBoolean(3);

                    if (marca.Estado == true)
                    {
                        marca.ID = datos.lector.GetInt64(0);

                        marca.domicilio.ID = datos.lector.GetInt64(1);

                        if (!DBNull.Value.Equals(datos.lector["NombreMarca"]))
                            marca.Nombre = datos.lector.GetString(2);
                        else
                            marca.Nombre = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["Calle"]))
                            marca.domicilio.Calle = datos.lector.GetString(4);
                        else
                            marca.domicilio.Calle = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["Ciudad"]))
                            marca.domicilio.Ciudad = datos.lector.GetString(5);
                        else
                            marca.domicilio.Ciudad = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["CodigoPostal"]))
                            marca.domicilio.codigoPostal = datos.lector.GetInt32(6);
                        else
                            marca.domicilio.codigoPostal = 0;

                        if (!DBNull.Value.Equals(datos.lector["Depto"]))
                            marca.domicilio.Depto = datos.lector.GetString(7);
                        else
                            marca.domicilio.Depto = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["Numero"]))
                            marca.domicilio.NumeroAltura = datos.lector.GetInt32(8);
                        else
                            marca.domicilio.NumeroAltura = 0;

                        if (!DBNull.Value.Equals(datos.lector["Piso"]))
                            marca.domicilio.Piso = datos.lector.GetInt32(9);
                        else
                            marca.domicilio.Piso = 0;

                        if (!DBNull.Value.Equals(datos.lector["Referencia"]))
                            marca.domicilio.Referencia = datos.lector.GetString(10);
                        else
                            marca.domicilio.Referencia = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["IDProvincia"]))
                            marca.domicilio.provincia.ID = datos.lector.GetInt32(11);
                        else
                            marca.domicilio.provincia.ID = 0;

                        if (!DBNull.Value.Equals(datos.lector["NombreProvincia"]))
                            marca.domicilio.provincia.Nombre = datos.lector.GetString(12);
                        else
                            marca.domicilio.provincia.Nombre = "N/A";

                        Listado.Add(marca);
                    }
                }

                return Listado;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void agregar(Marca marca) //Agrega Marca + domicilio en un SP
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_agregar_marca_domicilio");
                datos.ClearParameters();
                if (marca.Nombre == "")
                    marca.Nombre = "N/A";
                datos.agregarParametro("@NombreMarca", marca.Nombre);
                datos.agregarParametro("@Estado", 1);
                datos.agregarParametro("@IDProvincia", marca.domicilio.provincia.ID);
                if (marca.domicilio.Ciudad == "")
                    marca.domicilio.Ciudad = "N/A";
                datos.agregarParametro("@Ciudad", marca.domicilio.Ciudad);
                if (marca.domicilio.Calle == "")
                    marca.domicilio.Calle = "N/A";
                datos.agregarParametro("@Calle", marca.domicilio.Calle);
                if (marca.domicilio.NumeroAltura == 0)
                    marca.domicilio.NumeroAltura = 0;
                datos.agregarParametro("@Numero", marca.domicilio.NumeroAltura);
                datos.agregarParametro("@Piso", marca.domicilio.Piso);
                datos.agregarParametro("@Depto", marca.domicilio.Depto);
                datos.agregarParametro("@Referencia", marca.domicilio.Referencia);
                datos.agregarParametro("@CodigoPostal", marca.domicilio.codigoPostal);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void modificar(Marca marca)//modifica marca + domicilio
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {

                datos.setearSP("SP_modificar_marca");
                datos.agregarParametro("@IDMArca", marca.ID);
                datos.agregarParametro("@NombreMarca", marca.Nombre);
                datos.ejecutarAccion();
                datos.ClearParameters();
                datos.setearSP("SP_modificar_domicilio");
                datos.agregarParametro("@IDDomicilio", marca.domicilio.ID);
                datos.agregarParametro("@IDProvincia", marca.domicilio.provincia.ID);
                datos.agregarParametro("@Ciudad", marca.domicilio.Ciudad);
                datos.agregarParametro("@Calle", marca.domicilio.Calle);
                datos.agregarParametro("@Numero", marca.domicilio.NumeroAltura);
                datos.agregarParametro("@Piso", marca.domicilio.Piso);
                datos.agregarParametro("@Depto", marca.domicilio.Depto);
                datos.agregarParametro("@Referencia", marca.domicilio.Referencia);
                datos.agregarParametro("@CodigoPostal", marca.domicilio.codigoPostal);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        //baja logica
        public void Eliminar(Int64 ID)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_eliminar_maca");
                datos.agregarParametro("@IDMarca", ID);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
