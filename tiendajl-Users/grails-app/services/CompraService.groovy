import grails.gorm.services.Service
import tiendajl.users.Compra


@Service(Compra)
interface CompraService {

    Compra get(Serializable id)

    List<Compra> list(Map args)

    Long count()

    void delete(Serializable id)

    Compra save(Compra compra)

}