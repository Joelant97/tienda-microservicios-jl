package tiendajl.users

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import tiendajl.users.auth.Rol
import tiendajl.users.auth.Usuario
import tiendajl.users.auth.UsuarioRol


@Transactional
@Secured('permitAll')
class RegisterController {

    static allowedMethods = [register: "POST"]

    def index() { }

    def register() {
        if(!params.password.equals(params.repassword)) {
            flash.message = "Password and Re-Password not match"
            redirect action: "index"
            return
        } else {
            try {
                def usuario = Usuario.findByUsername(params.username)?: new Usuario(username: params.username, password: params.password, fullname: params.fullname).save()
                def role = Rol.get(params.role.id)
                if(usuario && role) {
                    UsuarioRol.create usuario, role

                    UsuarioRol.withSession {
                        it.flush()
                        it.clear()
                    }

                    flash.message = "You have registered successfully. Please login."
                    redirect controller: "login", action: "auth"
                } else {
                    flash.message = "Register failed"
                    render view: "index"
                    return
                }
            } catch (ValidationException e) {
                flash.message = "Register Failed"
                redirect action: "index"
                return
            }
        }
    }
}