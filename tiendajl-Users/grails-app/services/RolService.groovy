import grails.gorm.services.Service
import tiendajl.users.auth.Rol


@Service(Rol)
interface RolService {

    Rol get(Serializable id)

    List<Rol> list(Map args)

    Long count()

    void delete(Serializable id)

    Rol save(Rol rol)

}