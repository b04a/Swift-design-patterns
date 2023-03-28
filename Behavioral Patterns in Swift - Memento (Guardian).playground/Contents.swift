import UIKit

///Behavioral Patterns in Swift - Memento (Guardian)

///The Guardian
class Memento {
    private var content: String
    
    init(content: String) {
        self.content = content
    }
    
    func getContent() -> String {
        return self.content
    }
}

///Editor
class Editor {
    var content: String = ""
    
    func typing(string: String) {
        self.content += string
    }
    
    func getContent() -> String {
        return self.content
    }
    
    func save() -> Memento {
        return Memento(content: self.getContent())
    }
    
    func retrieve(memento: Memento) {
        self.content = memento.getContent()
    }
}

let note = Editor()
note.typing(string: "Let`s go lesson!")
let save1 = note.save()
note.typing(string: "\nSwift pretty >3")
let save2 = note.save()

note.retrieve(memento: save1)
note.getContent()
note.retrieve(memento: save2)
print(note.getContent())



























