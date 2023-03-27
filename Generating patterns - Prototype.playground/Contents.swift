import Foundation

///Generating patterns - Prototype

class Phone {
    var title: String
    var price: Int
    
    init(title: String, price: Int) {
        self.title = title
        self.price = price
    }
    
    func clone() -> Phone {
        let phone = Phone(title: self.title, price: self.price)
        return phone
    }
}

let phone1 = Phone(title: "iPhone", price: 50000)
let phone2 = phone1.clone()
phone2.title = "Iphone 13 PRo"
phone2.title
phone1.title
