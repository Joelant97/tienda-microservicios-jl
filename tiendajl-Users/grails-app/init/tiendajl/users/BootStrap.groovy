package tiendajl.users

import tiendajl.users.auth.Usuario

class BootStrap {

    def init = { servletContext ->

        if (Usuario.count() < 1){

            def admin = new Usuario(username: "admin", password: "admin")
            admin.save(flush: true, failOnError: true)
        }


        //Creando un usuario por defecto.
        if (Usuario.count() < 1){

            def userr = new Usuario(username: "Joel", password: "12345", enabled: "true", passwordExpired: "11/28/2020", dateCreated: Date())

            userr.save(flush:true, failOnError: true)
        }

    }

    def destroy = {
    }


}
