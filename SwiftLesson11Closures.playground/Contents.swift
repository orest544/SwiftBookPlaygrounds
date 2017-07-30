// 1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.

func test (testClosure: () -> ()){ // функція нічого не приймає і не вертає обовязково писати () -> () а не ()
    for i in 0...10 {
        print("\(i)")
        testClosure()
    }
}

test {
    print("hi i am closure")
}

//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.

var arrayNumbers = [1,4,6,3,2,4,62,1,62,3,2]

func sortBubble(array: inout [Int], compare: (Int, Int) -> Bool) {
    for i in 1..<array.count {
        for j in 0..<array.count-i {
            if compare(array[j], array[j + 1]) {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
}
sortBubble(array: &arrayNumbers, compare: { (a: Int, b: Int) -> Bool in return a > b} )
// складна форма

sortBubble(array: &arrayNumbers) { $0 > $1 } //проста форма
arrayNumbers

var sortedArray = arrayNumbers.sorted() { $0 < $1 }
sortedArray

sortedArray = arrayNumbers.sorted() { $0 > $1 }
print(sortedArray)


//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.

//  используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.


func maxMinValue(array: [Int], f: (Int, Int?) -> Bool) -> Int {
    
    var optional: Int?
    
    for value in array {
        if f(value, optional) {
            optional = value
        }
    }
    return optional ?? 0 
}
let max =
maxMinValue(array: arrayNumbers) {
    $1 == nil || $0 < $1!
}

let min =
maxMinValue(array: arrayNumbers) {
    $1 == nil || $0 > $1!
}

//4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы

func priority(str: String) -> Int {
    switch str.lowercased() {
    case "a", "e", "i", "o", "u", "y": return 0
    case "b"..."z": return 1
    case "0"..."9": return 2
    default: return 3
    }
}

let text = "afsglm;kKJLIHBkhbj gvj1b4235k4534l6;kmrl,2,l,llfd,34opo3,,..loEOIJIW3L"

var strArray = [String]()

for char in text.characters {
    strArray.append(String(char))
}

let sortedText = strArray.sorted { //ми розширюєм функціонал метода сортед клоужером 
    switch(priority(str: $0), priority(str: $1)) {
    case let (x, y) where x < y: return true
    case let (x, y) where x > y: return false
    default: return $0.lowercased() <= $1.lowercased()
    }
}




