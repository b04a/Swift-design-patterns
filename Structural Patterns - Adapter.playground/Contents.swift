import UIKit

///Structural Patterns - Adapter

class Archer {
    var bow: Bow
    
    init(bow: Bow) {
        self.bow = bow
    }
}

protocol Bow {
    func pushArrow()
}

class LongBow: Bow {
    func pushArrow() {
        print("Arrow push with long bow")
    }
}

class TyrkBow: Bow {
    func pushArrow() {
        print("Arrow push with Tyrkey bow")
    }
}

class Arbalet {
    func shot() {
        print("Shot with arbalet")
    }
}

class ArbaletAdapter: Bow {
    private var arbalet: Arbalet
    
    init(arbalet: Arbalet) {
        self.arbalet = arbalet
    }
    
    func pushArrow() {
        arbalet.shot()
    }
}

let archer = Archer(bow: TyrkBow())
archer.bow.pushArrow()
archer.bow = ArbaletAdapter(arbalet: Arbalet())
archer.bow.pushArrow()
