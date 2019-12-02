package tiendajl.users

import grails.rest.Resource

@Resource(uri='/comp')
class Compra {

    String plan
    String cliente
    String emailComprador
    Date fechaCompra
    String vendedor

    String factura
    String transaccion
    String estatusPago

    BigDecimal montoCompra
    BigDecimal montoFee
    BigDecimal montoEnvio
    BigDecimal montoImpuesto
    BigDecimal montoManejo
    String direccion
    String zip
    String estado
    String ciudad




    static constraints = {

        plan nullable: false, blank: false
        cliente nullable: false, blank: false
        emailComprador nullable: false, blank: false
        fechaCompra nullable: false, blank: false
        zip nullable: true
        vendedor nullable: false, blank: false
        factura nullable: false, blank: false
        transaccion nullable: false, blank: false
        estatusPago nullable: false, blank: false
        montoCompra nullable: false, blank: false
        montoFee nullable: false, blank: false
        montoEnvio nullable: false, blank: false
        montoImpuesto nullable: false, blank: false
        montoManejo nullable: false, blank: false
        direccion nullable: false, blank: false
        estado nullable: false, blank: false
        ciudad nullable: false, blank: false

    }

    String toString() {
        factura
    }




    static mapping = {

    }


}
