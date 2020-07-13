using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {
        public string ID { get; set; }
        public int CantidadItems { get; set; }
        public List<Item> listaItems { get; set; }


        public Carrito()
        {
            List<Item> lista = new List<Item>();
            listaItems = lista;
        }
        public double preciosubTotal()
        {
            double subtotal = 0;
            foreach (var item in listaItems)
            {
                subtotal += item.precio();
            }
            return subtotal;
        }
        public void agregarItem(Articulo articulo)
        {
            Item newItem = new Item();
            bool flag = true;
            if (CantidadItems == 0)
            {
                newItem.ID = articulo.ID;
                newItem.Articulo = articulo;
                newItem.Cantidad += 1;
                listaItems.Add(newItem);
            }
            else
            {
                foreach (var item in listaItems)
                {
                    if (item.ID == articulo.ID)
                    {
                        flag = false;
                        item.Cantidad += 1;
                    }
                }
                if (flag)
                {
                    newItem.ID = articulo.ID;
                    newItem.Articulo = articulo;
                    newItem.Cantidad += 1;
                    listaItems.Add(newItem);
                }
            }
        }
        public int getCantidad()
        {
            int cantidad = 0;
            foreach (var item in listaItems)
            {
                cantidad += item.Cantidad;
            }
            return cantidad;
        }

        public void sumarItem(int ID)
        {
            foreach (var item in listaItems)
            {
                if (item.ID == ID)
                {
                    item.Cantidad += 1;
                    return;
                }
            }
        }  
        public void restarItem(int ID)
        {
            foreach (var item in listaItems)
            {
                if (item.ID == ID)
                {
                    item.Cantidad -= 1;
                    if(item.Cantidad <= 0)
                    {
                        listaItems.Remove(item);
                    }
                    return;
                }
            }
        } 
        public void eliminarItem(int ID)
        {
            foreach (var item in listaItems)
            {
                if (item.ID == ID)
                {
                    listaItems.Remove(item);
                    return;
                }
            }
        }
        public void eliminatTodo()
        {
            listaItems.Clear();
        }
    }
}
