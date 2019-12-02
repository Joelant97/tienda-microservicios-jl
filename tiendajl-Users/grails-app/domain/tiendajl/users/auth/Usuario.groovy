package tiendajl.users.auth

import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)

class Usuario implements Serializable{

    transient springSecurityService

    String fullname
    String username
    String password
    boolean enabled = true
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired

    Date dateCreated
    Date lastUpdated

    Set<Rol> getAuthorities() {
        UsuarioRol.findAllByUsuario(this)*.rol
    }

    def beforeInsert() {
        encodePassword()
    }

    def beforeUpdate() {
        if (this.isDirty('password')) { //TODO: verificar en el foro.
            encodePassword()
        }
    }

    protected void encodePassword() {
        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
    }


    static transients = ['springSecurityService']

//    static constraints = {
//        password blank: false, password: true
//        username blank: false, unique: true
//    }

    static constraints = {
        password nullable: false, blank: false, password: true
        username nullable: false, blank: false, unique: true
        fullname nullable: false, blank: false
    }

    static mapping = {
        password column: '`password`'

    }


}

