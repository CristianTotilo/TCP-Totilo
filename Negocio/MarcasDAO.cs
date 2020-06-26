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

    }
}
