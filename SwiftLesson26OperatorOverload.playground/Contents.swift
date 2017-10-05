/*
struct Point {
    var x : Int
    var y : Int
}

var p1 = Point(x: 2, y: 3)
var p2 = Point(x: 3, y: 5)

func + (a: Point, b: Point) -> Point {
    return Point(x: a.x + b.x, y: a.y + b.y)
}

func * (a: Point, b: Point) -> Point {
    return Point(x: a.x * b.x, y: a.y * b.y)
}

p1 + p2
p1
p2

p1 * p2
p1
p2

p1 = p1 + p2
p1
p2

//p1 += p2

func += (a: inout Point, b: Point) {
    a = a + b
}

p1
p2
p1 += p2
p1

func == (a: Point, b: Point) -> Bool {
    return a.x == b.x && a.y == b.y
}

p1 == p2
p1 == p1



var i = 5



prefix func ++ (a: inout Point) -> Point {
    a.x += 1
    a.y += 1
    return a
}

postfix func ++ (a: inout Point) -> Point {
    let b = a
    ++a
    return b
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1++
p1
++p1
p1


p1.x = 7


if (p1++).x == 8 {
    print("8")
} else {
    print("not 8")
}
p1


p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1++ + p2++

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

++p1 + ++p2

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

p1++ + ++p2

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

++p1 + p2++


//%%%
infix operator %%%

func %%% (a: inout Point, b: Point) -> Point {
    a.x += b.y
    a.y -= b.x
    return a
}

p1
p2
p1 %%% p2

var j = 5

i
j

(((i / 5) * j) / 5) * i

/*
infix operator ** {associativity right precedence 140}

func ** (a: Point, b: Point) -> Point {
    return Point(x: 2 * (a.x + b.x), y: 2 * (a.y + b.y))
}

p1 = Point(x: 2, y: 3)
p2 = Point(x: 3, y: 5)

//p1 ** p2 ** p1 ** p2

//p1 + p2 ** p2 ** p1

((p1 + p2) ** p2) ** p1
((p1 + p2) ** p2) ** p1
p1 + ((p2 ** p2) ** p1)
p1 + (p2 ** (p2 ** p1))
(p1 + p2) ** (p2 ** p1)
(p1 + (p2 ** p2)) ** p1
*/


var s = "Hello, World!"

//s -= "lo"

import Foundation

func -= (s1: inout String, s2: String) {
    
    let set = NSCharacterSet(charactersIn: s2)
    let components = s1.components(separatedBy: set as CharacterSet) as NSArray
    s1 = components.componentsJoined(by: "")
    
}

s -= "lo"
s -= "H"

s = "0123456789"

func -= (s1: inout String, i: Int) {
    s1 -= String(i)
}

s -= 5784440
*/

//1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=

struct Point {
    var x : Int
    var y : Int
}

var p1 = Point(x: 39, y: 10)
var p2 = Point(x: 0, y: 5)

func - (p1: Point, p2: Point) -> Point {
    return Point(x: p1.x - p2.x, y: p1.y - p2.y)
}

func -= (p1: inout Point, p2: Point) {
    p1 = p1 - p2
}

prefix func -- (p: inout Point) -> Point {
    p.x -= 1
    p.y -= 1
    return p
}



postfix func -- (p: inout Point) -> Point {
    let originPoint = p
    
    p.x -= 1
    p.y -= 1
    
    return originPoint
}


func / (p1: Point, p2: Point) -> Point {
    
    if p2.x == 0 || p2.y == 0 {
        print("Divide to zero!")
        return Point(x: 0, y: 0)
    } else {
        return Point(x: p1.x / p2.x, y: p1.y / p2.y)
    }
}



func /= (p1: inout Point, p2: Point) {
    if p2.x == 0 || p2.y == 0 {
        print("Divide to zero!")
    } else {
        p1 = p1 / p2
    }
}

func *= (p1: inout Point, p2: Point) {
    
    p1.x = p1.x * p2.x
    p1.y = p1.y * p2.y
    
}

// 2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, +=, -, -= для этой структуры.

struct Rect {
    
    struct Point {
        var x: Double{
            didSet {
                if x < 0 {
                    x *= -1.0
                }
            }
        }
        var y: Double {
            didSet {
                if y < 0 {
                    y *= -1.0
                }
            }
        }
    }
   
    struct Size {
        var width: Double {
            didSet {
                if width < 0 {
                    width *= -1.0
                }
            }
        }
        
        var height: Double {
            didSet {
                if height < 0 {
                    height *= -1.0
                }
            }
        }
    }
    
    var origin: Point
    var size: Size
    
    init(x: Double, y: Double, width: Double, height: Double) {
        self.origin = Point(x: x, y: y)
        self.size = Size(width: width, height: height)
        
        if x < 0 {
            self.origin.x *= -1.0
        }
        if y < 0 {
            self.origin.y *= -1.0
        }
        if width < 0 {
            self.size.width *= -1.0
        }
        if height < 0 {
            self.size.height *= -1.0
        }
    }
}


var rect1 = Rect(x: 2, y: 3, width: 4, height: 5)
var rect2 = Rect(x: 2, y: 4, width: 5, height: 6)
rect1.size.height
rect1.origin.x

func + (rect1: Rect, rect2: Rect) -> Rect {
    return Rect(x: rect1.origin.x + rect2.origin.x, y: rect1.origin.y + rect2.origin.y, width: rect1.size.width + rect2.size.width, height: rect1.size.height + rect2.size.height)
}

func += (rect1: inout Rect, rect2: Rect) {
    rect1 = rect1 + rect2
}

func - (rect1: Rect, rect2: Rect) -> Rect {
    return Rect(x: rect1.origin.x - rect2.origin.x, y: rect1.origin.y - rect2.origin.y, width: rect1.size.width - rect2.size.width, height: rect1.size.height - rect2.size.height)
}

func -= (rect1: inout Rect, rect2: Rect) {
    rect1 = rect1 - rect2
}
rect1 + rect2
rect1 - rect2
rect1 += rect2
rect1 -= rect2

//3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int

func + (str: String, i: Int) -> String {
    return str + String(i)
}

func += (str: inout String, i: Int) {
    str = str + String(i)
}

//4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы

infix operator ?=

func ?= (str1: inout String, str2: String) {
    let _str1 = str1
    var arrayStr1 = [Character]()
    var dictStr2 = [Character: Int]()
    
    for char in _str1.characters {
        arrayStr1.append(char)
    }
    
    for char in str2.characters {
        dictStr2[char] = 1
    }
    
    for i in 0..<arrayStr1.count {
        if dictStr2[arrayStr1[i]] != nil {
            arrayStr1[i] = Character(String(arrayStr1[i]).uppercased())
        }
    }

    str1 = String(arrayStr1)
}
var str1 = "Looking for the meanings of words, phrases, and expressions? We provide hundreds of thousands of definitions, synonyms, antonyms, and pronunciations for English and other languages, derived from our language research and expert analysis. We also offer a unique set of examples of real usage, as well as guides to:"
var str2 = "Patlyka"

str1 ?= str2
print(str1)


