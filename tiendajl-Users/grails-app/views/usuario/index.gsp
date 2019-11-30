<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>

</head>

<body>

<div class="dashboard-finance">
    <div class="container-fluid dashboard-content">

        <div class="row">

            <div class="col-xl-12 col-xl-6 col-lg-6 col-md-12 col-md-6 col-sm-12 col-12">
                <div class="card">
                    <h5 class="card-header"> <g:message code="lista.usuarios"/> </h5>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col"> <g:message code="username"/> </th>
                                    %{--<th scope="col">Usuario</th>--}%
                                    <th scope="col"> <g:message code="enabled"/> </th>
                                    <th scope="col"> <g:message code="accountExpired"/> </th>
                                    <th scope="col"> <g:message code="accountLocked"/> </th>
                                    <th scope="col"> <g:message code="passwordExperied"/> </th>
                                    <th scope="col"> <g:message code="dateCreated"/> </th>
                                    <th scope="col"> <g:message code="lastUpdated"/> </th>

                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${usuarios}" var="usuario">
                                    <tr>
                                        <td>${usuario.username}</td>
                                        <td>${usuario.enabled}</td>
                                        <td>${usuario.accountExpired}</td>
                                        <td>${usuario.accountLocked}</td>
                                        <td>${usuario.passwordExperied}</td>
                                        <td>${usuario.dateCreated}</td>
                                        <td>${usuario.lastUpdated}</td>

                                        <td>
                                            <ul>
                                                <li>
                                                    <g:each in="${usuario.compras}" var="compra">
                                                        ${compra.cliente}    %{-- Puedes agregar la factura tambien --}%
                                                    </g:each>
                                                </li>
                                            </ul>
                                        </td>


                                        <td align="center">
                                            <button class="btn btn-rounded btn-danger" onclick="eliminar(${usuario.id})"><i
                                                    class="fa fa-minus-square"></i> <g:message code="eliminar"/> </button>
                                            <button class="btn btn-rounded btn-primary"
                                                    onclick="editar(${usuario.id})"><i
                                                    class="fa fa-pencil-alt"></i> <g:message code="editar"/> </button>
                                        </td>

                                    </tr>

                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal" id="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"> <g:message code="editar.usuario"/> </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <g:form action="update" controller="usuario"  method="PUT">
                <div class="modal-body">
                    <div class="form-group">
                        <input hidden name="usuario" value="">
                        <label for="username" class="col-form-label"> <g:message code="username"/> </label>
                        <input id="username" type="text" class="form-control" name="username" required>
                        <label for="enabled" class="col-form-label"> <g:message code="enabled"/> </label>
                        <input id="enabled" type="text" class="form-control" name="enabled" required>
                        <label for="accountExpired" class="col-form-label"> <g:message code="accountExpired"/> </label>
                        <input id="accountExpired" type="text" class="form-control" name="accountExpired" required>
                        <label for="accountLocked" class="col-form-label"> <g:message code="accountLocked"/> </label>
                        <input id="accountLocked" type="text" class="form-control" name="accountLocked" required>
                        <label for="passwordExpired" class="col-form-label"> <g:message code="passwordExpired"/> </label>
                        <input id="passwordExpired" type="text" class="form-control" name="passwordExpired" required>
                        <label for="dateCreated" class="col-form-label"> <g:message code="dateCreated"/> </label>
                        <input id="dateCreated" type="date" class="form-control" name="dateCreated" required>
                        <label for="lastUpdated" class="col-form-label"> <g:message code="lastUpdated"/> </label>
                        <input id="lastUpdated" type="date" class="form-control" name="lastUpdated" required>

                        %{--<label for="departamentos" class="col-form-label"> <g:message code="departamentos"/> </label>--}%
                        %{--<select id="departamentos" name="departamento">--}%
                            %{--<g:each in="${departamentos}" var="departamento">--}%
                                %{--<option value="${departamento.id}">${departamento.nombre}</option>--}%
                            %{--</g:each>--}%
                        %{--</select>--}%
                        %{--<label for="categorias" class="col-form-label"> <g:message code="categorias"/> </label>--}%
                        %{--<select id="categorias" name="categoria">--}%
                            %{--<g:each in="${categorias}" var="categoria">--}%
                                %{--<option value="${categoria.id}">${categoria.nombre}</option>--}%
                            %{--</g:each>--}%
                        %{--</select>--}%

                        %{--<label for="categoria" class="col-form-label"> <g:message code="categoria"/> </label>--}%
                        %{--<input id="categoria" type="text" class="form-control" name="categoria" required>--}%
                        <input hidden id="id" name="id">
                    </div>
                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"> <g:message code="cerrar"/> </button>
                    <button type="submit" class="btn btn-primary"> <g:message code="guardar"/> </button>
                </div>
            </g:form>
        </div>
    </div>
</div>

<script>

    function eliminar(id) {


        let request = new XMLHttpRequest();
        request.open('DELETE', '/usuario/delete/?id='+id, true);
        request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
        request.send();

    }


    function editar(id) {

        let request = new XMLHttpRequest();
        request.open('GET', '/usuario/editar/?id=' + id, true);

        request.onload = function () {
            if (request.status >= 200 && request.status < 400) {
                // Success!
                let resp = JSON.parse(request.responseText);

                // console.log(resp);
                document.getElementById('id').value = resp.id;
                document.getElementById('username').value = resp.username;
                document.getElementById('enabled').value = resp.enabled();
                document.getElementById('accountExpired').value = resp.accountExpired;
                document.getElementById('accountLocked').value = resp.accountLocked;
                document.getElementById('passwordExpired').value = resp.passwordExpired;
                document.getElementById('dateCreated').value = resp.dateCreated;
                document.getElementById('lastUpdated').value = resp.lastUpdated;
                // document.getElementById('departamentos').value = resp.departamentos.nombre;
                // document.getElementById('categorias').value = resp.categorias.nombre;



            //     let categoriaSelect = document.getElementById('categorias');
            //     var value = 0;
            //     resp.categorias.forEach(option =>
            //     categoriaSelect.add(
            //         new Option(option.nombre, option.id, option.selected)
            //     )
            // );


                $('#modal').modal("toggle");


            } else {
                // We reached our target server, but it returned an error

            }
        };

        request.onerror = function () {
            // There was a connection error of some sort
        };

        request.send();

    }

</script>
</body>
</html>