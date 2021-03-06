﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        public Int64 ID { get; set; }
        public string Nombre { get; set; }
        public Marca marca { get; set; }
        public Estilo estilo { get; set; }
        public string Descripcion { get; set; }
        public float ABV { get; set; }
        public float IBU { get; set; }
        //public float Valoracion { get; set; }
        public int Volumen { get; set; }
        public decimal Precio { get; set; }
        public string ImagenUrl { get; set; }
        public bool Estado { get; set; }
    }
}
