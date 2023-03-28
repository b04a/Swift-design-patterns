import UIKit

///Behavioral Patterns in Swift - Chain in Responsibilities

protocol AccountType {
    var successor: AccountType? { get }
    var balace: Int { get }
    
    func setSuccesser(next: AccountType)
    func pay(amount: Int)
    func canPay(amount: Int) -> Bool
}

class Accoun: AccountType {
    var successor: AccountType?
    var balace: Int
    var title: String
    
    init(balace: Int, title: String) {
        self.balace = balace
        self.title = title
    }
    
    func setSuccesser(next: AccountType) {
        self.successor = next
    }
    
    func pay(amount: Int) {
        if canPay(amount: amount) {
            self.balace -= amount
            print("item price \(amount) buy with \(title)")
        } else if let successor = successor {
            successor.pay(amount: amount)
        } else {
            print("No money")
        }
    }
    
    func canPay(amount: Int) -> Bool {
        self.balace >= amount
    }
}


let cash = Accoun(balace: 30000, title: "Cash")
let debCard = Accoun(balace: 50000, title: "Debit Card")
let creditCard = Accoun(balace: 70000, title: "Credit Card")

cash.setSuccesser(next: debCard)
debCard.setSuccesser(next: creditCard)

cash.pay(amount: 60000)
cash.pay(amount: 10000)
cash.pay(amount: 55000)
cash.balace
