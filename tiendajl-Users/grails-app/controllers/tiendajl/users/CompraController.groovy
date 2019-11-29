package tiendajl.users

class CompraController {

    def show() {

        def comp = [compra: Compra.get(params.id)]
        render(view: "/compra/show", model: comp)
    }
}
