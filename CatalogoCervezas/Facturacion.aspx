﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Facturacion.aspx.cs" Inherits="CatalogoCervezas.Facturacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <%--<asp:Panel ID="panelPDF" runat="server">--%>
    <div class="container" style="border: groove">
        <div class="container">
            <h1>Catalogo de Cervezas 2020 <span class="badge badge-warning">Factura Electronica</span> </h1>
            <h5><span class="badge badge-secondary">Av. santa fe 1890 - Palermo, Ciudad Autonoma de Buenos Aires</span></h5>
        </div>
        <br />
        <%-------------------------------------------------------DOMICILIO-----------------------------------------------------------%>
        <div class="container" style="border: ">
            <h5>Fecha: <% = venta.fecha %></h5>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="background-color: #b9b6b6">
                    <h2>Direccion de Entrega</h2>
                </div>
                <div class="col-md-6 mb-1" style="background-color: #d4d2d2">
                    <h2>Datos del Comprador</h2>
                </div>
            </div>
            <%--ciudad--%>
            <div class="form-row">
                <div class="col-md-6 mb-1">
                    <label class="badge badge-warning">Ciudad:</label>
                    <asp:Label runat="server" ID="lb_ciudad" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.Ciudad %></asp:Label>
                </div>
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-info">Nombre:</label>
                    <asp:Label runat="server" ID="lb_nombre" CssClass="text-black-50" Readonly="true"><% = venta.usuario.Nombre %></asp:Label>

                </div>
            </div>
            <%--Provincia--%>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-warning">Provincia:</label>
                    <asp:Label runat="server" ID="lb_provincia" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.provincia.Nombre %></asp:Label>
                </div>
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-info">Apellido:</label>
                    <asp:Label runat="server" ID="lb_apellido" CssClass="text-black-50" Readonly="true"><% = venta.usuario.Apellido %></asp:Label>

                </div>
            </div>
            <%--direccion--%>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-warning">Direccion:</label>
                    <asp:Label runat="server" ID="lb_direccion" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.Calle %></asp:Label>&nbsp;
            <%--altura--%>
                    <label>- </label>
                    &nbsp;
                <asp:Label runat="server" ID="lb_altura" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.NumeroAltura %></asp:Label>
                </div>
                <div class="col-md-6 mb-1">
                    <label class="badge badge-info">Telefono:</label>
                    <asp:Label runat="server" ID="lb_telefono" CssClass="text-black-50" Readonly="true"><% = venta.usuario.Telefono %></asp:Label>
                </div>
            </div>
            <%--piso/depto--%>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-warning">Piso:</label>
                    <asp:Label runat="server" ID="lb_piso" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.Piso %></asp:Label>
                </div>
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-info">Email:</label>
                    <asp:Label runat="server" ID="Label3" CssClass="text-black-50" Readonly="true"><% = venta.usuario.Email %></asp:Label>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-warning">Depto:</label>
                    <asp:Label runat="server" ID="lb_depto" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.Depto %></asp:Label>
                </div>
                <div class="col-md-6 mb-1" style="border: ">
                </div>
            </div>
            <%--codigo postal--%>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-warning">Codigo Postal:</label>
                    <asp:Label runat="server" ID="lb_codigoPostal" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.codigoPostal %></asp:Label>&nbsp
                </div>
                <div class="col-md-6 mb-1">
                </div>
            </div>
            <%--referencia--%>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="border: ">
                    <label class="badge badge-warning">Referencia:</label>
                    <asp:Label runat="server" ID="lb_referencia" CssClass="text-black-50" Readonly="true"><% = venta.usuario.domicilio.Referencia %></asp:Label>&nbsp
                </div>
                <div class="col-md-6 mb-1" style="border: ">
                </div>
            </div>
        </div>
        <%--------------------------------------LISTA ITEMS-------------------------------------------%>
        <div class="container" style="border: ">
            <div class="form-row">
                <div class="col-md-12 mb-1" style="background-color: #b9b6b6">
                    <h3>Detalle de la compra:</h3>
                </div>
            </div>
            <div class="panel panel-default">
                <asp:Repeater runat="server" ID="repetidor">
                    <HeaderTemplate>
                        <table class="table">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Marca</th>
                                    <th scope="col">Estilo</th>
                                    <th scope="col">Cantidad</th>
                                    <th scope="col">Precio Unitario</th>
                                    <th scope="col">Monto</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("Articulo.Nombre")%></td>
                            <td><%#Eval("Articulo.marca.Nombre")%></td>
                            <td><%#Eval("Articulo.estilo.Nombre")%></td>
                            <td><%#Eval("Cantidad")%></td>
                            <td>$ <%#Convert.ToDouble(Eval("Articulo.Precio"))%></td>
                            <td>$ <%#Convert.ToDouble(Eval("Articulo.Precio"))*Convert.ToInt32(Eval("Cantidad"))%></td>

                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                         </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="form-row">
                <div class="col-md-6 mb-1" style="border: ">
                </div>

                <div class="col-md-6 mb-1" style="background-color: lightcyan">
                    <h5>Descuento:
                        <asp:Label runat="server" ID="Label5" Readonly="true" CssClass="text-black-50">$ <% = venta.Descuento1 %></asp:Label></h5>
                </div>
                <div class="col-md-6 mb-1" style="border: ">
                </div>

                <div class="col-md-6 mb-1" style="background-color: lightcyan">
                    <h5>SubTotal:
                        <asp:Label runat="server" ID="Label2" Readonly="true" CssClass="text-black-50">$ <% = venta.Descuento1 + venta.Total %></asp:Label></h5>
                </div>
                <div class="col-md-6 mb-1" style="border: ">
                </div>
                <div class="col-md-6 mb-1" style="background-color: lightblue">
                    <h3>Total: 
                        <asp:Label runat="server" ID="Label1" Readonly="true"> $ <% = venta.Total %></asp:Label></h3>
                </div>
            </div>
        </div>
    </div>
    <br />
    <%--</asp:Panel>--%>
    <%--<asp:Button runat="server" ID="btnPrint" Text="Print" OnClick="btnPrint_Click" />--%>
    <div class="container" style="text-align: center">
        <asp:Button Text="Volver al Catalogo de articulos"  runat="server" OnClick="volver_Click" CssClass="btn btn-info btn-lg" />
        <%--<a class="btn btn-info btn-lg " href="CatalogoArticulos.aspx">Volver al Catalogo de articulos</a>--%>
    </div>
    <br />

</asp:Content>
