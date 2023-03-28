import UIKit

///Behavioral Patterns in Swift - Command

///Client - отдает команду
///Invoker - тот кто принимает и распределяет
///Reseiver - исполнитель
///Command - сама команда


///Command - сама команда
protocol Command {
    func execute()
}

///Reseiver - исполнитель
class Cooker {
    func prepareBorsh() {
        print("Making eat")
    }
}

class Barista {
    func prepareCoffie() {
        print("Making coffie")
    }
}

///Invoker
class Officiant {
    func submit(command: Command) {
        command.execute()
    }
}

///Client
class Client {
    var officiant: Officiant?
    
    func order(command: Command) {
        guard let officiant = officiant else {
            print("The waiter didn't come.")
            return
        }
        officiant.submit(command: command)
    }
}

class PrepareOrder: Command {
    var cooker = Cooker()
    func execute() {
        cooker.prepareBorsh()
    }
}


class PrepareOrder2: Command {
    var barista = Barista()
    func execute() {
        barista.prepareCoffie()
    }
}

let client = Client()
let officiant = Officiant()
client.officiant = officiant
client.order(command: PrepareOrder())
client.order(command: PrepareOrder2())
client.officiant = nil
client.order(command: PrepareOrder2())
