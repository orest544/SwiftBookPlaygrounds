// task 1
var studentLog = ["Orest Patlyka": 3, "Iryna Komarynska": 5, "Dima Danylyshyn": 3]

studentLog.updateValue(5, forKey: "Orest Patlyka")
studentLog.updateValue(4, forKey: "Dima Danylyshyn")

studentLog["Bogdan Ptyts"] = 3
studentLog["Darij Senyshyn"] = 4

studentLog.removeValue(forKey: "Dima Danylyshyn")
studentLog.removeValue(forKey: "Darij Senyshyn")

var generalPoint = 0
var mediumPoint : Float = 0.0

for value in studentLog.values {
    generalPoint += value
}
mediumPoint = Float(generalPoint) / Float(studentLog.count)

print("general point is: \(generalPoint)")
print("medium point is: \(mediumPoint)")

// task 2

let dayMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let nameMonth = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

var dictDayMonth = [String: Int]()

for i in 0..<dayMonth.count {
    dictDayMonth[nameMonth[i]] = dayMonth[i]
}

for (key, value) in dictDayMonth {
    print("key: \(key), value: \(value)")
}
print("")

for key in dictDayMonth.keys {
    print("key: \(key), value: \(dictDayMonth[key]!)")
}

// task 3

let letters = ["a", "b", "c", "d", "e", "f", "g", "h"]
var dictChess = [String: Bool]()

for i in 0..<letters.count {
    for j in 0..<letters.count {
            dictChess[letters[j] + String(i + 1)] = (i % 2 != j % 2)
    }
}

for (key, value) in dictChess {
    print("\(key) = \(value)")
}








