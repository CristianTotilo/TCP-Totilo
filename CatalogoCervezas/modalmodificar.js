
    $(function () {
        $(".btnmodificar").click(function () {
            //get data from table row
            var Nombre = $(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
            var marca = $(this).parent().prev().prev().prev().prev().prev().prev().text();
            var estilo = $(this).parent().prev().prev().prev().prev().prev().text();
            var ABV = $(this).parent().prev().prev().prev().prev().text();
            var IBU = $(this).parent().prev().prev().prev().text();
            var Volumen = $(this).parent().prev().prev().text();
            var Precio = $(this).parent().prev().text();


            //assign to value for input box inside modal
            $("#txt_Nombre").val(Nombre);
            $("#txt_marca").val(marca);
            $("#txt_estilo").val(estilo);
            $("#txt_ABV").val(ABV);
            $("#txt_IBU").val(IBU);
            $("#txt_Volumen").val(Volumen);
            $("#txt_Precio").val(Precio);

            //open modal
            $("#ModalModificar").modal();

            $("#btnsave").click(function () {
                //make ajax request to update data

                //and in ajax success callback function 
                //hide modal
                //$("#myModal").modal("hide")              
            })
        })
    })
  