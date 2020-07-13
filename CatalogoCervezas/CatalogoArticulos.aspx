<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="CatalogoArticulos.aspx.cs" Inherits="CatalogoCervezas.CatalogoArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-image: url(https://i.pinimg.com/originals/ef/c6/02/efc602081b94ce1e95d9bcae1773995f.jpg);">

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" style="color: black; font-weight: bold;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Estilos</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%foreach (var estilo in listaEstilos)
                            {%>
                        <a class="dropdown-item" href="CatalogoArticulos.aspx?filtroEstilo=<%= estilo.ID%>"><%= estilo.Nombre%></a>
                        <%}%>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" style="color: black; font-weight: bold;" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Marcas</a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%foreach (var marca in listaMarcas)
                            {%>
                        <a class="dropdown-item" href="CatalogoArticulos.aspx?filtroMarca=<%= marca.ID%>"><%= marca.Nombre%></a>
                        <%}%>
                    </div>
                </li>
                <li class="nav-item">
                    <asp:TextBox CssClass="form-control" ID="txt_Buscar" runat="server"></asp:TextBox>
                </li>
                <li class="nav-item">
                    <asp:Button CssClass="btn btn-dark" Font-Bold="true" ID="btnBuscar" runat="server" Text="Buscar" OnClick=" btnBuscar_Click" />
                </li>
            </ul>
        </div>
    </nav>

    <div class="container-fluid" style="background-image: url(https://cdn.craftbeer.com/wp-content/uploads/2014/09/26201438/Blood-Sweat-Beer-Logo.jpg)">
        <div class="row">
            <div class="col">
                <div class="card-columns" style="margin-left: 5px; margin-right: 5px;">
                    <asp:Repeater runat="server" ID="repetidor">
                        <ItemTemplate>
                            <div class="card bg-light mb-3" style="width: 350px; max-height: 1500px; max-width: 500px; margin-left: auto; margin-right: auto;">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h3 class="card-title" style="text-align: center;"><%#Eval("Nombre")%></h3>
                                    <p class="card-text" style="text-align: center; font-size: large;">Cerveceria: <%#Eval("marca.Nombre")%></p>
                                    <p class="card-text" style="text-align: center; font-size: large;">Estilo: <%#Eval("estilo.Nombre")%></p>
                                    <p class="card-text" style="text-align: center; font-size: large;">ABV: <%#Eval("ABV")%> &nbsp;|&nbsp; IBU:  <%#Eval("IBU")%> </p>
                                    <div class="container" style="text-align: center; padding: 5px;">
                                        <a class="btn btn-secondary" data-toggle="collapse" href="#collapseExample" role="button">Descripcion: </a>
                                        <div class="collapse" id="collapseExample">
                                            <div class="card card-body" style="text-align:center">
                                                <p class="card-text"><%#Eval("Descripcion")%></p>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="container" style="text-align: center; padding: 5px;">
                                    <h4 class="card-title" style="text-align: center;">Precio: $<%#Eval("Precio")%></h4>
                                         </div>
                                    <div class="container">
                                        <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                            <a class="btn btn-warning" style="color: black; font-weight: bold;" href="CarritoWeb.aspx?idsum=<%#Eval("ID") %>">Agregar al carrito</a>
                                            <a class="btn btn-success" style="font-weight: bold;" href="CatalogoArticulos.aspx?idfav=<%#Eval("ID") %>">Agregar a favoritos</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
