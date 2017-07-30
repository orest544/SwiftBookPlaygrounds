
//task 1
let (january, february, march, april, may) = (31, 28, 31, 30, 31)

var totalDays = january + february + march + april + may + 23

let myBirthdaySec = totalDays * 24 * 60 * 60

//task 2
let firstQuarter = 365/4
let secondQuarter = 365/2
let thirdQuarter = 365 - firstQuarter
let fourthQuarter = 365

if totalDays < firstQuarter {
    print("You was born at first quarter of year")
} else if totalDays < secondQuarter {
    print("You was born at second quarter of year")
} else if totalDays < thirdQuarter {
    print("You was born at third quarter of year")
} else {
    print("You was born at fourth quarter of year")
}

// 3 task
var (variable1, variable2, variable3, variable4, variable5) = (1, 2, 3, 4, 5)

//var result = variable1++ * variable2-- / variable3-- - variable4++ + variable5++
// 2 * 3 / 2 - 5 + 6 =

// 4 task
let (x, y) = (2, 2)

if x % 2 == y % 2 {
    print ("Black")
} else {
    print ("White")
}















