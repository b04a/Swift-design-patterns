import UIKit

///Behavioral Patterns in Swift - Visitor

///Type visit objc
protocol Attration {
    func visitResul(age: Int?)
}

///Type visitor
protocol Visitor {
//    func visitSauna(_ sauna: Sauna)
//    func visitWaterSlide(_ waterSlide: WaterSlide)
//    func visitSwimmingPool(_ swimmingPool: SwimmingPool)
    func visitAttration(_ attration: Attration)
}

///Realize visit objc
class SwimmingPool: Attration {
    func visitResul(age: Int?) {
        print("You swim in a swimming pool")
    }
}

class Sauna: Attration {
    let type: String
    var temp: Int
    
    init(type: String, temp: Int = 100) {
        self.type = type
        self.temp = temp
    }
    
    func visitResul(age: Int?) {
        print("You visit sauna, type her \(self.type), temp \(temp)")
    }
}

class WaterSlide: Attration {
    var minAge: Int
    var height: Int
    
    init(minAge: Int, height: Int) {
        self.minAge = minAge
        self.height = height
    }
    
    func visitResul(age: Int?) {
        guard let age = age, age >= minAge else {
            print("NO!")
            return
        }
        
        print("You've rolled down a high hill \(height)")
    }
}

///Realize attratrion
class Client: Visitor {
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
    
//    func visitSauna(_ sauna: Sauna) {
//        sauna.visitResul(age: age)
//    }
//
//    func visitWaterSlide(_ waterSlide: WaterSlide) {
//        waterSlide.visitResul(age: age)
//    }
//
//    func visitSwimmingPool(_ swimmingPool: SwimmingPool) {
//        swimmingPool.visitResul(age: age)
//    }
    
    func visitAttration(_ attration: Attration) {
        attration.visitResul(age: age)
    }
}


///TESTING PATTERN
let slide = WaterSlide(minAge: 12, height: 30)
let litterSlide = WaterSlide(minAge: 5, height: 12)
let pool = SwimmingPool()
let saunaTy = Sauna(type: "Tyrkey")
let saunaRy = Sauna(type: "Russia", temp: 120)

let client = Client(age: 10)
client.visitAttration(saunaRy)
client.visitAttration(saunaTy)
client.visitAttration(slide)
client.visitAttration(litterSlide)


