// 1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур

enum Figure {
    enum Name: String{
        case king // король
        case queen // ферзь
        case rook // ладья
        case bishop //офіцер, слон
        case knight //конь
        case pawn // пешка
    }
    
    enum Colour: String {
        case black
        case white
    }
    
    enum Char: Int{
        case a = 1
        case b
        case c
        case d
        case e
        case f
        case g
        case h
    }
    
    enum Number: Int {
        case one = 1, two, three, four, five, six, seven, eight
    }
}
typealias Chess = (name: Figure.Name, colour: Figure.Colour, char: Figure.Char, number: Figure.Number)



let king = Chess(name: .king, colour: .black, char: .b, number: .two)
let queen = Chess(name: .queen, colour: .white, char: .b, number: .four)
let pawn = Chess(name: .pawn, colour: .white, char: .a, number: .one)
let rook = Chess(name: .rook, colour: .black, char: .c, number: .five)
let knight = Chess(name: .knight, colour: .white, char: .e, number: .five)
let pawn1 = Chess(name: .pawn, colour: .white, char: .e, number: .one)
let bishop = Chess(name: .bishop, colour: .black, char: .d, number: .eight)
let pawn3 = Chess(name: .pawn, colour: .black, char: .a, number: .four)
let pawn2 = Chess(name: .pawn, colour: .black, char: .f, number: .two)


var arrayChess = [king, queen, pawn, rook, knight, pawn1, pawn2, pawn3, bishop]


// 2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.

///// for debug
/*func outPut(figure: Chess) {
    print("name: \(figure.name.rawValue)" +
        "\t colour: \(figure.colour.rawValue)" +
        "\t position: number:\(figure.number.rawValue), char:\(figure.char.rawValue)")
}*/

func outPut(figure: Chess) {
    print("name: \(figure.name.rawValue)      " +
        "\t colour: \(figure.colour.rawValue)" +
        "\t position: \(figure.char)\(figure.number.rawValue)")
}

func outPut(figures: [Chess]) {
    for figure in figures {
    outPut(figure: figure)
    }
}

//outPut(figure: king)
//outPut(figures: arrayChess)

// 3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)

func sortChessArray(figures: inout [Chess]) {
    
    for i in 1..<figures.count {
        for j in 0..<figures.count - i {
            if (figures[j].number.rawValue > figures[j + 1].number.rawValue) ||
                (figures[j].number.rawValue == figures[j + 1].number.rawValue &&
                figures[j].char.rawValue > figures[j + 1].char.rawValue) {
                let temp = figures[j]
                figures[j] = figures[j + 1]
                figures[j + 1] = temp
            }
        }
    }
}

func defineFigure(figure: (Chess)) -> String {
    var searchedFigure = ""
    
    switch figure {
        case (.king, let colour, _, _): searchedFigure = colour == .white ?  "\u{2654}" : "\u{265a}"
        case (.queen, let colour, _, _): searchedFigure = colour == .white ?  "\u{2655}" : "\u{265b}"
        case (.rook, let colour, _, _): searchedFigure = colour == .white ?  "\u{2656}" : "\u{265c}"
        case (.bishop, let colour, _, _): searchedFigure = colour == .white ?  "\u{2657}" : "\u{265d}"
        case (.knight, let colour, _, _): searchedFigure = colour == .white ?  "\u{2658}" : "\u{265e}"
        case (.pawn, let colour, _, _): searchedFigure = colour == .white ?  "\u{2659}" : "\u{265f}"
    }
    
    return searchedFigure
}

func printBoard(figures: [Chess]) {
    var strChess = [String]()
    var str = ""
    var figuresInFunction = figures
    var count = 0
    sortChessArray(figures: &figuresInFunction)
    
    print("  a  b  c  d  e  f  g  h")
    
    for i in 1...8 {
        str = "\(i) "
        for j in 1...8 {
            switch figuresInFunction[count] {
                case (_, _, let char, let number) where number.rawValue == i && char.rawValue == j:
                    str += defineFigure(figure: figuresInFunction[count]) + " "
                if count < figuresInFunction.count - 1 {
                    count += 1
                    }
            default: str +=  i % 2 == j % 2 ? "\u{2b1b} " : "\u{2b1c} "
            }
        }
    
        strChess.insert(str, at: 0)
        str = ""
    }
    for i in 0..<strChess.count {
        print(strChess[i])
    }
    print("  a  b  c  d  e  f  g  h")
}

outPut(figures: arrayChess)
printBoard(figures: arrayChess)

