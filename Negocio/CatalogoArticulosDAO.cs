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
                datos.setearQuery("select A.IDArticulo,A.IDMarca,M.NombreMarca,A.IDEstilo,E.NombreEstilo,A.Nombre,A.Descripcion,A.ABV,A.IBU,A.Volumen,A.Valoracion,A.Precio,A.ImagenUrl from ARTICULO as A left join Estilos as E on A.IDEstilo = E.IDEstilo left join Marcas as M on A.IDMarca = M.IDMarca");

                datos.ejecutarLector();
                while (datos.lector.Read())
                {
                    Articulo Articulo = new Articulo();
                    Marca marca = new Marca();
                    Estilo estilo = new Estilo();
                    Articulo.marca = marca;
                    Articulo.estilo = estilo;

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
                    
                    if (!DBNull.Value.Equals(datos.lector["Valoracion"]))
                        Articulo.Valoracion = (float)datos.lector.GetSqlDouble(10);
                    else
                        Articulo.Valoracion = 0;

                    if (!DBNull.Value.Equals(datos.lector["Precio"]))
                        Articulo.Precio = datos.lector.GetDecimal(11);
                    else
                        Articulo.Precio = 0;
                    
                    if (!DBNull.Value.Equals(datos.lector["ImagenUrl"]))
                        Articulo.ImagenUrl = datos.lector.GetString(12);
                    else
                        Articulo.ImagenUrl = "N/A";

                    Listado.Add(Articulo);

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

        //PARA EDITAR

        //public void agregar(Articulo nuevo)
        //{
        //    AccesoDatos datos = new AccesoDatos();

        //    try
        //    {

        //        datos.setearQuery("insert into ARTICULOS (Codigo, Nombre, Descripcion,IdMarca,IdCategoria,ImagenUrl,Precio) Values (@Codigo,@Nombre,@Descripcion,@Marca,@Categoria,@ImagenUrl,@Precio)");
        //        // comando.Parameters.Clear();
        //        if (nuevo.Codigo == "")
        //            nuevo.Codigo = "N/A";
        //        datos.agregarParametro("@Codigo", nuevo.Codigo);

        //        if (nuevo.Nombre == "")
        //            nuevo.Nombre = "N/A";
        //        datos.agregarParametro("@Nombre", nuevo.Nombre);

        //        if (nuevo.Descripcion == "")
        //            nuevo.Descripcion = "N/A";
        //        datos.agregarParametro("@Descripcion", nuevo.Descripcion);

        //        if (nuevo.Marca != null)
        //            datos.agregarParametro("@Marca", nuevo.Marca.ID.ToString());
        //        else
        //            datos.agregarParametro("@Marca", "1");//deberia haber un id marca en la DB con descripcion N/A

        //        if (nuevo.Categoria != null)
        //            datos.agregarParametro("@Categoria", nuevo.Categoria.ID.ToString());
        //        else
        //            datos.agregarParametro("@Categoria", "1");//deberia haber un id categoria en la DB con descripcion N/A

        //        if (nuevo.ImagenURL == "")
        //            nuevo.ImagenURL = "N/A";
        //        datos.agregarParametro("@ImagenUrl", nuevo.ImagenURL);
        //        datos.agregarParametro("@Precio", nuevo.Precio);

        //        datos.ejecutarAccion();

        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }

        //}

        //public void modificar(Articulo articulo)
        //{
        //    AccesoDatos datos = new AccesoDatos();

        //    try
        //    {
        //        datos.setearQuery("update ARTICULOS set Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion ,IdMarca = @Marca,IdCategoria = @Categoria,ImagenUrl = @ImagenUrl,Precio= @Precio where Id = @Id");
        //        datos.agregarParametro("@Id", articulo.ID);
        //        datos.agregarParametro("@Codigo", articulo.Codigo);
        //        datos.agregarParametro("@Nombre", articulo.Nombre);
        //        datos.agregarParametro("@Descripcion", articulo.Descripcion);
        //        datos.agregarParametro("@Marca", articulo.Marca.ID.ToString());
        //        datos.agregarParametro("@Categoria", articulo.Categoria.ID.ToString());
        //        datos.agregarParametro("@ImagenUrl", articulo.ImagenURL);
        //        datos.agregarParametro("@Precio", articulo.Precio.ToString());
        //        datos.ejecutarAccion();

        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}
        //public void Eliminar(int id)
        //{
        //    AccesoDatos datos = new AccesoDatos();

        //    try
        //    {
        //        datos.setearQuery(" delete from ARTICULOS where id=@Id");
        //        datos.agregarParametro("@Id", id);
        //        datos.ejecutarAccion();


        //    }
        //    catch (Exception ex)
        //    {

        //        throw ex;
        //    }
        //}

    }
}
