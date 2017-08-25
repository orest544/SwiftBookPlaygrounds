// 1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление. Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"

class Artist {
    var firstName: String = ""
    var lastName: String = ""
   
    func action() {
        print("First name: \(firstName)\nLast name: \(lastName)")
    }
}

class Dancer: Artist {
    override func action() {
        super.action()
        print("Yo, dancer\n")
    }
}

class Singer: Artist {
    override func action() {
        super.action()
        print("Hello, like to singing\n")
    }
}

class Painter: Artist {
   
    override var firstName: String  {
        set {
            super.firstName = "Alex"
        }
        
        get {
            return super.firstName
        }
    }
    
    override func action() {
        super.action()
        print("Painting is my second love\n")
    }
}


let dancer = Dancer()
dancer.firstName = "Nikolai"
dancer.lastName = "Nikolavskyi"

let singer = Singer()
singer.firstName = "Petro"
singer.lastName = "Pietrenkovich"

let painter = Painter()
painter.firstName = "Orest"
painter.lastName = "Patlyka"


let arrayOfArtists = [dancer, singer, painter]

for value in arrayOfArtists {
    value.action()
}

//2. Базовый класс - "транспортное средство"; свойства - скорость, вместимость, стоимость одной перевозки (все computed properties). Несколько дочерних классов (самолет, корабль, вертолет, машина, поезд) с переопределенными свойствами (для каждого своя скорость вместимость и стоимость). Создать по одному объекту каждому дочернему классу. У всех есть метод, который что-то расчитывает (скорость, расстояние, количество пассажиров), конкретно сколько уйдет денег и времени, чтобы перевести определенное количество человек из пункта А в пункт В. При перевозке 100 и 1000 человек ответить на следующие вопросы:
//  -Как быстро мы сможем это сделать и каким транспортом?
//  -Стоимость всех перевозок и количество?
//  -Какой транспорт быстрее справится и какой более выгодный

class Vehicle {
    var speed: Double {
        return 0.0
    }
    var capacity: Int {
        return 0
    }
    var cost: Int {
        return 0
    }
    
    func tranportation(distance: Double, numberOfPeople: Int) -> (numberOfTrips: Int, cost: Int, time: Double) {
        let tripsCount = numberOfPeople % capacity > 0 ? numberOfPeople / capacity + 1 : numberOfPeople / capacity
        
        return (tripsCount, numberOfPeople * cost, (distance / speed) * Double(tripsCount))
    }
    func outPutInform(distance: Double, numberOfPeople: Int) {
        let transportationTuple = tranportation(distance: distance, numberOfPeople: numberOfPeople)
        
        print("***Distance: \(distance)\n***Number of people: \(numberOfPeople)")
        print("Number of trips: \(transportationTuple.numberOfTrips)")
        print("Total cost: \(transportationTuple.cost)$")
        print("Total time: \(transportationTuple.time) hours")
    }
}

class Plane: Vehicle {
    override var speed: Double {
        return 700.0
    }
    override var capacity: Int {
        return 200
    }
    override var cost: Int {
        return 100
    }
}

class Ship: Vehicle {
    override var speed: Double {
        return 80.0
    }
    override var capacity: Int {
        return 1000
    }
    override var cost: Int {
        return 150
    }
}

class Helicopter: Vehicle {
    override var speed: Double {
        return 300.0
    }
    override var capacity: Int {
        return 2
    }
    override var cost: Int {
        return 200
    }
}

class Car: Vehicle {
    override var speed: Double {
        return 70.0
    }
    override var capacity: Int {
        return 5
    }
    override var cost: Int {
        return 25
    }
}


let helicopter = Helicopter()
let ship = Ship()
let plane = Plane()
let car = Car()


let arrayOfVehicles = [car, helicopter, ship, plane]

for value in arrayOfVehicles {
    value.outPutInform(distance: 1000, numberOfPeople: 100)
    print()
}

//3. Пять классов: люди, собаки, жирафы, обезьяны и крокодилы. Сделайте по парочке объектов каждого класса. Создать такой родительский класс, который будет группировать их. Создать массив с рептилиями и посчитать их количество, потом также создать массив и посчитать сколько четвероногих, животных и живых. Массивы не содержат тип Any.

class Being {
    
}


class Animal: Being {

}


class Quadruped: Animal {

}
class Mammal: Animal {
   
}
class Reptile: Animal {

}


class Human: Being{
  
}

class Crocodile: Reptile{

}

class Dog: Mammal {
   
}

class Giraffe: Mammal {
   
}

class Monkey: Mammal {
   
}


let human1 = Human()
let human2 = Human()

let crocodile1 = Crocodile()
let crocodile2 = Crocodile()

let giraffe1 = Giraffe()
let giraffe2 = Giraffe()
let giraffe3 = Giraffe()

let monkey1 = Monkey()
let monkey2 = Monkey()
let monkey3 = Monkey()

let dog1 = Dog()
let dog2 = Dog()
let dog3 = Dog()
let dog4 = Dog()


let beings = [human1, human2, crocodile1, crocodile2, giraffe1, giraffe2, giraffe3, dog1, dog2, dog3, dog4, monkey1, monkey2, monkey3]
let reptiles = beings.filter({$0 is Reptile})
let quadrupeds = beings.filter({$0 is Giraffe || $0 is Dog || $0 is Crocodile})
let animals = beings.filter({$0 is Animal})

print("Amount of beings: \(beings.count)")
print("Amount of animals: \(animals.count)")
print("Amount of quadrupeds: \(quadrupeds.count)")
print("Amount of reptiles: \(reptiles.count)")


