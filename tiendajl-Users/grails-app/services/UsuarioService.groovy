

import grails.gorm.services.Service
import tiendajl.users.auth.Usuario

@Service(Usuario)
interface UsuarioService {

    Usuario get(Serializable id)

    List<Usuario> list(Map args)

    Long count()

    void delete(Serializable id)

    Usuario save(Usuario usuario)

}