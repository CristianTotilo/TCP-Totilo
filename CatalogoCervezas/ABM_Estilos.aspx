<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="ABM_Estilos.aspx.cs" Inherits="CatalogoCervezas.ABM_Estilos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel panel-default">
        <h1 style="margin-bottom: 0; background-image: url(https://i.pinimg.com/originals/ef/c6/02/efc602081b94ce1e95d9bcae1773995f.jpg); text-align: center">ABM de Estilos</h1>
        <div style="background-color: black">
            <a id="btnAgregarEstilo" href="Form_Alta_Estilo.aspx?modificarEstilo="" class="btn btn-warning btn-lg btn-block" title="Pulse para agregar un nuevo estilo" style="font-weight: 600; border-color: black">Agregar nuevo Estilo</a>

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
                        <a id="btnmodificar"  href="Form_Alta_Estilo.aspx?modificarEstilo=<%#Eval("ID")%>" class="btn btn-primary" title="pulse para modificar el estilo">Modificar</a>
                    </td>
                    <td>
                        <a id="btnEliminar" href="ABM_Estilos.aspx?eliminarEstilo=<%#Eval("ID")%>" class="btn btn-danger" title="pulse para eliminar el estilo">Eliminar</a>
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
