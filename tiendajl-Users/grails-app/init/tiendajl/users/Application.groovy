package tiendajl.users

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration


//Documentacion de los ultimos cambios, registro de usuarios:
// https://www.djamware.com/post/5db9a359fe53660ee3228772/grails-4-tutorial-spring-security-core-login-example

class Application extends GrailsAutoConfiguration {
    static void main(String[] args) {
        GrailsApp.run(Application, args)
    }
}