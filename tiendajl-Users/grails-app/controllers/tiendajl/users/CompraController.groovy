package tiendajl.users

//import grails.converters.JSON
import grails.validation.ValidationException
//import tiendajl.users.auth.Usuario

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured



class CompraController {

////////////////////////////////////////////////////////////////////////////////
    def CompraService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def list() {
        [compras: Compra.findAll()]


        withAsyncHttp(poolSize : 4, uri : "http://localhost:8080/compra/list", contentType : "application/json") {
            def result = get(path: '/') { resp, json ->
                println ' got async response!'
                return json
            }
            assert result instanceof java.util.concurrent.Future

            while (!result.done) {
                println 'esperando...'
                Thread.sleep(2000)
            }

        }



        }




////////////////////////////////////////////////////////////////////////////////////////////////////
//
////    def show(Long id) {
////        respond compraService.get(id)
////    }
//
//    def show() {
//
//        def comp = [compra: Compra.get(params.id)]
//        render(view: "show.gsp", model: comp)
//    }
//
//
//
//    def create() {
//        respond new Compra(params)
//    }
//
////    def todos(){
////        def compras = Compra.findAll()
////        render compras as JSON
////    }
//
////    def save() {
////        def usuario = (Usuario) getSession()
////        try {
////
////            def compra = new Compra(params)
////            compra.setCliente(usuario)
////            compra.save(flush: true, failOnError: true)
////
////        } catch (ValidationException e) {
////            println e
////        }
////        redirect(uri: '/')
////    }
//
////    def editar(Long id) {
////        def compra = compraService.get(id)
////        render compra as JSON
////    }
//
//    def update(Integer id, String cliente) {
//        def compra = Compra.findById(id)
//
//        compra.setCliente(cliente)
//        compra.save(flush: true, failOnError: true)
//
//        redirect(uri: '/compra/index')
//    }
//
//    def delete(Long id) {
//        println "id: " + id
//        def compra = Compra.findById(id)
//        println(""+compra)
//        println "cliente " +compra.getCliente()
//        //def u = Contacto.findAllByCategoriasInList([categoria])
////        def u  = Usuario.where {usuario.id in [compra.id]}
//        def c  = Compra.where {[compra.cliente] in compras}
////        def u  = Contacto.where {categorias in [categoria]}
////        def u = Contacto.findAll("from Contacto as u where u.categorias in (:categorias)", [categorias: [categoria]])
//
//        println c.size()
//        def compras = ((c) as List<Compra>)
//
//        compras.each {
//            it.removeFromCompras(compra)
//            it.save(flush: true, failOnError: true)
//        }
//
//        compra.delete(flush: true, failOnError: true)
//
//        redirect action: 'index'
//    }







    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond productService.list(params), model:[productCount: productService.count()]
    }

    @Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def show(Long id) {
        respond productService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def create() {
        respond new Compra(params)
    }

    @Secured('ROLE_ADMIN')
    def save(Compra compra) {
        if (compra == null) {
            notFound()
            return
        }

        try {
            compraService.save(compra)
        } catch (ValidationException e) {
            respond compra.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'compra.label', default: 'Compra'), compra.id])
                redirect compra
            }
            '*' { respond compra, [status: CREATED] }
        }
    }

    @Secured('ROLE_ADMIN')
    def edit(Long id) {
        respond compraService.get(id)
    }

    @Secured('ROLE_ADMIN')
    def update(Compra compra) {
        if (compra == null) {
            notFound()
            return
        }

        try {
            compraService.save(compra)
        } catch (ValidationException e) {
            respond compra.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'compra.label', default: 'Product'), product.id])
                redirect compra
            }
            '*'{ respond compra, [status: OK] }
        }
    }

    @Secured('ROLE_ADMIN')
    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        compraService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'compra.label', default: 'Compra'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'compra.label', default: 'Compra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }





}
