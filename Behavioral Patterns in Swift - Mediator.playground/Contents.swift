import UIKit

///Behavioral Patterns in Swift - Mediator

protocol ChatRoomType {
    func sendMessage(user: User, message: String)
}

class CharRoom: ChatRoomType {
    func sendMessage(user: User, message: String) {
        let date = Date()
        let sender = user.getName()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyy hh:mm"
        let dateStr = formatter.string(from: date)
        
        print("\(dateStr)\n\(sender): \(message)\n")
    }
}

class User {
    let name: String
    var mediator: ChatRoomType?
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return self.name
    }
    
    func sendMessage(message: String) {
        guard let mediator = mediator else {
            print("We out chat")
            return
        }
        
        mediator.sendMessage(user: self, message: message)
    }
}

let chat = CharRoom()
let vasya = User(name: "Vasya")
let masha = User(name: "Masha")
vasya.mediator = chat
masha.mediator = chat


vasya.sendMessage(message: "Hello!")
masha.sendMessage(message: "Hi1")
