
print("Int8.max = \(Int8.max)")
print("Int8.min = \(Int8.min)")

print("Int16.max = \(Int16.max)")
print("Int16.min = \(Int16.min)")
print("\n")

let a = 1
let b : Float = 1.5
let c = 1.7

let sumI = Int(Double(a) + Double(b) + c)
let sumF = Float(a) + b + Float(c)
let sumD = Double(a) + Double(b) + c

if Double(sumI) < sumD {
    print("Double > INT")
} else if Double(sumI) == sumD {
    print("Double == Int")
} else {
    print("INT > Double")
}





































