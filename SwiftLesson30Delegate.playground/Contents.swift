import Foundation

// ex1

class Patient {
    
    var name: String
    var temperature: Double
    var delegate: PatientDelegate?
    
    func howAreYou() -> Bool {
        let random = Int(arc4random() % 2)
        let iFeelGood = random == 0 ? false : true
        
        if !iFeelGood {
            self.delegate?.patientFeelsBad(patient: self)
        }
        
        return iFeelGood
    }
    
    func takePill()  {
        print("\(self.name) take a pill")
    }
    
    func makeShot() {
        print("\(self.name) make a shot")
    }
    
    init(name: String, temperature: Double) {
        self.name = name
        self.temperature = temperature
    }
}


class Doctor: PatientDelegate {
    
    func patientFeelsBad(patient: Patient) {
        print("Patient \(patient.name) feels bad")
        
        if patient.temperature >= 37.0 && patient.temperature <= 39.0 {
            patient.takePill()
        } else if patient.temperature > 39.0 {
            patient.makeShot()
        } else {
            print("Patient \(patient.name) should rest")
        }
    }
    
    func patient(_ patient: Patient, hasQuastion quastion: String) {
        print("Patient \(patient.name) has a quastion: \(quastion)")
    }
}

protocol PatientDelegate {
    func patientFeelsBad(patient: Patient)
    func patient(_ patient: Patient, hasQuastion quastion: String)
}


var doctor = Doctor()

var patient1 = Patient(name: "Vova", temperature: 36.6)
var patient2 = Patient(name: "Petya", temperature: 40.2)
var patient3 = Patient(name: "Dima", temperature: 38.4)
var patient4 = Patient(name: "Ira", temperature: 37.2)

patient1.delegate = doctor
patient2.delegate = doctor
patient3.delegate = doctor
patient4.delegate = doctor

print("are you ok? \(patient1.name) \(patient1.howAreYou() ? "Yes" : "No")")
print("are you ok? \(patient2.name) \(patient2.howAreYou() ? "Yes" : "No")")
print("are you ok? \(patient3.name) \(patient3.howAreYou() ? "Yes" : "No")")
print("are you ok? \(patient4.name) \(patient4.howAreYou() ? "Yes" : "No")")

// ex2

protocol RouterDelegate {
    var nameID: [String] { get set }
    func saveMessage(name: String, text: String)
}

protocol UsersProtocol {
    var name: String { get set }
    var age: Int { get set }
    
    func sendMail(name: String, text: String) -> Bool
    
    init(name: String, age: Int, delegate: RouterDelegate?)
}


class Router: RouterDelegate {
    var nameID: [String] = []
    
    func saveMessage(name: String, text: String) {
        nameID.append(name)
        nameID.append(text)
    }
}

class User: UsersProtocol {
    var name: String
    var age: Int
    var delegate: RouterDelegate?
    
    func sendMail(name: String, text: String) -> Bool {
        delegate?.saveMessage(name: name, text: text)
        return true
    }
    
    required init(name: String, age: Int, delegate: RouterDelegate?) {
        self.name = name
        self.age = age
        self.delegate = delegate
    }
}

var router = Router()

var user = User(name: "Orest", age: 20, delegate: router)

user.sendMail(name: "Ira", text: "Hello")
user.sendMail(name: "Dima", text: "Hi")

router.nameID

// ex3

// Создать 2 протокола:
//1- "Начинай писать код" со свойствами: время, количество кода.
//И функцией writeCode()
//2- "Заканчивай писать код" с функцией: stopCoding()
//
//И класс: Разработчик, у которого есть свойства - количество программистов, специализации(ios, android, web).
//Разработчику подключаем два этих протокола.
//Задача: вывести в консоль сообщения - "разработка началась. пишем код" и "работа закончена. Сдаю в тестирование".

protocol StartToWriteCode {
    var time: String { get set }
    var codeAmount: Int { get set }
    
    func writeCode(time: String, code: String)
}


protocol StopToWriteCode {
    func stopCoding()
}


class Developer: StartToWriteCode, StopToWriteCode {
    var programistCount: Int
    var code: String = ""
    
    enum Specialization: String {
        case ios = "iOs"
        case android = "androind"
        case web = "web"
        case cpp = "C++"
    }
    
    var specialization: Specialization
    
    var time: String = ""
    var codeAmount: Int = 0
    
    func writeCode(time: String, code: String) {
        self.time = time
        self.code = code
        self.codeAmount = code.characters.count
        print("Developing started, writting a code")
    }
    
    func stopCoding() {
        print("Work is done, start testing")
    }
    
    init(programistCount: Int, specialization: Specialization) {
        self.programistCount = programistCount
        self.specialization = specialization
    }
}

var dev = Developer(programistCount: 5, specialization: .cpp)

dev.writeCode(time: "10:00", code: "#include iostream; using namespace std; int main{ cout << \("Hello world") << endl; }")
dev.codeAmount
dev.specialization.rawValue
dev.stopCoding()


