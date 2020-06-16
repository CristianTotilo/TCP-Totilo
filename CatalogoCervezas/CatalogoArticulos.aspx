<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="CatalogoArticulos.aspx.cs" Inherits="CatalogoCervezas.CatalogoArticulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="Default.aspx">Catalogo de Articulos 2020</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="Carrito.aspx">Carrito <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CatalogoArticulos.aspx">Ver catalogo</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Categorias</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Marcas</a>
                </li>
            </ul>
        </div>
    </nav>


    <div class="container-fluid" style="background-image: url(https://cdn.craftbeer.com/wp-content/uploads/2014/09/26201438/Blood-Sweat-Beer-Logo.jpg)">
        <div class="card-columns" style="margin-left: 10px; margin-right: 10px;">
            <asp:Repeater runat="server" ID="repetidor">
                <ItemTemplate>
                    <div class="card bg-light mb-3" style="width: 18rem; max-height: 800px; max-width: 300px;">
                        <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval("Nombre")%></h5>
                            <h6 class="card-title">Cerveceria: <%#Eval("marca.Nombre")%></h6>
                            <h6 class="card-title">Estilo: <%#Eval("estilo.Nombre")%></h6>
                            <h6 class="card-title">ABV: <%#Eval("ABV")%>| IBU:  <%#Eval("IBU")%> </h6>
                            <h6 class="card-title"><%#Eval("Descripcion")%></h6>
                            <h6 class="card-title">Precio: $<%#Eval("Precio")%></h6>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
