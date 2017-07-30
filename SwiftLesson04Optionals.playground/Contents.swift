var apples : Int? = 5

//apples = nil

if apples == nil {
    print("nil apples")
} else {
    //print(apples)
    let a = apples! + 2
}

if var number = apples {
    number = number + 2
}

let age = "60"

if Int(age) != nil {
    let ageNumber = Int(age)
}

if let ageNumber = Int(age){
    ageNumber
}

//Int
//Int?
//Int!

var apples2: Int! = nil

apples2 = 2

//assert(apples2 != nil, "oh, no!!!")

apples2 = apples2 + 2

/*
>>>>>>>>>>>>>>>
HOMEWORK
>>>>>>>>>>>>>>>
*/

// 1st task

let number1  = "50"
let number2  = "23rs"
let number3  = "45"
let number4  = "45oo"
let number5  = "22"

var sum = 0

// forced unwrapping
var temp = Int(number1) // adding a var to avoid a secont call of Int(number)
if temp == nil {
    print("Input is'n correct")
} else {
    sum = sum + temp!
}

temp = Int(number2)
if temp == nil {
    print("Input is'n correct")
} else {
    sum = sum + temp!
}

temp = Int(number3)
if temp == nil {
    print("Input is'n correct")
} else {
    sum = sum + temp!
}

temp = Int(number4)
if temp == nil {
    print("Input is'n correct")
} else {
    sum = sum + temp!
}

temp = Int(number5)
if temp == nil {
    print("Input is'n correct")
} else {
    sum = sum + temp!
}

//optional binding
sum = 0

if let optional = Int(number1){
    sum = sum + optional
}

if let optional = Int(number2){
    sum = sum + optional
}

if let optional = Int(number3){
    sum = sum + optional
}

if let optional = Int(number4){
    sum = sum + optional
}

if let optional = Int(number5){
    sum = sum + optional
}

//2nd task
//Server Tuple

/*var statusCode = 299
var message : String?
var errorMessage : String?
*/
var serverAnswer : (statusCode: Int, message: String?, errorMessage: String?) = (302, nil, nil)

if serverAnswer.statusCode >= 200 && serverAnswer.statusCode < 300 {
    serverAnswer.errorMessage = nil
    serverAnswer.message = "Message received"
    print(serverAnswer.message!)
} else {
    serverAnswer.message = nil
    serverAnswer.errorMessage = "Error"
    print(serverAnswer.errorMessage!)
}

//3nd task

var student1 : (name: String, numberOfCar: String?, mark: Int?) = ("", nil, nil)
var student2 : (name: String, numberOfCar: String?, mark: Int?) = ("", nil, nil)
var student3 : (name: String, numberOfCar: String?, mark: Int?) = ("", nil, nil)
var student4 : (name: String, numberOfCar: String?, mark: Int?) = ("", nil, nil)
var student5 : (name: String, numberOfCar: String?, mark: Int?) = ("", nil, nil)

student1.name = "Orest"
student2.name = "Pavlo"
student3.name = "Petro"
student4.name = "Dima"
student5.name = "Vasul"

student1.numberOfCar = "BC6685CB"
student2.numberOfCar = "DF1233FF"
student4.numberOfCar = "OD4355FO"

student2.mark = 4
student3.mark = 5


print("\n")
print("Name of student: \(student1.name)")

if student1.numberOfCar != nil {
    print("Number of car: \(student1.numberOfCar!)")
} else {
    print("Student is'n have a car")
}


if student1.mark != nil {
    print("Student mark: \(student1.mark!)")
} else {
    print("Student has not been on pair")
}





