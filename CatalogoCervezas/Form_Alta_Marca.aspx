<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Form_Alta_Marca.aspx.cs" Inherits="CatalogoCervezas.Form_Alta_Marca" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1 style="text-align: center; background-color: #eadbdb; border-style: ridge">Formulario de carga de Marcas </h1>
    <div class="container">
        <form class="needs-validation" novalidate>
            <%--Nombre--%>
            <div class="form-row">
                <div class="col-md-6 mb-2">
                    <label>Nombre de la Marca</label>
                    <asp:TextBox runat="server" ID="txt_nombre" CssClass="form-control" placeholder="Inserte un Nombre" />
                </div>
                <%--Direccion--%>
                <div class="col-md-6 mb-2 ">
                    <label>Direccion:</label>
                    <asp:TextBox runat="server" ID="txt_direccion" CssClass="form-control" placeholder="Inserte una direccion" />
                </div>
            </div>
            <div class="form-row">
                <%--numero--%>
                <div class="col-md-2 mb-2">
                    <label>Numero </label>
                    <asp:TextBox runat="server" ID="txt_numero" CssClass="form-control" placeholder="ej 2330" />
                </div>
                <%--piso--%>
                <div class="col-md-2 mb-2">
                    <label>Piso </label>
                    <asp:TextBox runat="server" ID="txt_piso" CssClass="form-control" placeholder="Piso" />
                </div>
                <%--depto--%>
                <div class="col-md-2 mb-2">
                    <label>Departamento </label>
                    <asp:TextBox runat="server" ID="txt_departamento" CssClass="form-control" placeholder="Depto" />
                </div>
            </div>
            <div class="form-row">
                <%--Provincia--%>
                <div class="col-md-3 mb-2">
                    <label>Seleccione una Provincia</label>
                    <asp:DropDownList CssClass="custom-select" ID="ddlProvincia" runat="server">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <%--ciudad--%>
                <div class="col-md-6 mb-2">
                    <label>Ciudad</label>
                    <asp:TextBox runat="server" ID="txt_ciudad" CssClass="form-control" placeholder="Ciudad de Origen" />
                </div>
                <%--Codigo Postal--%>
                <div class="col-md-3 mb-2">
                    <label>Codigo Postal </label>
                    <asp:TextBox runat="server" ID="txt_codigoPostal" CssClass="form-control" placeholder="Codigo Postal"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <%--referencia--%>
                <div class="col-md-8 mb-2">
                    <label>Referencia </label>
                    <asp:TextBox runat="server" ID="txt_referencia" CssClass="form-control" placeholder="Inserte una referencia"></asp:TextBox>
                </div>
            </div>
            <%--boton Cargar--%>
            <div class="form form-row">
                <div class="col-md-6 mb-2">
                    <br />
                    <asp:Button Text="Cargar Formulario" Onclick="CargarC" ID="btnSubmit3" title="Pulse para enviar formulario" class="btn btn-primary" runat="server" />
                </div>
            </div>

        </form>
    </div>
</asp:Content>
