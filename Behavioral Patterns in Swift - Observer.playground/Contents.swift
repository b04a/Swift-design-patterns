import UIKit

///Behavioral Patterns in Swift - Observer
protocol Observer {
    func getNewView(title: String)
}

protocol Subject {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notification(video: String)
}

class Bloger: Subject {
    var observers = NSMutableSet()
    var video: String = "" {
        didSet {
            notification(video: video)
        }
    }
    
    func add(observer: Observer) {
        observers.add(observer)
    }
    
    func remove(observer: Observer) {
        observers.remove(observer)
    }
    
    func notification(video: String) {
        for observer in observers {
            (observer as! Observer).getNewView(title: video)
        }
    }
}

///Class observed

class Subscriber: NSObject, Observer {
    var nickName: String
    
    init(nickName: String) {
        self.nickName = nickName
    }
    
    func getNewView(title: String) {
        print("User \(nickName) received new video")
    }
}

class Google: NSObject, Observer {
    func getNewView(title: String) {
        print("Video \(title) is loading")
    }
}

let vasya = Subscriber(nickName: "Vasya001")
let fedor = Subscriber(nickName: "Fed0r")
let google = Google()

let blogger = Bloger()
blogger.add(observer: vasya)
blogger.add(observer: fedor)
blogger.add(observer: google)


blogger.video = "Bebra"
blogger.remove(observer: vasya)

blogger.video = "GO!"
