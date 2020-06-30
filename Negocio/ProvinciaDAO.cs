using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ProvinciaDAO
    {
        public List<Provincia> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Provincia> Listado = new List<Provincia>();

            try
            {
                datos.setearQuery("select P.IDProvincia, P.NombreProvincia from Provincias as P");

                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    Provincia provincia = new Provincia();


                        provincia.ID = datos.lector.GetInt32(0);

                        if (!DBNull.Value.Equals(datos.lector["NombreProvincia"]))
                            provincia.Nombre = datos.lector.GetString(1);
                        else
                        provincia.Nombre = "N/A";

                        Listado.Add(provincia);
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
