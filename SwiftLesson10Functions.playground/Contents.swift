 
//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.


func lol() -> Character {
    return "\u{1F605}"
}

func kiss() -> Character {
    return "\u{1F618}"
}

func muscle() -> Character {
    return "\u{1F4AA}"
}

//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль


func chessCell(letter xStr: String?, number xNumber: Int?, y: Int) -> String {
    
    let dictCell = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8]
    var horizontal = 0
    var bool: Bool
    
    if xStr != nil && dictCell[xStr!] != nil{
        horizontal = dictCell[xStr!]!
    } else if xNumber == nil {
        return "ERROR! range is only a...h, if u want more, input number!!!"
    }
    
    
    /*if xStr != nil {
        bool = horizontal % 2 == y % 2
    } else {
        bool = xNumber! % 2 == y % 2
    }*/
    bool = (xStr != nil) ? horizontal % 2 == y % 2 : xNumber! % 2 == y % 2
    
    /*
    if bool {
        return "Black"
    } else {
        return "White"
    }*/
    
    return bool ? "Black" : "White"
}

let result = chessCell(letter: "a", number: nil, y: 1)

// 3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.


func reverseArray(_ array: [Int]) -> [Int] {
    
    var tempArray = [Int]()
    
    for value in array {
        tempArray.insert(value, at: 0)
    }
    
    return tempArray
}

func reverseRange(_ range: Int...) -> [Int] {
    
    return reverseArray(range)
}

var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
reverseArray(array)
array

reverseRange(1, 2, 3, 4, 5, 6, 7, 8, 9)

//4. Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

func reverseArray(yourArray array: inout [Int]) {
   /*
    var count = array.count - 1
    var temp = 0
    
    for i in 0..<array.count/2 {
        temp = array[i]
        array[i] = array[count]
        array[count] = temp
        count -= 1
    }*/
    var tempArray = [Int]()
    
    for value in array {
        tempArray.insert(value, at: 0)
    }
    array = tempArray
}

reverseArray(yourArray: &array)

//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)

func textEditor(yourText text: String) -> String {
    
    let text = text.lowercased()
    let numbers : [Character: String] = ["0": "zero", "1": "one", "2": "two", "3": "three", "4": "four", "5": "five", "6": "six", "7": "seven", "8": "eight", "9": "nine"]
    var resultStr = String()
    
    for char in text.characters {
        switch char {
            
        case "0"..."9":
            resultStr += numbers[char]!
        case "b"..."d", "f"..."h", "j"..."n", "p"..."t","v"..."x", "z":
            resultStr += String(char)
        case "a", "e", "i", "o", "u", "y":
            resultStr += String(char).uppercased()
        case " ":
            resultStr += " "
            
        default:
            break
        }
    }
    return resultStr
}

var text = "Hello my name is Orest. I am 19 years old. I'm from Lviv. Lviv is the country in Ukraine. I would like to be a programmer in the future. Now I am studing a Swift. My lover is Ira. I want to be a man for her."
print(text)
print("")
print(textEditor(yourText: text))






