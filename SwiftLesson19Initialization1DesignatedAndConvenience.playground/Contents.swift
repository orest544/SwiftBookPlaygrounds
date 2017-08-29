class Being {
    var canMove: Bool
    var haveBlood: Bool
    
    init(canMove: Bool, haveBlood: Bool) {
        self.canMove = canMove
        self.haveBlood = haveBlood
    }
}

class Human: Being {
    var firstName: String {
        didSet {
            if firstName.characters.count > 20 {
                firstName = oldValue
            }
        }
    }
    var lastName: String {
        didSet {
            if firstName.characters.count > 20 {
                firstName = oldValue
            }
        }
    }
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        
        super.init(canMove: true, haveBlood: true)
    }
    override convenience init(canMove: Bool, haveBlood: Bool) {
        self.init()
        
        self.canMove = canMove
        self.haveBlood = haveBlood
    }
    convenience init(firstName: String) {
        self.init(firstName: firstName, lastName: "")
    }
    convenience init(lastName: String) {
        self.init(firstName: "", lastName: lastName)
    }
    convenience init() {
        self.init(firstName: "")
    }
}

class Student: Human {
    var course: Int
    
    init(firstName: String, lastName: String, course: Int) {
        self.course = course
        
        super.init(firstName: firstName, lastName: lastName)
    }
    
    override convenience init(firstName: String, lastName: String) {
        self.init(firstName: firstName, lastName: lastName, course: 0)
    }
    convenience init(lastName: String, course: Int) {
        self.init(firstName: "", lastName: lastName, course: course)
    }
}

let student1 = Student(firstName: "Orest", lastName: "Patlyka", course: 4)
student1.haveBlood = false

let student2 = Student(lastName: "Komarynska", course: 4)
let student3 = Student(firstName: "Bogdan", lastName: "Ptyts")


let human1 = Human(firstName: "Orest")
let human2 = Human(firstName: human1.firstName, lastName: student1.lastName)


