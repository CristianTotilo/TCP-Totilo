<%@ Page Title="" Language="C#" MasterPageFile="~/MasterSite.Master" AutoEventWireup="true" CodeBehind="ABM_Articulos.aspx.cs" Inherits="CatalogoCervezas.ABM_Articulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="panel panel-default">
        <h1 style="margin-bottom: 0; background-image: url(https://i.pinimg.com/originals/ef/c6/02/efc602081b94ce1e95d9bcae1773995f.jpg); text-align: center">ABM de Articulos</h1>
        <div style="background-color: black">
            <a id="btnAgregarArticulo" href="Form_Alta_Articulo.aspx?modificar="" class="btn btn-warning btn-lg btn-block" title="Pulse para agregar un nuevo articulo" style="font-weight: 600; border-color: black">Agregar nuevo Articulo</a>

        </div>
        <asp:Repeater runat="server" ID="repetidor">
            <HeaderTemplate>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Marca</th>
                            <th scope="col">Estilo</th>
                            <th scope="col">ABV</th>
                            <th scope="col">IBU</th>
                            <th scope="col">Volumen</th>
                            <th scope="col">Precio</th>
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
                    <td><%#Eval("marca.Nombre")%></td>
                    <td><%#Eval("estilo.Nombre")%></td>
                    <td><%#Eval("ABV")%></td>
                    <td><%#Eval("IBU")%></td>
                    <td><%#Eval("Volumen")%>ml</td>
                    <td>$ <%#Eval("Precio")%></td>
                    <td>
                        <%--<a href="ABM_Articulos.aspx?eliminar=<%#Eval("ID")%>" class="btn btn-primary" title="Pulse para modificar el articulo">Modificar</a>--%>
                        <a id="btnmodificar"  href="Form_Alta_Articulo.aspx?modificar=<%#Eval("ID")%>" <%--data-toggle="ModalModificar"--%> class="btn btn-primary" title="pulse para modificar el articulo">Modificar</a>
                        <%--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Modificar</button>--%>
                        <%--<input class="btnmodificar" type="button" value="Edit" />--%>
                    </td>
                    <td>
                        <a id="btnEliminar" href="ABM_Articulos.aspx?eliminar=<%#Eval("ID")%>" class="btn btn-danger" title="pulse para eliminar el articulo">Eliminar</a>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
        </table>
            </FooterTemplate>
        </asp:Repeater>
    </div>


    <%--<div class="modal fade" id="ModalModificar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">MODIFICAR ARTICULO</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input id="txt_item" class="form-control" type="text" readonly />
                    <form>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationServer01">Nombre del Articulo</label>
                                <input type="text" class="form-control is-valid" id="txt_Nombre" value="" required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="validationServer02">Marca</label>
                                <input type="text" class="form-control is-valid" id="txt_marca"  required>
                                <div class="valid-feedback">
                                    Looks good!
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-3">
                                <label for="validationServer03">City</label>
                                <input type="text" class="form-control is-invalid" id="validationServer03" required>
                                <div class="invalid-feedback">
                                    Please provide a valid city.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationServer04">State</label>
                                <select class="custom-select is-invalid" id="validationServer04" required>
                                    <option selected disabled value="">Choose...</option>
                                    <option>...</option>
                                </select>
                                <div class="invalid-feedback">
                                    Please select a valid state.
                                </div>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label for="validationServer05">Zip</label>
                                <input type="text" class="form-control is-invalid" id="validationServer05" required>
                                <div class="invalid-feedback">
                                    Please provide a valid zip.
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input is-invalid" type="checkbox" value="" id="invalidCheck3" required>
                                <label class="form-check-label" for="invalidCheck3">
                                    Agree to terms and conditions
                                </label>
                                <div class="invalid-feedback">
                                    You must agree before submitting.
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">Submit form</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>
