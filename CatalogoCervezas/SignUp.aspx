<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CatalogoCervezas.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1 style="text-align: center; background-color: #eadbdb; border-style: ridge">Registro de Usuario</h1>
    <div class="container">
        <form class="needs-validation" novalidate>
            <h1>Datos Personales:</h1>
            <%--Nombre--%>
            <div class="form-row">
                <div class="col-md-4 mb-2">
                    <label>Nombre de usuario</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" placeholder="Introduzca sus Nombres" />
                </div>
                <%--Apellido--%>
                <div class="col-md-4 mb-2 ">
                    <label>Apellido:</label>
                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" placeholder="Introduzca sus Apellidos" />
                </div>
            </div>
            <div class="form-row">
                <%--DNI--%>
                <div class="col-md-2 mb-2">
                    <label>DNI</label>
                    <asp:TextBox runat="server" ID="txtDNI" CssClass="form-control" placeholder="Introduzca su DNI" />
                </div>
                <%--FechaNac--%>
                <div class="col-md-2 mb-2">
                    <label>Fecha de Nacimiento </label>
                    <asp:TextBox TextMode="Date" runat="server" ID="txtFechaNac" CssClass="form-control" />
                </div>
                <%--Telefono--%>
                <div class="col-md-2 mb-3">
                    <label>Telefono </label>
                    <asp:TextBox TextMode="Phone" runat="server" ID="txtTelefono" CssClass="form-control" Placeholder="11-12345678" />
                </div>
                <%--Sexo--%>
                <div class="col-md-3 mb-2 ">
                    <label>Sexo:</label>
                    <br />
                    <asp:CheckBox CssClass="custom-checkbox" Text=" Masculino" runat="server" ID="cbMasculino" OnCheckedChanged="cbMasculino_CheckedChanged" AutoPostBack="true" />
                    <br />
                    <asp:CheckBox CssClass="custom-checkbox" Text=" Femenino" runat="server" ID="cbFemenino" OnCheckedChanged="cbFemenino_CheckedChanged" AutoPostBack="true" />
                </div>
            </div>
            <div class="form-row">
                <%--Email--%>
                <div class="col-md-6 mb-3">
                    <label>Email </label>
                    <asp:TextBox TextMode="Email" runat="server" ID="txtEmail" CssClass="form-control" Placeholder="ejemplo@gmail.com" />
                </div>
            </div>
            <div class="form-row">
                <%--Contraseña--%>
                <div class="col-md-4 mb-2">
                    <label>Introduzca su Contraseña</label>
                    <asp:TextBox TextMode="Password" runat="server" ID="txtContra" CssClass="form-control" />
                </div>
                <%--Contraseña rep--%>
                <div class="col-md-4 mb-2">
                    <label>Repita su Contraseña</label>
                    <asp:TextBox TextMode="Password" runat="server" ID="txtContraRep" CssClass="form-control" />
                </div>
            </div>
            <h1>Datos del Domicilio:</h1>
            <div class="form-row">
                <%--ciudad--%>
                <div class="col-md-6 mb-2">
                    <label>Ciudad</label>
                    <asp:TextBox runat="server" ID="txt_ciudad" CssClass="form-control" placeholder="Ciudad de Origen" />
                </div>
            </div>
            <div class="form-row">
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
                <%--Codigo Postal--%>
                <div class="col-md-3 mb-2">
                    <label>Codigo Postal </label>
                    <asp:TextBox runat="server" ID="txt_codigoPostal" CssClass="form-control" placeholder="Codigo Postal"></asp:TextBox>
                </div>
            </div>
            <div class="form-row">
                <%--referencia--%>
                <div class="col-md-6 mb-2">
                    <label>Referencia </label>
                    <asp:TextBox runat="server" ID="txt_referencia" CssClass="form-control" placeholder="Inserte una referencia"></asp:TextBox>
                </div>
            </div>
            <%--boton Cargar--%>
            <div class="form form-row">
                <div class="col-md-6 mb-2">
                    <br />
                    <asp:Button Text="Cargar Formulario" OnClick="btnSubmit3_Click" ID="btnSubmit3" title="Pulse para enviar formulario" class="btn btn-primary" runat="server" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
