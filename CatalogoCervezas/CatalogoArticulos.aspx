<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="CatalogoArticulos.aspx.cs" Inherits="CatalogoCervezas.CatalogoArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-image: url(https://i.pinimg.com/originals/ef/c6/02/efc602081b94ce1e95d9bcae1773995f.jpg); position: sticky;">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" style="color: black; font-weight: bold;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Estilos</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" style="color: black; font-weight: bold;" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Marcas</a>
                </li>
            </ul>
            <div class="input-group mb-3" style="position: center; top: 10px;">
                <input type="text" class="form-control" placeholder="Que cerveza quiero buscar..." aria-label="Recipient's username" aria-describedby="button-addon2">
                <div class="input-group-append">
                    <button class="btn btn-dark" type="button" id="button-addon2">Buscar</button>
                </div>
            </div>
        </div>
    </nav>
    <div class="container-fluid" style="background-image: url(https://cdn.craftbeer.com/wp-content/uploads/2014/09/26201438/Blood-Sweat-Beer-Logo.jpg)">

        <div class="row">
            <div class="col">
                <div class="card-columns" style="margin-left: 5px; margin-right: 5px;">
                    <asp:Repeater runat="server" ID="repetidor">
                        <ItemTemplate>
                            <div class="card bg-light mb-3" style="width: 18rem; max-height: 1500px; max-width: 300px;">
                                <img src="<%#Eval("ImagenUrl") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h3 class="card-title" style="text-align: center;"><%#Eval("Nombre")%></h3>
                                    <h6 class="card-title">Cerveceria: <%#Eval("marca.Nombre")%></h6>
                                    <h6 class="card-title">Estilo: <%#Eval("estilo.Nombre")%></h6>
                                    <h6 class="card-title">ABV: <%#Eval("ABV")%>| IBU:  <%#Eval("IBU")%> </h6>
                                    <p>
                                        <a class="btn btn-secondary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Descripcion</a>
                                        <div class="collapse" id="collapseExample">
                                            <div class="card card-body">
                                                <p class="card-text"><%#Eval("Descripcion")%></p>
                                            </div>
                                        </div>
                                        <div class="card-footer" style="font-weight: bold">Precio: $<%#Eval("Precio")%></div>
                                        <div class="container">
                                            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                                <label class="btn btn-success active">
                                                    <input type="radio" name="options" id="option1" checked>
                                                    Comprar
                                                </label>
                                                <label class="btn btn-danger">
                                                    <input type="radio" name="options" id="option2">
                                                    Favoritos
                                                </label>
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

    <%--    <div class="container-fluid" style="background-image: url(https://cdn.craftbeer.com/wp-content/uploads/2014/09/26201438/Blood-Sweat-Beer-Logo.jpg)">
        <div class="card-columns" style="margin-left: 5px; margin-right: 5px;">
        </div>
    </div>--%>
</asp:Content>
