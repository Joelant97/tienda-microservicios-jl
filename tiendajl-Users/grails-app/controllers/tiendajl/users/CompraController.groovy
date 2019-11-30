package tiendajl.users

import grails.converters.JSON
import grails.validation.ValidationException
import tiendajl.users.auth.Usuario


class CompraController {


    def CompraService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def list() {
        [compras: Compra.findAll()]

    }

//    def show(Long id) {
//        respond compraService.get(id)
//    }

    def show() {

        def comp = [compra: Compra.get(params.id)]
        render(view: "show.gsp", model: comp)
    }



    def create() {
        respond new Compra(params)
    }

    def todos(){
        def compras = Compra.findAll()
        render compras as JSON
    }

    def save() {
        def usuario = (Usuario) getSession()
        try {

            def compra = new Compra(params)
            compra.setCliente(usuario)
            compra.save(flush: true, failOnError: true)

        } catch (ValidationException e) {
            println e
        }
        redirect(uri: '/')
    }

    def editar(Long id) {
        def compra = compraService.get(id)
        render compra as JSON
    }

    def update(Integer id, String cliente) {
        def compra = Compra.findById(id)

        compra.setCliente(cliente)
        compra.save(flush: true, failOnError: true)

        redirect(uri: '/compra/index')
    }

    def delete(Long id) {
        println "id: " + id
        def compra = Compra.findById(id)
        println(""+compra)
        println "cliente " +compra.getCliente()
        //def u = Contacto.findAllByCategoriasInList([categoria])
//        def u  = Usuario.where {usuario.id in [compra.id]}
        def c  = Compra.where {[compra.cliente] in compras}
//        def u  = Contacto.where {categorias in [categoria]}
//        def u = Contacto.findAll("from Contacto as u where u.categorias in (:categorias)", [categorias: [categoria]])

        println c.size()
        def compras = ((c) as List<Compra>)

        compras.each {
            it.removeFromCompras(compra)
            it.save(flush: true, failOnError: true)
        }

        compra.delete(flush: true, failOnError: true)

        redirect action: 'index'
    }




}
