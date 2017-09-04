import Foundation

class Human {
    var weight: Int
    var age: Int
    
    init(weight: Int, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Int) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
    func test() {
        print("Hello world")
    }
}


enum Colour: Int {
    case Black
    case White
    
    init?(value: Int) {
        switch value {
        case 0: self = .Black
        case 1: self = .White
        default: return nil
        }
    }
}

let a = Colour(value: 1) //.White
//let b = Colour(rawValue: 1)


struct Size {
    var width: Int
    var height: Int
    
    //failable initializator
    init?(width: Int, height: Int){
        if width < 0 || height < 0 {
            return nil
        } else {
            self.width = width
            self.height = height
        }
    }
}


class Friend: Human {
    var name: String
    
    let skin: Colour = {
        let rand = Int(arc4random_uniform(2))
        return Colour(value: rand)!
    }()
    
    init?(name: String){
        if name.isEmpty {
            return nil
        } else {
            self.name = name
            super.init(weight: 0, age: 0)
        }
    }
    // Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer
    required init() {
        self.name = "Hi"
        super.init(weight: 0, age: 0)
    }
}

class BestFriend: Friend {
    
    override init(name: String) {
        if name.isEmpty {
            super.init()
        } else {
            super.init(name: name)!
        }
    }
    
    required init() {
        super.init()
    }
}

let b = BestFriend(name: "")
b.name

let f1 = Friend(name: "Orest")
f1?.skin

let f2 = Friend(name: "Ira")
f2?.skin








