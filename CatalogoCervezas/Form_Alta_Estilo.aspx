<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Form_Alta_Estilo.aspx.cs" Inherits="CatalogoCervezas.Form_Alta_Estilo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <h1 style="text-align:center; background-color:#eadbdb; border-style:ridge"> Formulario de carga de Estilos </h1>
    <div class="container">
        <form class="needs-validation" novalidate>
            <%--Nombre--%>
            <div class="form-row">
                <div class="col-md-6 mb-2">
                    <label>Nombre del Estilo</label>
                    <asp:TextBox runat="server" ID="txt_nombre" CssClass="form-control" placeholder="Inserte un Nombre" />
                </div>
            </div>
            <%--boton Cargar--%>
            <div class="form form-row">
                <div class="col-md-6 mb-2 ">
                    <br />
                    <asp:Button Text="Cargar Formulario" OnClick="CargarB" ID="btnSubmit2" title="Pulse para enviar formulario" class="btn btn-primary" runat="server" />
                </div>
            </div>
        </form>
    </div>
</asp:Content>
