package tiendajl.users

import grails.validation.ValidationException
import tiendajl.users.auth.Usuario
import tiendajl.users.auth.UsuarioRol

import static org.springframework.http.HttpStatus.*

class UsuarioController {

    def UsuarioRolService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {



    }

//    def show(Long id) {
//        respond usuarioService.get(id)
//    }

    def show() {

        def u = [usuario: Usuario.get(params.id)]
        render(view: "show.gsp", model: u)
    }

    def create() {

    }

    def save() {



    }

    def edit(Long id) {
        respond usuarioService.get(id)
    }

    def update(Usuario usuario) {
        if (usuario == null) {
            notFound()
            return
        }

        try {
            usuarioService.save(usuario)
        } catch (ValidationException e) {
            respond usuario.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuario.id])
                redirect usuario
            }
            '*' { respond usuario, [status: OK] }
        }
    }

    def iniciarSesion(String username, String password) {
        def user = Usuario.findByUsername(username)
        if (!user) {

        }
        redirect(uri: "/index")
    }







}
