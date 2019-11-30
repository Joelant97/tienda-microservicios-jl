<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Usuario nuevo</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

</head>

<body>

<div class="dashboard-finance">
    <div class="container-fluid dashboard-content">

        <div class="row">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <div class="section-block" id="basicform">
                    <h3 class="section-title"><g:message code="registrar.usuario"/></h3>
                </div>

                <div class="card">
                    <h5 class="card-header"><g:message code="informacion"/></h5>

                    <form id="form" method="post">
                        <div class="card-body">

                            <div class="form-group">
                                <label for="username" class="col-form-label"><g:message code="username"/></label>
                                <input id="username" type="text" class="form-control" name="username" required>
                            </div>

                            <div class="form-group">
                                <label for="enabled" class="col-form-label"><g:message code="enabled"/></label>
                                <input id="enabled" type="text" class="form-control" name="enabled" required>
                            </div>

                            <div class="form-group">
                                <label for="accountExpired" class="col-form-label"><g:message code="accountExpired"/></label>
                                <input id="accountExpired" type="text" class="form-control" name="accountExpired">
                            </div>

                            <div class="form-group">
                                <label for="accountLocked" class="col-form-label"><g:message code="accountLocked"/></label>
                                <input id="accountLocked" type="text" class="form-control" name="accountLocked" required>
                            </div>

                            <div class="form-group">
                                <label for="passwordExperied" class="col-form-label"><g:message code="passwordExperied"/></label>
                                <input id="passwordExperied" type="text" class="form-control" name="passwordExperied" required>
                            </div>

                            <div class="form-group">
                                <label for="dateCreated" class="col-form-label"><g:message code="dateCreated"/></label>
                                <input id="dateCreated" type="date" class="form-control" name="dateCreated" required>
                            </div>

                            <div class="form-group">
                                <label for="lastUpdate"><g:message code="lastUpdate"/></label>
                                <input id="lastUpdate" type="date" placeholder="11/29/2019" name="lastUpdate"
                                       class="form-control" required>
                            </div>

                            %{--<input hidden name="usuario" value="${usuario.id}">--}%


                        </div>

                        <div style="float: right;margin-bottom: 5px;margin-right: 15px">
                            <button type="reset" class="btn btn-brand"><g:message code="cancelar"/></button>
                            <button type="submit" class="btn btn-success">OK</button>
                            <br>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"><g:message code="error"/></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <g:form controller="usuario" action="existe">
                <div class="modal-body">
                    <label id="errores"></label>

                    <div class="form-group">
                        <input hidden type="text" id="error" name="error">
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><g:message
                            code="cerrar"/></button>
                    <button type="submit" class="btn btn-primary" onsubmit="mostrarErrores()"><g:message code="ok"/></button>
                </div>
            </g:form>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {

        %{--$(".telefono").inputmask({"mask": "(999) 999-9999"});--}%

        %{--$('#departamentos').select2({--}%
            %{--width: 'resolve',--}%
            %{--placeholder: '<g:message code="departamentos" /> ',--}%
            %{--allowClear: true,--}%
            %{--// templateResult: format,--}%
            %{--// selectionAdapter: 'SingleSelection',--}%
            %{--// templateSelection: format,--}%
            %{--ajax: {--}%
                %{--url: "/departamento/todos",--}%
                %{--processResults: function (data) {--}%
                    %{--data = data.map(function (departamento) {--}%
                        %{--return {--}%
                            %{--id: departamento.id,--}%
                            %{--text: departamento.nombre,--}%
                            %{--// otherfield: item.otherfield--}%
                        %{--};--}%
                    %{--});--}%
                    %{--return {results: data};--}%
                %{--},--}%
            %{--},--}%
        %{--});--}%

        $("#form").on("submit", function (e) {
            // alert('entro');
            e.preventDefault();
            crear();
        })
    });

    function crear() {
        $.ajax({
            type: 'POST',
            data: $('#form').serialize(),
            url: "${g.createLink(controller:'usuario',action:'save')}",
            success: function (res) {
                if (res.valido !== 1) {
                    alert("Errores al insertar: "+ res.errores.map(a => a.arguments[0] + ": " + a.arguments[2]));

                    var uniqueErrors = res.errores.filter(it => (it.code === "unique"));
                    if(uniqueErrors !== null) {
                        var dialog = confirm("Existe un contacto con los campos: " +
                            uniqueErrors.map(a => a.arguments[0] + ": " + a.arguments[2]) +
                            "\nDesea agregar el departamento al contacto existente?");
                        if(dialog == true)
                            sendData(uniqueErrors);
                    }
                }
                else {
                    alert('guardado');
                    window.location.replace("/usuario/index/")
                }
            }
        })
    }

    function sendData(data) {
        var XHR = new XMLHttpRequest();
        var FD  = new FormData();
        // var select = document.getElementById("departamentos");

        // Push our data into our FormData object
        for(i in data) {
            FD.append(data[i].arguments[0], data[i].arguments[2]);
        }
        // var selectedValues  = Array(...select.options).reduce((acc, option) => {
        //     if (option.selected === true) {
        //         acc.push(option.value);
        //     }
        //     return acc;
        // }, []);
        // FD.append("departamentos", selectedValues);

        // Define what happens on successful data submission
        XHR.addEventListener('load', function(event) {
            alert('Usuario Actualizado.');
        });

        // Define what happens in case of error
        XHR.addEventListener('error', function(event) {
            alert('Oops! Something went wrong.');
        });

        // Set up our request
        XHR.open('POST', '/usuario/existe');

        // Send our FormData object; HTTP headers are set automatically
        XHR.send(FD);
    }
    function mostrarErrores(errores) {
        errors = errores.map(a => a.arguments[0] + ": " + a.arguments[2]);
        document.getElementById("error").value = errors;
        document.getElementById("errores").textContent = "Existe un usuario con los campos: " + errors +
            "\nDesea agregar el departamento al contacto existente?" ;





        $("#modal").modal("toggle");
    }

</script>

</body>
</html>
