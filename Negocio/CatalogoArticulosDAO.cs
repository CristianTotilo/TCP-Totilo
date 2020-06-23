using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class CatalogoArticulosDAO
    {

        public List<Articulo> listar()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Articulo> Listado = new List<Articulo>();

            try
            {
                datos.setearQuery("select A.IDArticulo,A.IDMarca,M.NombreMarca,A.IDEstilo,E.NombreEstilo,A.Nombre,A.Descripcion,A.ABV,A.IBU,A.Volumen,A.Precio,A.ImagenUrl,A.Estado from ARTICULO as A left join Estilos as E on A.IDEstilo = E.IDEstilo  left join Marcas as M on A.IDMarca = M.IDMarca");

                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    Articulo Articulo = new Articulo();
                    Marca marca = new Marca();
                    Estilo estilo = new Estilo();
                    Articulo.marca = marca;
                    Articulo.estilo = estilo;

                    if (!DBNull.Value.Equals(datos.lector["Estado"]))
                        Articulo.Estado = datos.lector.GetBoolean(12);

                    if (Articulo.Estado == true)
                    {
                        Articulo.ID = datos.lector.GetInt64(0);

                        Articulo.marca.ID = datos.lector.GetInt64(1);

                        if (!DBNull.Value.Equals(datos.lector["NombreMarca"]))
                            Articulo.marca.Nombre = datos.lector.GetString(2);
                        else
                            Articulo.marca.Nombre = "N/A";

                        Articulo.estilo.ID = datos.lector.GetInt64(3);

                        if (!DBNull.Value.Equals(datos.lector["NombreEstilo"]))
                            Articulo.estilo.Nombre = datos.lector.GetString(4);
                        else
                            Articulo.estilo.Nombre = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["Nombre"]))
                            Articulo.Nombre = datos.lector.GetString(5);
                        else
                            Articulo.Nombre = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["Descripcion"]))
                            Articulo.Descripcion = datos.lector.GetString(6);
                        else
                            Articulo.Descripcion = "N/A";

                        if (!DBNull.Value.Equals(datos.lector["ABV"]))
                            Articulo.ABV = (float)datos.lector.GetSqlDouble(7);
                        else
                            Articulo.ABV = 0;

                        if (!DBNull.Value.Equals(datos.lector["IBU"]))
                            Articulo.IBU = (float)datos.lector.GetSqlDouble(8);
                        else
                            Articulo.IBU = 0;

                        if (!DBNull.Value.Equals(datos.lector["Volumen"]))
                            Articulo.Volumen = datos.lector.GetInt32(9);
                        else
                            Articulo.Volumen = 0;

                        //if (!DBNull.Value.Equals(datos.lector["Valoracion"]))
                        //    Articulo.Valoracion = (float)datos.lector.GetSqlDouble(10);
                        //else
                        //    Articulo.Valoracion = 0;

                        if (!DBNull.Value.Equals(datos.lector["Precio"]))
                            Articulo.Precio = datos.lector.GetDecimal(10);
                        else
                            Articulo.Precio = 0;

                        if (!DBNull.Value.Equals(datos.lector["ImagenUrl"]))
                            Articulo.ImagenUrl = datos.lector.GetString(11);
                        else
                            Articulo.ImagenUrl = "N/A";

                        Listado.Add(Articulo);
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

        public void agregar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_agregar_articulo");
                datos.ClearParameters();
                datos.agregarParametro("@IDMarca", articulo.marca.ID);
                datos.agregarParametro("@IDEstilo", articulo.estilo.ID);
                if (articulo.Descripcion == "")
                    articulo.Descripcion = "N/A";
                datos.agregarParametro("@Descripcion", articulo.Descripcion);
                datos.agregarParametro("@ABV", articulo.ABV);
                datos.agregarParametro("@IBU", articulo.IBU);
                datos.agregarParametro("@Volumen", articulo.Valoracion);
                if (articulo.Precio == 0)
                    articulo.Precio = 0;
                datos.agregarParametro("@Precio", articulo.Precio);
                datos.agregarParametro("@ImagenUrl", articulo.ImagenUrl);
                datos.agregarParametro("@Estado", 1);
                if (articulo.Nombre == "")
                    articulo.Nombre = "N/A";
                datos.agregarParametro("@Nombre", articulo.Nombre);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void modificar(Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearSP("SP_modificar_articulo");
                datos.agregarParametro("@IDArticulo", articulo.ID);
                datos.agregarParametro("@IDMarca", articulo.marca.ID);
                datos.agregarParametro("@IDEstilo", articulo.estilo.ID);
                datos.agregarParametro("@Descripcion", articulo.Descripcion);
                datos.agregarParametro("@ABV", articulo.ABV);
                datos.agregarParametro("@IBU", articulo.IBU );
                datos.agregarParametro("@Volumen", articulo.Volumen);
                datos.agregarParametro("@Precio", articulo.Precio);
                datos.agregarParametro("@ImagenUrl", articulo.ImagenUrl);
                datos.agregarParametro("@Nombre", articulo.Nombre);
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
                datos.setearQuery("SP_eliminar_articulo");
                datos.agregarParametro("@IDArticulo", ID);
                datos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
