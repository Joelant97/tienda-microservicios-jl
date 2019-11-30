<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Graficos</title>

    <asset:javascript src="echarts.min.js"/>
</head>

<body>

<div class="container-fluid dashboard-content">

    <div class="row">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12  align-items-stretch">
            <div class="card">
                <h5 class="card-header"> <g:message code="usuarios.compra"/> </h5>

                <div class="card-body">
                    <div id="compras" class="d-flex align-items-md-stretch" style="width:100%; height:200%;"></div>
                </div>
            </div>
        </div>
    </div>


</div>


<script>

    let compras;
    $(document).ready(function () {

        $.ajax({
            type: 'GET',
            url: "${g.createLink(controller:'usuario',action:'reportes')}",
            success: function (response, textStatus) {

                let compras = [];
                response.compras.forEach(function (uno) {
                    compras.push({
                        name: uno[0],
                        value: uno[1]
                    });

                });



                console.log(compras);


                crearGraficoCompras(compras);

            }
        });


        window.addEventListener('resize', function (event) {
            compras.resize();

        });

    });

    function crearGraficoCompras(data) {

        let option = {
            title: {
                // text: 'Eficiencia'
            },
            legend: {
                show: true,
                type: 'scroll',
                // orient: 'vertical',
                // left: '90%',
                // top: 20,
                // bottom: 20,
            },
            tooltip: {
                trigger: 'item',
                // formatter: "{b} : {c}min "
            },

            series: {
                type: 'pie',
                radius: ['50%', '70%'],
                data: data,
                roseType: 'radius',
                animationType: 'scale',
                color: ["#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7FDBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"]
            },
            textStyle: {
                color: '#000000'
            }

        };


        compras = echarts.init(document.getElementById("compras"));
        compras.setOption(option);
    }


</script>
</body>
</html>
