<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="CarritoWeb.aspx.cs" Inherits="CatalogoCervezas.CarritoWeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav class="navbar navbar-expand-lg navbar-dark" style="background-image: url(https://i.pinimg.com/originals/ef/c6/02/efc602081b94ce1e95d9bcae1773995f.jpg); position: sticky;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <h2 style="text-align: center; font-weight: 600;">Articulos: <%= ContarCarrito()%>  &nbsp;| &nbsp;  TOTAL: $<%= TOTAL()%></h2>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <asp:Repeater runat="server" ID="repetidorCarrito">
            <ItemTemplate>
                <div class="card">
                    <img src="<%#Eval("Articulo.imagenUrl") %>" class="card-img-top" style="display: block; height: 200px; width: 200px; margin-left: auto; margin-right: auto;" alt="<%#Eval("articulo.Nombre")%>">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align: center;"><%#Eval("Articulo.Nombre")%></h5>
                        <p class="card-text" style="text-align: center;"><%#Eval("Articulo.marca.Nombre")%></p>
                        <p class="card-text" style="text-align: center; font-size: large;"><%#Eval("Cantidad")%> x $<%#Convert.ToDouble(Eval("articulo.Precio"))%></p>
                        <p class="card-text" style="text-align: center; font-size: large;">SubTotal: <strong>$<%#Convert.ToDouble(Eval("Articulo.Precio"))*Convert.ToInt32(Eval("Cantidad"))%></strong></p>
                        <div class="container" style="text-align: center; padding: 5px;">
                            <div class="row" style="display: inline-block">
                                <a href="CarritoWeb.aspx?eliminar=<%#Eval("ID")%>" class="btn btn-dark">Eliminar</a>
                                <a href="CarritoWeb.aspx?sumar=<%#Eval("ID")%>" class="btn btn-success" style="border-radius: 25px; font-weight: bold">+ </a>
                                <a href="CarritoWeb.aspx?restar=<%#Eval("ID")%>" class="btn btn-danger" style="border-radius: 25px; font-weight: bold">- </a>
                            </div>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </br>
    <div style="background-color: antiquewhite; border: inset">
        <h2 style="text-align: center; font-weight: 600;">Articulos: <%= ContarCarrito()%>  &nbsp;| &nbsp;  TOTAL: $<%= SubtotalCarrito()%></h2>
    </div>
    <div class="container" style="text-align: center; padding: 5px;">
        <div class="btn-group-lg">
            <a class="btn btn-danger btn-lg " href="CarritoWeb.aspx?eliminarTodo=<%#Eval("ID")%>">Vaciar el Carrito</a>
            <a class="btn btn-info btn-lg " href="CatalogoArticulos.aspx">Volver al Catalogo de articulos</a>
            <a class="btn btn-success btn-lg " href="CarritoWeb.aspx?comprar=<%#Eval("ID")%>">Comprar</a>
        </div>
    </div>
</asp:Content>
