import Foundation

///Поведенческие паттерны на Swift - Делегат (Delegate)
struct Product {
    let title: String
    let price: Int
}

struct Position {
    let product: Product
    var count: Int
    var cost: Int {
        return product.price * count
    }
}

protocol CatalogDelegate {
    func addPosition(position: Position)
}

class Catalog {
    var products = [Product]()
    
    var delegate: CatalogDelegate?
    
    func addToCart(index: Int, count: Int) {
        if products.count > index {
            //Add positions in cart
            if let delegate = delegate {
                let product = products[index]
                let position = Position(product: product, count: count)
                delegate.addPosition(position: position)
            }
        }
    }
}

class Cart: CatalogDelegate {
    private(set) var positions = [Position]()
    
    var cost: Int {
        var sum = 0
        for i in positions {
            sum += i.cost
        }
        return sum
    }
    
    func addPosition(position: Position) {
        self.positions.append(position)
    }
}

let catalog = Catalog()
let cart = Cart()

catalog.delegate = cart
cart.positions.count
cart.cost

let beer = Product(title: "Beer", price: 2)
let cheeps = Product(title: "Cheeps", price: 1)
let milk = Product(title: "Milk", price: 2)
catalog.products = [beer, cheeps, milk]
catalog.addToCart(index: 0, count: 2)
catalog.addToCart(index: 1, count: 3)
catalog.addToCart(index: 2, count: 1)
cart.positions.count
cart.cost
