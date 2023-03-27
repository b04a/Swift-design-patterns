import Foundation

///Abstract Factory

protocol Top {
    var title : String { get }
    func putOn()
}

class Jacket: Top {
    var title: String = "Jacket"
    
    func putOn() {
        print("On me jacket!")
    }
}

class WindStopper: Top {
    var title: String = "Windbreaker"
    
    func putOn() {
        print("On me windbreaker!")
    }
}

protocol Pants {
    var title: String { get }
    var color: String { get }
    func putOn()
}

class Trousers: Pants {
    var title: String = "Trousers"
    
    var color: String = "Blue"
    
    func putOn() {
        print("On me \(color) \(title)")
    }
}

class Jeans: Pants {
    var title: String = "Jeans"
    
    var color: String = "Black"
    
    func putOn() {
        print("On me \(color) \(title)")
    }
}

protocol AbstractFactory {
    func createTop() -> Top
    func createPants() -> Pants
}


class CasualFactory: AbstractFactory {
    func createTop() -> Top {
        return Jacket()
    }
    
    func createPants() -> Pants {
        return Trousers()
    }
}

class SportFactory: AbstractFactory {
    func createTop() -> Top {
        return WindStopper()
    }
    
    func createPants() -> Pants {
        return Jeans()
    }
}


var top: Top?
var pants: Pants?

var factory: AbstractFactory?
var situations = "Meeting"

if situations == "Meeting" {
    factory = CasualFactory()
    pants = factory?.createPants()
    top = factory?.createTop()
} else if situations == "Sport" {
    factory = SportFactory()
    pants = factory?.createPants()
    top = factory?.createTop()
} else {
    print("another clothes")
}

top?.title
pants?.title
