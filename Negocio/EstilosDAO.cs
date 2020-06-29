using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class EstilosDAO
    {
        public List<Estilo> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Estilo> Listado = new List<Estilo>();

            try
            {
                datos.setearQuery("select E.IDEstilo,E.NombreEstilo,E.Estado from Estilos as E");

                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    Estilo estilo = new Estilo();

                    if (!DBNull.Value.Equals(datos.lector["Estado"]))
                        estilo.Estado = datos.lector.GetBoolean(2);

                    if (estilo.Estado == true)
                    {
                        estilo.ID = datos.lector.GetInt64(0);


                        if (!DBNull.Value.Equals(datos.lector["NombreEstilo"]))
                            estilo.Nombre = datos.lector.GetString(1);
                        else
                            estilo.Nombre = "N/A";

                        Listado.Add(estilo);
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

        public void agregar(Estilo estilo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_agregar_estilo");
                datos.ClearParameters();
                if (estilo.Nombre == "")
                    estilo.Nombre = "N/A";
                datos.agregarParametro("@Nombre", estilo.Nombre);
                datos.agregarParametro("@Estado", 1);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void modificar(Estilo estilo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_modificar_estilo");
                datos.agregarParametro("@IDEstilo", estilo.ID);
                datos.agregarParametro("@Nombre", estilo.Nombre);
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
                datos.setearSP("SP_eliminar_estilo");
                datos.agregarParametro("@IDEstilo", ID);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
