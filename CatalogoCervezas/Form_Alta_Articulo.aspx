<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="Form_Alta_Articulo.aspx.cs" Inherits="CatalogoCervezas.Form_Alta_Articulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <form class="needs-validation" novalidate>
            <%--Nombre--%>
            <div class="form-row">
                <div class="col-md-6 ">
                    <label>Nombre del Articulo</label>
                    <asp:TextBox runat="server" ID="txt_nombre" CssClass="form-control" placeholder="Inserte un Nombre" />
                </div>
                <%--Estilo--%>
                <div class="col-md-3 mb-3">
                    <label>Seleccione un Estilo</label>
                    <asp:DropDownList CssClass="custom-select" ID="ddlEstilos"  runat="server">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <%--marca--%>
                <div class="col-md-3 mb-3">
                    <label>Seleccione una Marca</label>
                    <asp:DropDownList CssClass="custom-select" ID="ddlMarcas"  runat="server">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <%--Descripcion--%>
            <div class="form-row">
                <div class="col-md-6">
                    <label>Descripcion</label>
                    <%--<textarea id="txt_descripciona" runat="server" placeholder="Inserte una Descripcion"  rows="4"  Class="form-control">  </textarea>--%>
                    <asp:TextBox  runat="server" ID="txt_descripcion"  CssClass="form-control" placeholder="Inserte una Descripcion"  />
                </div>
                <%--ABV--%>
                <div class="col-md-2">
                    <label>ABV </label>
                    <asp:TextBox runat="server" ID="txt_ABV" CssClass="form-control" placeholder="% alcohol" />
                </div>
                <%--IBU--%>
                <div class="col-md-2 ">
                    <label>IBU </label>
                    <asp:TextBox runat="server" ID="txt_IBU" CssClass="form-control" placeholder="% amargura" />
                </div>
                <%--Volumen--%>
                <div class="col-md-1">
                    <label>Volumen </label>
                    <asp:TextBox runat="server" ID="txt_volumen" CssClass="form-control" placeholder="0000" />
                </div>
                <%--Precio--%>
                <div class="col-md-1">
                    <label>Precio </label>
                    <asp:TextBox runat="server" ID="txt_precio" CssClass="form-control"  placeholder="0000.00"></asp:TextBox>
                </div>
            </div>
            <%--ImagenURL--%>
            <div class="form-row">
                <div class="col-md-6 ">
                    <label>URL de la imagen del articulo </label>
                    <asp:TextBox runat="server" TextMode="Url" ID="txt_URLimagen" CssClass="form-control" placeholder="Inserte la url de la imagen del producto" />
                </div>
            </div>
            <%--boton Cargar--%>
            <div class="form form-row">
                <div class="col-md-6 ">
                    <br />
                    <asp:Button Text="Enviar Formulario" OnClick="Cargar"  id="btnSubmit" title="Pulse para enviar formulario" class="btn btn-primary" runat="server" />
                </div>
            </div>

        </form>
    </div>

</asp:Content>
