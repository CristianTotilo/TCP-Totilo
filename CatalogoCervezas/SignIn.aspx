<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="CatalogoCervezas.SignIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <form class="needs-validation">
             <h1>Inicio de Sesion</h1>
            <div class="form form-row">
                <div class="col-md-6 mb-2">
                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="form-control" placeholder="Usuario" required="" />
                    <p class="small">Ingrese el mail con el que se encuentra registrado.</p>
                </div>
            </div>
            <div class="form form-row">
                <div class="col-md-6 mb-2">
                    <asp:TextBox runat="server" ID="txtPass" CssClass="form-control" TextMode="Password" placeholder="Password" required="" />
                </div>
            </div>
            <div class="form form-row">
                <div class="col-md-6 mb-2">
                    <asp:Button Text="Ingresar" runat="server" CssClass="btn btn-lg btn-primary" ID="btnIngresar" OnClick="btnIngresar_Click" />
                </div>
            </div>
        </form>
        <a href="SignUp.aspx">No estas registrado? Presiona este link para hacerlo!</a>
        <p class="small">Si no estas registrado no podras realizar compras ya que necesitaremos tus datos personales para poder llevarlas a cabo.</p>
    </div>
</asp:Content>
