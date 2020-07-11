using System;

namespace Dominio
{
    public class Usuario
    {
        public Int64 ID { get; set; }

        public Domicilo domicilio { get; set; }

        public TipoUsuario tipoUsuario { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public char Sexo { get; set; }

        public int DNI { get; set; }

        public DateTime FechaNac { get; set; }

        public int Telefono { get; set; }

        public string Email { get; set; }

        public string Contraseña { get; set; }

        public bool Estado { get; set; }

      
    }

}
