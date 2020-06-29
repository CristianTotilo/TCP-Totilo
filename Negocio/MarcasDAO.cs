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
                datos.setearQuery("select M.IDMarca,M.IDDomicilio,M.NombreMarca,M.Estado from Marcas as M");

                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    Marca marca = new Marca();
                    Domicilo domicilio = new Domicilo();
                    marca.domicilio = domicilio;

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
        public void agregar(Marca marca)
        {
            AccesoDatos datos = new AccesoDatos();
            Domicilo domicilio = new Domicilo();
            Provincia provincia = new Provincia();
            marca.domicilio = domicilio;
            marca.domicilio.provincia = provincia;

            try
            {
                datos.setearSP("SP_agregar_marca_domicilio");
                datos.ClearParameters();
                if (marca.Nombre == "")
                    marca.Nombre = "N/A";
                datos.agregarParametro("@NombreMarca", marca.Nombre);
                datos.agregarParametro("@Estado", 1);
                datos.agregarParametro("@IDProvincia", marca.domicilio.provincia.ID);
                datos.agregarParametro("@Ciudad", marca.domicilio.Ciudad);
                datos.agregarParametro("@Calle", marca.domicilio.Calle);
                datos.agregarParametro("@Numero", marca.domicilio.NumeroAltura);
                datos.agregarParametro("@Piso",marca.domicilio.Piso);
                datos.agregarParametro("@Depto", marca.domicilio.Depto);
                datos.agregarParametro("@Referencia", marca.domicilio.Referencia);
                datos.agregarParametro("@CodigoPostal",marca.domicilio.codigoPostal);

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
            Domicilo domicilio = new Domicilo();
            Provincia provincia = new Provincia();
            marca.domicilio = domicilio;
            marca.domicilio.provincia = provincia;
            try
            {

                datos.setearSP("SP_modificar_marca");
                datos.agregarParametro("@IDMArca", marca.ID);
                datos.agregarParametro("@NombreMarca", marca.Nombre);
                datos.agregarParametro("@IDDomicilio", marca.domicilio.ID);
                datos.agregarParametro("@IDProvincia", marca.domicilio.provincia.ID);
                datos.agregarParametro("@Ciudad", marca.domicilio.Ciudad);
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
