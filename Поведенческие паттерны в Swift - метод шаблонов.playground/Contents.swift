import UIKit

///Behavioral patterns in Swift - the pattern method

struct Bait {
    var title: String
    var weight: Double
}

struct Fish {
    let title: String
}

protocol FishingTemplate {
    func add(bait: Bait)
    func throwBait()
    func waiiting()
    func returnFish() -> Fish?
}

extension FishingTemplate {
    func fishing(bait: Bait) -> Fish? {
        add(bait: bait)
        throwBait()
        waiiting()
        return returnFish()
    }
}

class SpinningFisher: FishingTemplate {
    var wobler: Bait?
    var fishes: [Fish?] = [Fish(title: "Okyn"), nil, Fish(title: "Sydak"), nil, Fish(title: "Shyka"), nil]
    
    func add(bait: Bait) {
        self.wobler = bait
        print("Bait \(bait.title) added")
    }
    
    func throwBait() {
        print("Spinning with baut \(self.wobler!.title) throw")
    }
    
    func waiiting() {
        print("Waiting")
    }
    
    func returnFish() -> Fish? {
        let index = Int.random(in: 0...(fishes.count - 1))
        let fish = fishes[index]
        print(fish?.title)
        return fishes[index]
    }
}

let spinning = SpinningFisher()
spinning.fishing(bait: Bait(title: "Green wobler", weight: 40))
