// 1 task

var text = "Hello my name is Orest. I am 19 years old. I'm from Lviv. Lviv is the country in Ukraine. I would like to be a programmer in the future. Now I am studing a Swift. My lover is Ira. I want to be a man for her."

print("Text: \n\(text)\n")

var consonantsLetters = 0
var vowelLetters = 0
var symbols = 0
var numbers = 0
var spaces = 0

text.characters.count
text = text.lowercased()

for char in text.characters {
    switch char {
        
        case "0"..."9":
                numbers += 1
        case "b"..."d", "f"..."h", "j"..."n", "p"..."t","v"..."x", "z":
                consonantsLetters += 1
        case "a", "e", "i", "o", "u", "y":
                vowelLetters += 1
        case " ":
                spaces += 1
   
    default:
        symbols += 1
    }
}

var lettersCount = consonantsLetters + vowelLetters + symbols + numbers + spaces

print("Consonants letters: \(consonantsLetters)")
print("Vowel letters: \(vowelLetters)")
print("Numbers: \(numbers)")
print("Symbols: \(symbols)")
print("Spaces: \(spaces)")

// 2 task

let age = 19

switch age {
    
    case 0...5: print("child")
    case 6...16: print("schoolboy")
    case 17...22: print("student")
    case 23...55: print("work hard")
    
default: print("old man, relax")
}

// 3 task

let firstName = "Орест"
let lastName = "Патлика"
let middleName = "Володимирович"


switch (firstName, lastName, middleName) {
    case let (firstName,_,_) where firstName.hasPrefix("А") || firstName.hasPrefix("О"):
        print("hello \(firstName)")
    case let (_,_,middleName) where middleName.hasPrefix("В") || middleName.hasPrefix("Д"):
        print("hello \(middleName)")
    case let (_,lastName,_) where lastName.hasPrefix("Е") || lastName.hasPrefix("З"):
    print("hello \(lastName)")
default:
    print("hello \(firstName) \(lastName) \(middleName)")
}

// 4 task

let ship = (x: 2, y: 4, w: 1, h: 3) // 3 палубнік
let boat = (x: 5, y: 6, w: 1, h: 1) // 1

let firePoint = (x: 5, y: 6)

switch firePoint {
case (5, 6): print("kill")
case (0...2, 4): print("wounded")
default: print("miss")
}
















