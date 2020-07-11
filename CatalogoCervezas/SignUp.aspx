<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="CatalogoCervezas.SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function validar() {
            //regular expressions
            var regexLetterOnly = /^[a-zA-Z ]+$/;// solo letras y espacios 
            var regexDNI = /^\d{8}(?:[-\s]\d{4})?$/;// DNI 
            var regexEmail = /^([a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})*$/; //Email
            var regexTelefono = /^(?:(?:00)?549?)?0?(?:11|[2368]\d)(?:(?=\d{0,2}15)\d{2})??\d{8}$/; //Telefono (Argentina)
            var completar = false;
            var valido = true;

            //-------------------------------carga de variables------------------------------
            //usuario
            var nombre = document.getElementById("<% = txtNombre.ClientID %>").value;
            var apellido = document.getElementById("<% = txtApellido.ClientID %>").value;
            var DNI = document.getElementById("<% = txtDNI.ClientID %>").value;
            var Email = document.getElementById("<% = txtEmail.ClientID %>").value;
            var Contra = document.getElementById("<% = txtContra.ClientID %>").value;
            var ContraRep = document.getElementById("<% = txtContraRep.ClientID %>").value;
            var FechaNac = document.getElementById("<% = txtFechaNac.ClientID %>").value;
            var Telefono = document.getElementById("<% = txtTelefono.ClientID %>").value;

           <%-- //domicilio
            var ciudad = document.getElementById("<% = txt_ciudad.ClientID%>").value;
            var direccion = document.getElementById("<% = txt_direccion.ClientID%>").value;
            var numero = document.getElementById("<% = txt_numero.ClientID%>").value;
            var piso = document.getElementById("<% = txt_piso.ClientID%>").value;
            var depto = document.getElementById("<% = txt_departamento.ClientID%>").value;
            var CodigoPostal = document.getElementById("<% = txt_codigoPostal.ClientID%>").value;
            var referencia = document.getElementById("<% = txt_referencia.ClientID%>").value;--%>

            //--------------------validaciones------------------------------------
            //nombre
            if (nombre === "") {
                $("#<% = txtNombre.ClientID %>").removeClass("is-valid");
                $("#<% = txtNombre.ClientID %>").addClass("is-invalid");
                completar = true;
                valido = false;
            }
            else if (!regexLetterOnly.test(nombre)) {
                alert("El nombre no puede llevar caracteres especiales ni numeros");
                $("#<% = txtNombre.ClientID %>").removeClass("is-valid");
                $("#<% = txtNombre.ClientID %>").addClass("is-invalid");
                valido = false;
            }
            else {
                $("#<% = txtNombre.ClientID %>").removeClass("is-invalid");
                $("#<% = txtNombre.ClientID %>").addClass("is-valid");
            }
            //apellido
            if (apellido === "") {
                $("#<% = txtApellido.ClientID %>").removeClass("is-valid");
                $("#<% = txtApellido.ClientID %>").addClass("is-invalid");
                completar = true;
                valido = false;
            }
            else if (!regexLetterOnly.test(apellido)) {
                alert("El apellido no puede llevar caracteres especiales ni numeros");
                $("#<% = txtApellido.ClientID %>").removeClass("is-valid");
                $("#<% = txtApellido.ClientID %>").addClass("is-invalid");
                valido = false;
            }
            else {
                $("#<% = txtApellido.ClientID %>").removeClass("is-invalid");
                $("#<% = txtApellido.ClientID %>").addClass("is-valid");
            }
            //DNI
            if (DNI === "") {
                $("#<% = txtDNI.ClientID %>").removeClass("is-valid");
                $("#<% = txtDNI.ClientID %>").addClass("is-invalid");
                completar = true;
                valido = false;
            }
            else if (!regexDNI.test(DNI)) {
                alert("El DNI ingresado no es valido");
                $("#<% = txtDNI.ClientID %>").removeClass("is-valid");
                $("#<% = txtDNI.ClientID %>").addClass("is-invalid");
                valido = false;
            }
            else {
                $("#<% = txtDNI.ClientID %>").removeClass("is-invalid");
                $("#<% = txtDNI.ClientID %>").addClass("is-valid");
            }
            //Email
            if (Email === "") {

                $("#<% = txtEmail.ClientID %>").removeClass("is-valid");
                $("#<% = txtEmail.ClientID %>").addClass("is-invalid");
                completar = true;
                valido = false;
            }
            else if (!regexEmail.test(Email)) {
                alert("El Email ingresado no es valido");
                $("#<% = txtEmail.ClientID %>").removeClass("is-valid");
                $("#<% = txtEmail.ClientID %>").addClass("is-invalid");
                valido = false;
            }
            else {
                $("#<% = txtEmail.ClientID %>").removeClass("is-invalid");
                $("#<% = txtEmail.ClientID %>").addClass("is-valid");
            }

            //FechaNac
            if (FechaNac === "") {

                $("#<% = txtFechaNac.ClientID %>").removeClass("is-valid");
                $("#<% = txtFechaNac.ClientID %>").addClass("is-invalid");
                completar = true;
                valido = false;
            }
            else {
                $("#<% = txtFechaNac.ClientID %>").removeClass("is-invalid");
                $("#<% = txtFechaNac.ClientID %>").addClass("is-valid");
            }

            //Telefono
            if (Telefono === "") {

                $("#<% = txtTelefono.ClientID %>").removeClass("is-valid");
                $("#<% = txtTelefono.ClientID %>").addClass("is-invalid");
                completar = true;
                valido = false;
            }
            else if (!regexTelefono.test(Telefono)) {
                alert("EL numero de telefono celular no es valido");
                $("#<% = txtTelefono.ClientID %>").removeClass("is-valid");
                $("#<% = txtTelefono.ClientID %>").addClass("is-invalid");
                valido = false;
            }
            else {
                $("#<% = txtTelefono.ClientID %>").removeClass("is-invalid");
                $("#<% = txtTelefono.ClientID %>").addClass("is-valid");
            }

            //sexo
            var masculino = document.getElementById("<%= cbMasculino.ClientID %>");
            var femenino = document.getElementById("<%= cbFemenino.ClientID %>");
            
            if (!femenino.checked && !masculino.checked) {

                completar = true;
                valido = false;
            }

            if (completar) {
                alert("Debes completar los campos");
            }

            if (!valido) {
                return false;
            }

            return true;
        }

    </script>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <h1 style="text-align: center; background-color: #eadbdb; border-style: ridge">Registro de Usuario</h1>
    <div class="container">
        <form class="needs-validation">
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
                    <asp:CheckBox CssClass="custom-checkbox"  Text=" Masculino" runat="server" ID="cbMasculino" OnCheckedChanged="cbMasculino_CheckedChanged" AutoPostBack="true" />
                    <br />
                    <asp:CheckBox CssClass="custom-checkbox"  Text=" Femenino" runat="server" ID="cbFemenino" OnCheckedChanged="cbFemenino_CheckedChanged" AutoPostBack="true" />
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
                    <asp:Button Text="Cargar Formulario" ID="btnSubmit3" OnClientClick="return validar()" OnClick="btnSubmit3_Click" title="Pulse para enviar formulario" CssClass="btn btn-primary" runat="server" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
