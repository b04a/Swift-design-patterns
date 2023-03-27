import Foundation

///Generating patterns on - Builder + Director
///Паттерн нужен быстро и ловко создавать опредленные данные с известными

class Car {
    var title: String?
    var type: String?
    var engineVolume: Double?
    var lifting: Int?
}

protocol Builder {
    func reset()
    
    func setTitle()
    func setType()
    func setEngineVolume(_ volume: Double)
    func setLifting()
    
    func getObject() -> Car
}

class AudiBilder: Builder {
    
    var car = Car()
    
    func reset() {
        self.car = Car()
    }
    
    func setTitle() {
        self.car.title = "Audi"
    }
    
    func setType() {
        self.car.type = "Light"
    }
    
    func setEngineVolume(_ volume: Double) {
        self.car.engineVolume = volume
    }
    
    func setLifting() {
        self.car.lifting = 600
    }
    
    func getObject() -> Car {
        return self.car
    }
}


class Director {
    private var builder: Builder
    init(builder: Builder) {
        self.builder = builder
    }
    
    func setBuilder(builder: Builder) {
        self.builder = builder
    }
    
    func createCar(volume: Double) -> Car {
        builder.reset()
        builder.setEngineVolume(volume)
        builder.setTitle()
        builder.setType()
        builder.setLifting()
        return builder.getObject()
    }
}

var audiBuilder = AudiBilder()
var director = Director(builder: audiBuilder)
let audi = director.createCar(volume: 2.4)
audi.title
audi.engineVolume
