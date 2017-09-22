//1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool

extension Int {
    var isNegative: Bool {
        if self == 0 {
            return false
        } else {
            return !self.isPositive
        }
    }
    
    var isPositive: Bool {
        if self == 0 {
            return false
        } else {
            return self > 0 ? true : false
        }
    }
    
    var booleanValue: Bool {
        return self != 0 ? true : false
    }
    
    var countOfSymbols: Int {
        return String(self).characters.count
    }
    
    subscript(index: Int) -> Int? {
        get {
            let str = String(self)
            var arrayChar = [Character]()
            
            for char in str {
                arrayChar.insert(char, at: 0)
            }
            
            return index < self.countOfSymbols ? Int(String(arrayChar[index])) ?? 0 : nil
        }
        
        set {
            var str = String(self)
            var charsArray = [Character]()
            var subCharsArray = [Character]()
            
            for char in str {
                charsArray.insert(char, at: 0)
            }
            
            if let _newValue = newValue {
                if _newValue >= 0 && index < self.countOfSymbols {
                    
                    if _newValue.countOfSymbols > 1 {
                        let tempStr = String(_newValue)
                        
                        for char in tempStr {
                            subCharsArray.append(char)
                        }
                        charsArray[index] = subCharsArray[0]
                        subCharsArray.remove(at: 0)
                        
                        for char in subCharsArray {
                            charsArray.insert(char, at: index)
                        }
                    } else {
                        charsArray[index] = Character(String(_newValue))
                    }
                    
                }
            }
            
            str = String(charsArray.reversed())
            self = Int(str) ?? 0
        }
    }
    
}

var a = 4

a.isNegative
a.isPositive
a.booleanValue

//2. Добавьте проперти, которое возвращает количество символов в числе

a = 1234567890
a.countOfSymbols

/*
3. Добавьте сабскрипт, который возвращает символ числа по индексу:

let a = 8245

a[1] // 4
a[3] // 8

Профи могут определить и сеттер :)
*/

a[3] = 20
a
a[4] = 666
a
a[123] = 2
a
a[2] = nil
a

//4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его

extension String {
    subscript(range: CountableRange<Int>) -> String {
        get {
            if range.lowerBound <= self.characters.count && range.upperBound <= self.characters.count {
                let start = self.index(self.startIndex, offsetBy: range.lowerBound)
                let end = self.index(self.startIndex, offsetBy: range.upperBound)
                
                
                return String(self[start..<end])
            } else {
                return "Out of range!"
            }
        }
        
        set {
            if range.lowerBound <= self.characters.count && range.upperBound <= self.characters.count{
                let start = self.index(self.startIndex, offsetBy: range.lowerBound)
                let end = self.index(self.startIndex, offsetBy: range.upperBound)
                
                let subStr = newValue
                let startStr = self[self.startIndex..<start]
                let endStr = self[end..<self.endIndex]
                
                self = startStr + subStr + endStr
            } else {
                print("Out of range!")
            }
        }
    }
    
    subscript(range: CountableClosedRange<Int>) -> String {
        get {
            if range.lowerBound <= self.characters.count && range.upperBound <= self.characters.count - 1 {
                let start = self.index(self.startIndex, offsetBy: range.lowerBound)
                let end = self.index(self.startIndex, offsetBy: range.upperBound)
                
                
                return String(self[start...end])
            } else {
                return "Out of range!"
            }
        }
        
        set {
            if range.lowerBound <= self.characters.count && range.upperBound <= self.characters.count - 1{
                let start = self.index(self.startIndex, offsetBy: range.lowerBound)
                let end = self.index(self.startIndex, offsetBy: range.upperBound + 1)
                
                let subStr = newValue
                let startStr = self[self.startIndex..<start]
                let endStr = self[end..<self.endIndex]
                
                self = startStr + subStr + endStr
            } else {
                print("Out of range!")
            }
        }
    }
    
    mutating func trancate(_ value: Int) {
        let sizeStr = self.characters.count
        
        if value < sizeStr {
            let end = self.index(self.startIndex, offsetBy: sizeStr - value)
            self = String(self[self.startIndex..<end]) + "..."
        }
    }
}

var s0 = "HelloWorld!"
var s1 = "HelloWorld!"

s0[0..<11]
s1[0...10]

s0[1..<3] = "Orest"
s1[1...3] = "Orest"

s0
s1

/*
5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:

let s = "Hi hi hi"

s.truncate(4) // Hi h...

s.truncate(10) // Hi hi hi
*/

var s3 = "Hi hi hi"

s3.trancate(10)
s3.trancate(4)

