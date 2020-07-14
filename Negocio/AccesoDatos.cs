using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    class AccesoDatos
    {
        public SqlDataReader lector { get; set; }
        public SqlConnection  conexion { get; }
        public SqlCommand comando { get; set; }

        public AccesoDatos()
        {
            conexion = new SqlConnection("data source=DESKTOP-TL0O0F7\\SQLEXPRESS; initial catalog=TOTILO_DB; integrated security=sspi");
            comando = new SqlCommand();
            comando.Connection = conexion;
        }
        public char GetAChar(SqlDataReader rd, int column)
        {
            char[] value = new char[1];
            long charCount = (long)rd.GetChars(column, 0, value, 0, value.Length);
            if (charCount != value.Length) throw new InvalidOperationException();
            return value[0];

        }
        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void ClearParameters()
        {
            comando.Parameters.Clear();
        }

        public void setearSP(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }

        public void agregarParametro ( string Nombre, object valor)
        {
            comando.Parameters.AddWithValue(Nombre, valor);
        }

        public void ejecutarLector()
        {
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }

        public void cerrarConexion()
        {
            conexion.Close();
        }

        internal void ejecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}
