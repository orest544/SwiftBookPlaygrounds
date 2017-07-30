
// task 1

let dayMonth = [31, 28, 31 ,30, 31, 30, 31, 31, 30, 31, 30, 31]
let nameMonth = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

var tupleMonthDay = [(month:String, day:Int)]()

for index in 0..<dayMonth.count {
    let tempTuple = (month:nameMonth[index], day:dayMonth[index])
    tupleMonthDay.append(tempTuple)
}

// 1 array
for (index, value) in dayMonth.enumerated() {
    print("Month: \(index + 1), Count of days: \(value)")
}
print("\n")

// 2 arrays
for i in 0..<dayMonth.count {
    print("Month: \(nameMonth[i]), Count of days: \(dayMonth[i])")
}
print("\n")

//tuple
for i in 0..<tupleMonthDay.count {
    print("Month: \(tupleMonthDay[i].month), Count of days: \(tupleMonthDay[i].day)")
}
print("\n")

// revers output
/*for var i = (tupleMonthDay.count - 1); i >= 0; i-- {
    print("Month: \(tupleMonthDay[i].month), Count of days: \(tupleMonthDay[i].day)")
}
print("\n")
*/

//days to date
let date = (month: "October", day: 6)
var countDays = 0

for i in 0..<dayMonth.count {
    if nameMonth[i] != date.month {
        countDays += dayMonth[i]
    } else {
        countDays += date.day
        break
    }
}
print("Before \(date.month) \(date.day) is \(countDays) days")
print("\n")

// task 2

let optionalArray : [Int?] = [23, nil, 34, nil, nil, 100, nil, 200, 300, 200, nil]
var optionalSum = 0

// force unwrapping
for value in optionalArray {
    if value != nil {
        optionalSum += value!
    }
}
print("Optional sum is: \(optionalSum)")
optionalSum = 0

// optional binding
for value in optionalArray {
    if let value = value {
        optionalSum += value
    }
}
print("Optional sum is: \(optionalSum)")
optionalSum = 0

// binary operation
for value in optionalArray {
    optionalSum += value ?? 0
}
print("Optional sum is: \(optionalSum)")


print("\n")

// task 3

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var emptyArray = [String]()

for char in alphabet.characters {
    emptyArray.insert(String(char), at: 0)
}
print(emptyArray)







