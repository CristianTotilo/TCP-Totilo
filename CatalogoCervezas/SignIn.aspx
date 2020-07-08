<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="CatalogoCervezas.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <form class="needs-validation" >
            <div>
                <%--<img class="mb-4" src="/docs/4.5/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">--%>
                <h1 class="h3 mb-3 font-weight-normal">Login</h1>
                <div class="form-group">
                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" placeholder="Usuario" required="" />
                    </br>
                    <%--<asp:RegularExpressionValidator ErrorMessage="Ingrese un mail valido" ControlToValidate="txtUsuario" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/>--%>
                    <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" placeholder="Password" required="" />
                </div>
                </br>
                <asp:Button Text="Ingresar" runat="server" CssClass="btn btn-lg btn-primary" ID="btnIngresar" OnClick="btnIngresar_Click" />
            </div>

        </form>
    </div>
</asp:Content>
