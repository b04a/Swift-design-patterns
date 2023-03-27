import Foundation

///Factory
///Упращение создания новых объектов

enum ClothesType {
    case head
    case shoes
    case pants
}

protocol Clothes {
    var titl: String { get }
    var type: ClothesType { get }
    var color: String { get }
    
    func putOn()
}

class Hat: Clothes {
    var titl: String = "Hat"
    var type: ClothesType = .head
    var color: String = "black"
    
    func putOn() {
        print("Wearing \(color) \(titl)")
    }
}

class Shoes: Clothes {
    var titl: String = "Shoes"
    
    var type: ClothesType = .shoes
    
    var color: String = "yellow"
    
    func putOn() {
        print("Wearing \(color) \(titl)")
    }
}

class Jeans: Clothes {
    var titl: String = "jeans"
    var type: ClothesType = .pants
    var color: String = "blue"
    
    func putOn() {
        print("Wearing \(color) \(titl)")
    }
    
}

class ClothesFactory {
    static let shared = ClothesFactory()
    private init() { }
    
    func createClothes(type: ClothesType) -> Clothes {
        switch type {
        case .head:
            return Hat()
        case .shoes:
            return Shoes()
        case .pants:
            return Jeans()
        }
    }
}

let hat =  ClothesFactory.shared.createClothes(type: .head)
let shoes = ClothesFactory.shared.createClothes(type: .shoes)
let jeans = ClothesFactory.shared.createClothes(type: .pants)

var clothes: [Clothes] = [hat, shoes]
clothes.append(jeans)

for i in clothes {
    i.putOn()
}
