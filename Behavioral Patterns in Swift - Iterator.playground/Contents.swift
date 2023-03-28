import UIKit

///Behavioral Patterns in Swift - Iterator

class Track: Equatable {
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    static func == (lhs: Track, rhs: Track) -> Bool {
        lhs.title == rhs.title
    }
    
    func getTitle() -> String {
        return title
    }
}

protocol Iterator {
    associatedtype Item
    
    var container: [Item] { get }
    var counter: Int { get }
    var count: Int { get }
    var current: Item? { get }
    
    func add(_ item: Item)
    func remove(_ item: Item)
    func next()
    func previous()
    func rewind()
    func valid() -> Bool
}

class Playlist: Iterator {
    typealias Item = Track
    var container: [Track] = []
    var counter: Int = 0
    var count: Int {
        return container.count
    }
    var current: Track? {
        if count > 0 {
            return container[counter]
        } else {
            return nil
        }
    }
    
    func add(_ item: Track) {
        container.append(item)
    }
    
    func remove(_ item: Track) {
        for (index, track) in container.enumerated() {
            if track == item {
                container.remove(at: index)
                break
            }
        }
    }
    
    func next() {
        if valid() {
            counter += 1
        } else {
            counter = 0
        }
    }
    
    func previous() {
        if counter > 0 {
            counter -= 1
        } else {
            counter = self.count - 1
        }
    }
    
    func rewind() {
        counter = 0
    }
    
    func valid() -> Bool {
        self.counter < self.count - 1
    }
}

let punk = Playlist()
let always = Track(title: "Always")
let atst = Track(title: "All the small things")
let rockShow = Track(title: "The Rock Show!")
punk.add(always)
punk.add(atst)
punk.add(rockShow)
punk.count
punk.current?.getTitle()
punk.next()
punk.current?.getTitle()
punk.next()
punk.current?.getTitle()
punk.next()
punk.current?.getTitle()

punk.previous()
punk.current?.getTitle()
