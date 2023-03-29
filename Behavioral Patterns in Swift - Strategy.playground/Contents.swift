import UIKit

///Behavioral Patterns in Swift - Strategy

protocol IncreaseSizeStrategy {
    func increase(initValue: Int) -> Int
}

class LittelIncreaseStrategy: IncreaseSizeStrategy {
    func increase(initValue: Int) -> Int {
        return initValue + 1
    }
}

class MiddlelIncreaseStrategy: IncreaseSizeStrategy {
    func increase(initValue: Int) -> Int {
        return initValue + 5
    }
}

class BiglIncreaseStrategy: IncreaseSizeStrategy {
    func increase(initValue: Int) -> Int {
        return initValue + 10
    }
}

class SizeChanger {
    var change: IncreaseSizeStrategy
    
    init(change: IncreaseSizeStrategy) {
        self.change = change
    }
    
    func changeSize(size: Int) -> Int {
        return change.increase(initValue: size)
    }
}

class Brush {
    var size: Int
    var increaseStatagy: IncreaseSizeStrategy {
        switch size {
        case ...20: return LittelIncreaseStrategy()
        case 21...40: return MiddlelIncreaseStrategy()
        default: return BiglIncreaseStrategy()
        }
    }
    
    init(size: Int) {
        self.size = size
    }
    
    func increaseSize() {
        self.size = self.increaseStatagy.increase(initValue: self.size)
        print(size)
    }
}

let brush = Brush(size: 15)
brush.increaseSize()
brush.increaseSize()
brush.increaseSize()
brush.increaseSize()
brush.increaseSize()
brush.increaseSize()
brush.increaseSize()
