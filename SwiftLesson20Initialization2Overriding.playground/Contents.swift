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

class Student: Human {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        
        super.init(weight: 0, age: 0)
    }
    
    convenience init(firstName: String, lastName: String, weight: Int, age: Int) {
        self.init(firstName: firstName, lastName: lastName)
        
        self.weight = weight
        self.age = age
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
    }
    
    convenience override  init(weight: Int, age: Int) {
        self.init(firstName: "")
        
        self.weight = weight
        self.age = age
    }
}

class Doctor: Student {
    var fieldOfStudy: String
    
    init(fieldOfStudy: String) {
        self.fieldOfStudy = fieldOfStudy
        
        super.init(firstName: "Doctor", lastName: "House")
    }
    
    convenience override init(firstName: String, lastName: String) {
        self.init(fieldOfStudy: "Health")
        
        self.firstName = firstName
        self.lastName = lastName
    }
}

let d1 = Doctor(fieldOfStudy: "")
let d2 = Doctor(firstName: "Orest", lastName: "Patlyla", weight: 72, age: 20)
d2.fieldOfStudy = "Science"
d1.test()
