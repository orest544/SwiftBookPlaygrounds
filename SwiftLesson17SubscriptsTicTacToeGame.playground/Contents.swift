//Шахматная доска (Легкий уровень)

//1. Создайте тип шахматная доска.

//2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).

//3. Если юзер ошибся координатами - выдавайте нил
import Foundation

struct ChessBoard {
    var letters = ["a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8]
    
    func checkInput(column: String, row: Int) -> Bool {
        return letters[column] != nil && (row > 0 && row <= 8)
    }
    
    subscript(column: String, row: Int) -> String? {
        let column = column.lowercased()
        
        if checkInput(column: column, row: row) {
            return letters[column]! % 2 == row % 2 ? "Black" : "White"
        } else {
            return nil
        }
    }
}



var cell = ChessBoard()

cell["A", 1]
cell["a", 1]
cell["a", 10] // return nil


/*
Крестики нолики (Средний уровень)

1. Создать тип, представляющий собой поле для игры в крестики нолики
На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
Добавьте возможность красиво распечатывать поле

2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.

3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.

4. Если хотите, добавте алгоритм, который вычислит победителя
*/

struct TicTacToe {
    var size: Int
    
    var field = [String?]()
    
    func showField() {
        func generateScope() -> String{
            var scope = ""
            let part = "----"
            
            for _ in 0..<size {
                scope += part
            }
            scope += "-"
            
            return scope
        }
        
        print(generateScope())
        for i in 0..<size {
            for j in 0..<size {
                print("| \(field[i * size + j] ?? " ")", terminator: " ")
            }
            print("|", terminator: "")
            print("\n\(generateScope())")
        }
    }
    
    func isFull() -> Bool{
        for value in field {
            if value == nil {
                return false
            }
        }
        return true
    }
    
    func isWin() -> Bool {
        var check = true
        
        // check for horizontal
        for i in 0..<size {
            check = true
            
            for j in 0..<size - 1 {
                if field[i * size + j] != field[i * size + (j + 1)] ||
                    (field[i * size + j] == nil || field[i * size + (j + 1)] == nil) {
                    check = false
                    break
                }
            }
            if check {
                break
            }
        }
        if check {
            return check
        }
        
        // check for vertical
        check = true
        
        for i in 0..<size {
            check = true
            
            for j in 0..<size - 1 {
                if field[j * size + i] != field[(j + 1) * size + i] ||
                    (field[j * size + i] == nil || field[(j + 1) * size + i] == nil) {
                    check = false
                    break
                }
            }
            if check {
                break
            }
        }
        if check {
            return check
        }
        
        // check for falling diagonal
        check = true
        
        for i in 0..<size - 1 {
            if field[i * size + i] != field[(i + 1) * size + (i + 1)] ||
                (field[i * size + i] == nil || field[(i + 1) * size + (i + 1)] == nil) {
                check = false
                break
            }
        }
        if check {
            return check
        }
        
        // check for rising diagonal
        check = true
        var _j = size - 1
        
        for i in 0..<size - 1 {
            if field[_j * size + i] != field[(_j - 1) * size + (i + 1)] ||
                (field[_j * size + i] == nil || field[(_j - 1) * size + (i + 1)] == nil) {
                check = false
                break
            }
            _j -= 1
        }
        if check {
            return check
        }
  
        return check
}

    subscript(column: Int, row: Int) -> String {
        get {
            if (column * size + row) < size*size - 1 {
                return field[column * size + row] ?? "Empty"
            } else {
                print("Out of range!!!")
                return ""
            }
        }
        
        set {
            let _newValue = newValue.uppercased()
            
            if (column * size + row) < size*size {
                if field[column * size + row] == nil && (_newValue == "X" || _newValue == "0") {
                    field[column * size + row] = _newValue
                }
            } else {
                print("Repeat your input!!!\nOut of range or wrong value")
            }
        }
    }
    
    init(size: Int) {
        self.size = size
        field = Array(repeating: nil, count: size*size)
    }
}



var ticTacToe = TicTacToe(size: 3)

func generateGame() {
    var turn = true
    
    repeat {
        let randColumn = Int(arc4random_uniform(UInt32(ticTacToe.size)))
        let randRow = Int(arc4random_uniform(UInt32(ticTacToe.size)))
        
        let tempField = ticTacToe.field
        
        ticTacToe[randColumn, randRow] = turn ? "X" : "0"
        
        for i in 0..<tempField.count {
            if tempField[i] != ticTacToe.field[i] {
                turn ? print("1st Player (X)") : print("2nd Player (0)")
                ticTacToe.showField()
                sleep(1)
                turn = !turn
            }
        }
    }
        while(!(ticTacToe.isWin() || ticTacToe.isFull()))
    
    if ticTacToe.isWin() {
        turn ? print("2nd Player (0) WINS!") : print("1st Player (X) WINS!")
    } else {
        print("Drawn game!")
    }
}

generateGame()
















