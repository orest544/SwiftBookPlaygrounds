// 1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально). Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.                                                     Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд

class Human {
    var father: Father?
    var mother: Mother?
    var brother: Brother?
    var sister: Sister?
    var pet: [Animal]?
}

class Man: Human {
    func moveSofa() {
        print("okey, ill move a sofa")
    }
}
class Woman: Human {
    func order(_ order: String) {
        print(order)
    }
}

class Mother: Woman {}
class Father: Man {}

class Sister: Woman {}
class Brother: Man {}


class Animal {
    func voice() {}
}

class Dog: Animal {
    override func voice() {
        print("woof woof")
    }
}
class Cat: Animal {
    override func voice() {
        print("meow meow")
    }
}
class Parrot: Animal {
    override func voice() {
        print("lee lee")
    }
}

var h1 = Man()
var h2 = Woman()
var h3 = Man()
var h4 = Man()
var h5 = Woman()
var h6 = Woman()
var h7 = Man()
var h8 = Man()
var h9 = Woman()
var h10 = Woman()
var h11 = Man()
var h12 = Woman()
var h13 = Woman()
var h14 = Man()
var h15 = Man()
var h16 = Woman()
var h17 = Man()
var h18 = Man()
var h19 = Woman()
var h20 = Woman()
var h21 = Man()
var h22 = Woman()
var h23 = Man()
var h24 = Man()
var h25 = Woman()
var h26 = Man()
var h27 = Man()
var h28 = Woman()
var h29 = Man()
var h30 = Woman()


h8.father = Father()
h8.father?.father = Father()
h8.father?.mother = Mother()

h8.mother = Mother()
h8.mother?.father = Father()
h8.mother?.mother = Mother()
h8.mother?.brother = Brother()

var h8GrandMother = h8.mother?.mother ?? Human()
var h8GrandFather = h8.father?.father ?? Human()
var h8Uncle = h8.mother?.brother ?? Human()

//2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
//У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
//Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.

h8.mother?.order("Move a sofa!")
h8.father?.moveSofa()

var arrayFamily = [h8, h8Uncle, h8GrandFather, h8GrandMother]

var menCount = 0
var womenCount = 0

for value in arrayFamily {
    switch value {
    case let someMan as Man:
        menCount += 1
        someMan.moveSofa()
    case let someWoman as Woman:
        womenCount += 1
        someWoman.order("move a sofa!")
    default: break
    }
}

print("number of men in array is: \(menCount)")
print("number of women in array is: \(womenCount)")

//3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
//Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
//Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
//Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.

var humans: [Human] = [h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16, h17, h18, h19, h20, h21, h22, h23, h24, h25, h26, h27, h28, h29, h30]
var pets = [Animal]()

h1.pet = [Dog(), Dog(), Parrot()]
h4.pet = [Cat()]
h8.pet = [Parrot()]
h8.pet?.append(Dog())
h10.pet = [Dog()]
h14.pet = [Cat()]
h18.pet = [Dog()]
h20.pet = [Parrot()]
h24.pet = [Cat()]
h24.pet?.append(Parrot())
h28.pet = [Dog()]

for human in humans {
    if let _pets = human.pet {
        for pet in _pets {
            pets.append(pet)
        }
    }
}

var dogCount = 0
var catCount = 0
var parrotCount = 0

for pet in pets {
    switch pet {
    case let someDog as Dog:
        dogCount += 1
        someDog.voice()
    case let someCat as Cat:
        catCount += 1
        someCat.voice()
    case let someParrot as Parrot:
        parrotCount += 1
        someParrot.voice()
    default: break
    }
}

print("number of dogs in array is: \(dogCount)")
print("number of cats in array is: \(catCount)")
print("number of parrots in array is: \(parrotCount)")






