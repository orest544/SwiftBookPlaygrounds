import Foundation

// task 1

let str1 = "1"
let str2 = "2d"
let str3 = "3"
let str4 = "4f"
let str5 = "5"

var sum = 0

sum = (Int(str1) ?? 0)
sum += (Int(str2) ?? 0)
sum += (Int(str3) ?? 0)
sum += (Int(str4) ?? 0)
sum += (Int(str5) ?? 0)


let a = Int(str1) != nil ? str1 : "nil"
let b = Int(str2) != nil ? str2 : "nil"
let c = Int(str3) != nil ? str3 : "nil"
let d = Int(str4) != nil ? str4 : "nil"
let e = Int(str5) != nil ? str5 : "nil"

let strResultInterpolating = "\(a) + \(b) + \(c) + \(d) + \(e) = \(sum)"
var strResultConcatenating = a + " + " + b + " + " + c + " + " + d + " + " + e
strResultConcatenating += " = " + String(sum)

print (strResultConcatenating)
print (strResultInterpolating)

//task 2

let strEmoji = "\u{1F604}, \u{1F60C}, \u{1F602}, \u{1F60B}, \u{1F618}"
print(strEmoji)

strEmoji.characters.count
(strEmoji as NSString).length

//task 3 

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let aimCharacter : Character = "z"

var index = 0

for char in alphabet.characters {
    
    if char == aimCharacter {
        break
    }
    index += 1
}

print ("Index of character \(aimCharacter) is \(index)")





