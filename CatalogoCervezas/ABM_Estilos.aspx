<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="ABM_Estilos.aspx.cs" Inherits="CatalogoCervezas.ABM_Estilos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <h1 style="margin-bottom: 0; background-image: url(https://i.pinimg.com/originals/ef/c6/02/efc602081b94ce1e95d9bcae1773995f.jpg); text-align: center">ABM de Articulos</h1>
        <div style="background-color: black">
            <a id="btnAgregarArticulo" href="Form_Alta_Articulo.aspx?modificar="" class="btn btn-warning btn-lg btn-block" title="Pulse para agregar un nuevo articulo" style="font-weight: 600; border-color: black">Agregar nuevo Articulo</a>

        </div>
        <asp:Repeater runat="server" ID="repetidor">
            <HeaderTemplate>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">MODIFICAR</th>
                            <th scope="col">ELIMINAR</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <th scope="row"><%#Eval("ID")%></th>
                    <td><%#Eval("Nombre")%></td>
                    <td>
                        <a id="btnmodificar"  href="Form_Alta_Articulo.aspx?modificarEstilo=<%#Eval("ID")%>" class="btn btn-primary" title="pulse para modificar el articulo">Modificar</a>
                    </td>
                    <td>
                        <a id="btnEliminar" href="ABM_Articulos.aspx?eliminarEstilo=<%#Eval("ID")%>" class="btn btn-danger" title="pulse para eliminar el articulo">Eliminar</a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
        </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
