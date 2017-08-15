import Foundation


//  1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У него есть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате

let blackSquare = "\u{2B1B}"
let whiteSquare = "\u{2B1C}"
let playerEmoji = "\u{1F60E}"
let boxEmoji = "\u{1F4E6}"
let enemyEmoji = "\u{2757}"


enum Direction {
    case Left, Right, Up, Down
}

struct Room {
    var w: Int
    var h: Int
}
var room = Room(w: 5, h: 5)

struct Box {
    var x: Int {
        didSet {
            if x < 0 || x > room.w {
                x = oldValue
            }
        }
    }
    var y: Int {
        didSet {
            if y < 0 || y > room.h {
                y = oldValue
            }
        }
    }
    mutating func moveBy(direction: Direction) {
        switch direction {
        case .Left: x -= 1
        case .Right: x += 1
        case .Up: y -= 1
        case .Down: y += 1
        }
    }
}
var box = Box(x: 4, y: 4)

struct Player {
    var x: Int {
        didSet {
            if x < 0 || x > room.w {
                x = oldValue
            }
        }
    }
    var y: Int {
        didSet {
            if y < 0 || y > room.h {
                y = oldValue
            }
        }
    }
    mutating func moveBy(direction: Direction) {
        switch direction {
        case .Left: x -= 1
        case .Right: x += 1
        case .Up: y -= 1
        case .Down: y += 1
        }
        
        if (x, y) == (box.x, box.y) {
            box.moveBy(direction: direction)
        }
        if (x, y) == (box.x, box.y) {
            switch direction {
            case .Left: x += 1
            case .Right: x -= 1
            case .Up: y += 1
            case .Down: y -= 1
            }
        }
    }
}
var player = Player(x: 0, y: 0)

struct Enemy {
    var x: Int
    var y: Int
}
var enemy = Enemy(x: 1, y: 2)

func showRoom(room: Room, player: Player, box: Box) {
    
    var arrStr = [String]()
    var tmpStr = ""
    
    func drawWall() {
        for _ in 0...room.w + 2 {
            tmpStr += blackSquare
        }
        print(tmpStr)
    }
    
    drawWall()
    for i in 0...room.h {
        tmpStr = blackSquare
        
        for j in 0...room.w {
            
            if i == player.y && j == player.x {
                tmpStr += playerEmoji
            } else if i == box.y && j == box.x {
                tmpStr += boxEmoji
            } else if i == enemy.y && j == enemy.x {
                tmpStr += enemyEmoji
            } else {
                tmpStr += whiteSquare
            }
        }
        tmpStr += "\u{2B1B}"
        arrStr.append(tmpStr)
        tmpStr = ""
    }
    for i in 0...room.h {
        print(arrStr[i])
    }
    drawWall()
}


//2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз. Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически



//3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.


//4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)

//5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)


func play() {
    var letter = ""
    print("To move, use a,s,d,w + Enter")
    
    repeat {
        showRoom(room: room, player: player, box: box)
        
        if (box.x, box.y) == (enemy.x, enemy.y) {
            print("YOU WIN!!!!!!!!!!!!!!!!!!")
            break
        } else {
            letter = readLine() ?? "q"
        }
        
        switch letter.lowercased() {
        case "w": player.moveBy(direction: .Up)
        case "s": player.moveBy(direction: .Down)
        case "a": player.moveBy(direction: .Left)
        case "d": player.moveBy(direction: .Right)
        default: letter = ""
        }
    }
        while letter != "q"
}

play()











