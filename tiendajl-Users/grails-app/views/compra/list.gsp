<!DOCTYPE html>
<html>


<head>
    <meta name="layout" content="main" />

    <asset src="stylesheets/style.css"/>
    <asset src="javascript/vendor/bootstrap/css/bootstrap.min.css"/>
    <asset src="javascript/vendor/fonts/circular-std/style.css"/>
    <asset src="javascript/vendor/fonts/fontawesome/css/fontawesome-all.css"/>
    <asset src="javascript/vendor/daterangepicker/daterangepicker.css"/>
    <asset src="javascript/vendor/jquery/jquery-3.3.1.min.js"/>

</head>

<body>

<div class="dashboard-finance">
    <div class="container-fluid dashboard-content">

        <div class="row">

            <div class="col-xl-12 col-xl-6 col-lg-6 col-md-12 col-md-6 col-sm-12 col-12">
                <div class="card">
                    <h5 class="card-header"> <g:message code="lista.compras"/>   </h5>

                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">  <g:message code="nombre"/>  </th>
                                    <th scope="col" style="text-align: center;">  <g:message code="acciones"/>  </th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${compras}" var="compra">
                                    <tr>
                                        <td>${compra.cliente}</td>

                                        <td align="center">
                                            <button class="btn btn-rounded btn-danger" onclick="eliminar(${compra.id})"><i
                                                    class="fa fa-minus-square"></i>  <g:message code="eliminar"/> </button>
                                            <button class="btn btn-rounded btn-primary"
                                                    onclick="editar(${compra.id})"><i
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

</body>
</html>