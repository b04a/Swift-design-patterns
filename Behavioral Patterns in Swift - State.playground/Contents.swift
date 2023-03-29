import UIKit

///Behavioral Patterns in Swift - State

protocol NetworkState {
    func payment(amount: Int) -> Bool
}

class Connected: NetworkState {
    func payment(amount: Int) -> Bool {
        print("Payment on sum \(amount) in proccess...")
        return true
    }
}

class Disconnected: NetworkState {
    func payment(amount: Int) -> Bool {
        print("Not connected")
        return false
    }
}

class Cart {
    private var state: NetworkState = Connected()
    var balance = 6000
    
    func setState(_ newState: NetworkState) {
        self.state = newState
    }
    
    func pay(amount: Int) {
        guard self.balance >= amount else {
            print("Money is not enough.")
            return
        }
        
        guard self.state.payment(amount: amount) else {
            print("Payment did not go through")
            return
        }
        
        self.balance -= amount
        print("Payment successfuly")
    }
}

let cart = Cart()
cart.pay(amount: 4000)
cart.setState(Disconnected())
cart.pay(amount: 1000)
