import grails.gorm.services.Service
import tiendajl.users.auth.UsuarioRol


@Service(UsuarioRol)
interface UsuarioRolService {

    UsuarioRol get(Serializable id)

    List<UsuarioRol> list(Map args)

    Long count()

    void delete(Serializable id)

    UsuarioRol save(UsuarioRol usuarioRol)

}