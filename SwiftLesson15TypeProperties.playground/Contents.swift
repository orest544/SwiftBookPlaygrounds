
/* 1. Создать структуру “Описание файла” содержащую свойства:
- путь к файлу
- имя файла
- максимальный размер файла на диске
- путь к папке, содержащей этот файл
- тип файла (скрытый или нет)
- содержимое файла (можно просто симулировать контент)

Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
*/


struct FileDescription {
    
    static let maxMemorySize = 15_360 //15mb
    
    var name: String
    var folderPath: String
    
    var size: Int {
        didSet {
            if size > FileDescription.maxMemorySize {
                size = oldValue
            }
        }
    }
    var isHidden: Bool
    var data: String
    
    var filePath: String {
        return folderPath + "/" + name
    }
    var description: String {
        print("Name: \(name)")
        print("Path: \(filePath)")
        print("Size: \(size / 1024) Mb (\(size)b)")
        isHidden ? print("Hidden") : print("Public")
        print("Content: \(data)")
        return ""
    }
}

var text = "Hello world"
var file = FileDescription(name: "text.txt", folderPath: "MacOs/Users/Orest/NewFolder", size: 13685, isHidden: true, data: text)

file.description



/*  2. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
- минимальный и максимальный возраст каждого объекта
- минимальную и максимальную длину имени и фамилии
- минимально возможный рост и вес
- самое интересное, создайте свойство, которое будет содержать количество созданных объектов
  этого класса
*/

class Human {
    static var objectsCount = 0
    
    static let maxNameLenght = 20
    static let minNameLenght = 2

    static let maxAge = 120
    static let minAge = 6
    
    static let minHeight: Float = 70.0
    static let minWeight: Float = 20.0
    
    var firstName: String {
        didSet {
            if firstName.characters.count > Human.maxNameLenght || firstName.characters.count < Human.minNameLenght {
                firstName = oldValue
            }
        }
    }
    var lastName: String {
        didSet {
            if lastName.characters.count > Human.maxNameLenght || lastName.characters.count < Human.minNameLenght {
                lastName = oldValue
            }
        }

    }
    var age: Int {
        didSet {
            if age > Human.maxAge || age < Human.minAge {
                age = oldValue
            }
        }

    }
    var height: Float {
        didSet {
            if height < Human.minHeight {
                height = oldValue
            }
        }
    }
    var weight: Float {
        didSet {
            if weight < Human.minWeight {
                weight = oldValue
            }
        }
    }

    init(firstName: String, lastName: String, age: Int, height: Float, weight: Float) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.weight = weight
        
        Human.objectsCount += 1
    }
}

let human1 = Human(firstName: "Orest", lastName: "Patlyka", age: 20, height: 184.0, weight: 72.5)

print("\nFirst name: \(human1.firstName), Last name: \(human1.lastName), Age: \(human1.age) Height: \(human1.height), Weight: \(human1.weight)")
print("Count of objects: \(Human.objectsCount)")

human1.firstName = "Orestfgdgddhdfhdhfdfsdfddhd"
human1.lastName = "Komarynska"
human1.age = 149
human1.height = 50
human1.weight = 86

print("\nFirst name: \(human1.firstName), Last name: \(human1.lastName), Age: \(human1.age) Height: \(human1.height), Weight: \(human1.weight)")
print("Count of objects: \(Human.objectsCount)")

let human2 = Human(firstName: "Ira", lastName: "Komarynska", age: 20, height: 168.0, weight: 48)
let human3 = Human(firstName: "Dima", lastName: "Danylyshyn", age: 20, height: 188.0, weight: 81.5)

print("Count of objects: \(Human.objectsCount)")
