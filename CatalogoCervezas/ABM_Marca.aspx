<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="ABM_Marca.aspx.cs" Inherits="CatalogoCervezas.ABM_Marca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="panel panel-default">
        <h1 style="margin-bottom: 0; background-image: url(https://i.pinimg.com/originals/ef/c6/02/efc602081b94ce1e95d9bcae1773995f.jpg); text-align: center">ABM de Marcas</h1>
        <div style="background-color: black">
            <a id="btnAgregarMarca" href="Form_Alta_Marca.aspx?modificarMarca="" class="btn btn-warning btn-lg btn-block" title="Pulse para agregar una nueva Marca" style="font-weight: 600; border-color: black">Agregar nueva Marca</a>

        </div>
        <asp:Repeater runat="server" ID="repetidor">
            <HeaderTemplate>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Ciudad</th>
                            <th scope="col">Domicilio:</th>
                            <th scope="col">Provincia</th>
                            <th scope="col">Numero</th>
                            <th scope="col">Piso</th>
                            <th scope="col">Depto</th>
                            <th scope="col">Referencia</th>
                            <th scope="col">Codigo Postal</th>
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
                    <td><%#Eval("domicilio.Ciudad")%></td>
                    <td><%#Eval("domicilio.Calle")%></td>
                    <td><%#Eval("domicilio.provincia.Nombre")%></td>
                    <td><%#Eval("domicilio.NumeroAltura")%></td>
                    <td><%#Eval("domicilio.Piso")%></td>
                    <td><%#Eval("domicilio.Depto")%></td>
                    <td><%#Eval("domicilio.Referencia")%></td>
                    <td><%#Eval("domicilio.codigoPostal")%></td>
                    <td>
                        <a id="btnmodificar"  href="Form_Alta_Marca.aspx?modificarMarca=<%#Eval("ID")%>" class="btn btn-primary" title="pulse para modificar la marca">Modificar</a>
                    </td>
                    <td>
                        <a id="btnEliminar" href="ABM_Marca.aspx?eliminarMarca=<%#Eval("ID")%>" class="btn btn-danger" title="pulse para eliminar la marca">Eliminar</a>
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
