extension UInt64 {
    func binary() -> String {
        var result = ""
        for i in 0..<64 {
            let mask: UInt64 = 1 << i
            let set = self & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

extension UInt8 {
    func binary() -> String {
        var result = ""
        for i in 0..<8 {
            let mask: UInt8 = 1 << i
            let set = self & mask != 0
            result = (set ? "1" : "0") + result
        }
        return result
    }
}

//var a: UInt8 = 57
//var a: Int8 = 57
/*
 a.binary()
 
 a = 0b01111111
 a.binary()
 a = a &+ 1
 a.binary()
 a = a &+ 1
 a.binary()
 
 a = 0
 a = a - 1
 a.binary()
 a = a - 1
 a.binary()
 
 a = 0b00100001
 a = a &* 4
 a.binary()
 */

/*
 0b11111111
 0xff
 255
 */
/*
 a = 0b00111001
 a.binary()
 (5 as UInt8).binary()
 
 a = a + 0b00000101
 a.binary()
 (4 as UInt8).binary()
 a = a - 0b00000100
 a.binary()
 
 //a = a * 2
 //a = a << 2
 a = a * 4
 a = a &* 2
 a.binary()
 
 a = 0b11111111
 a = a &+ 1
 
 a = 0b00000000
 a = a &- 1
 a.binary()
 */
/*
var a: UInt8 = 0b00110011
var b: UInt8 = 0b11100001

a.binary()
b.binary()
(a | b).binary()

a.binary()
b.binary()
(a & b).binary()

a.binary()
b.binary()
(a ^ b).binary()

a.binary()
(~a).binary()

b = 0b00010000
a.binary()
b.binary()
(a & b).binary()

b = 0b00000010
a.binary()
b.binary()
(a | b).binary()

a.binary()
b.binary()
(a ^ b).binary()

b = 0b00010000
a.binary()
(~b).binary()
(a & ~b).binary()
*/

enum CheckList : UInt8 {
    case Bread =    0b00000001
    case Chicken =  0b00000010
    case Apples =   0b00000100
    case Pears =    0b00001000
}

let checkList1: UInt8 = 0b00001001
let bread = checkList1 & CheckList.Bread.rawValue
bread.binary()

let chicken = checkList1 & CheckList.Chicken.rawValue
chicken.binary()

let pears = checkList1 & CheckList.Pears.rawValue
pears.binary()

//1. Расширьте енум из урока и добавьте в него метод, помогающий установить соответствующий бит в переданную маску и метод, помогающий его прочитать. Эти методы должны принимать и возвращать маску, либо принимать адрес маски и менять его


extension CheckList {
    static func add(checkList: inout UInt8, food: CheckList) {
        checkList = checkList | food.rawValue
    }
    
    static func showList(checkList: UInt8) {
        var list = "List: "
        
        for i in 0..<8 {
            let mask: UInt8 = 1 << i
            if (checkList & mask != 0) {
                switch mask {
                case _ where CheckList.Bread.rawValue & mask != 0: list += "Bread, "
                case _ where CheckList.Chicken.rawValue & mask != 0: list += "Chicken, "
                case _ where CheckList.Apples.rawValue & mask != 0: list += "Apples, "
                case _ where CheckList.Pears.rawValue & mask != 0: list += "Pears"
                default: break
                }
            }
        }
        
        print(list)
    }
    
    
}

var myList: UInt8 = 0b0000_0000

CheckList.add(checkList: &myList, food: .Apples)
myList.binary()

CheckList.add(checkList: &myList, food: .Bread)
CheckList.add(checkList: &myList, food: .Pears)
myList.binary()

CheckList.add(checkList: &myList, food: .Chicken)

CheckList.showList(checkList: myList)

//2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида

func showSinusoid() {
    var number: UInt8 = 0b0000_0001
    var count = 0
    var check = true
    
    repeat {
        if check {
            for _ in 0..<7 {
                print(number.binary())
                number = number << 1
            }
        } else {
            for _ in 0..<7 {
                print(number.binary())
                number = number >> 1
            }
        }
        check = !check
        count += 1
    }
        while(count < 6)
}

//showSinusoid()

//3. Создайте 64х битное число, которое представляет клетки на шахматной доске. Установите биты так, что 0 - это белое поле, а 1 - черное. Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4). Выбирая клетки но индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита

var chessBoard: UInt64 = 0
var check = false

for i in 0..<8 {
    check = !check
    for j in 0..<8 {
        if check {
            let mask: UInt64 = 1 << (i*8 + j)
            chessBoard = chessBoard | mask
        }
        check = !check
    }
}

func cell(column: String, row: Int) -> String {
    var column = column
    column = column.lowercased()
    let row = row - 1
    let dictColumns = ["a" : 0, "b" : 1, "c" : 2, "d" : 3, "e" : 4, "f" : 5, "g" : 6, "h" : 7]
    
    if dictColumns[column] != nil && row >= 0 && row <= 7 {
        let mask: UInt64 = 1 << UInt64((8 * dictColumns[column]! + row))
        return chessBoard & mask != 0 ? "Black" : "White"
    } else {
        return "Invalid input"
    }
}

cell(column: "f", row: 6)


func printChessBoard(board: UInt64) {
    let blackSquare = "\u{2b1b}"
    let whiteSquare = "\u{2b1c}"
    
    for i in 0..<64 {
        let mask: UInt64 = 1 << i
        board & mask != 0 ? print(whiteSquare, terminator: " ") : print(blackSquare, terminator: " ")
        
        if (i+1) % 8 == 0 {
            print()
        }
    }
}

printChessBoard(board: chessBoard)
