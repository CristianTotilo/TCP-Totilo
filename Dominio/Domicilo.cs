using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Domicilo
    {
        public Int64 ID { get; set; }
        public Provincia provincia { get; set; }
        public string Ciudad { get; set; }
        public string Calle { get; set; }
        public int NumeroAltura { get; set; }
        public int Piso { get; set; }
        public char Depto { get; set; }
        public string Referencia { get; set; }

    }
}
