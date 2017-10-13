var stringArray = ["Hi", "Hello", "Good Bye"]
var intArray = [1,2,3,4,5,3]
var doubleArray = [1.2, 1.5, 4.5]


func printStringFromArray(arr: [String]) {
    for str in arr {
        print(str)
    }
}

func printIntFromArray(arr: [Int]) {
    for value in arr {
        print(value)
    }
}

func printDoubleFromArray(arr: [Double]) {
    for value in arr {
        print(value)
    }
}


printStringFromArray(arr: stringArray)
printIntFromArray(arr: intArray)
printDoubleFromArray(arr: doubleArray)

// Geberic ex 1

func printElementsFromArray<T>(arr: [T]) {
    for element in arr {
        print(element)
    }
}

printElementsFromArray(arr: stringArray)
printElementsFromArray(arr: intArray)
printElementsFromArray(arr: doubleArray)

// ex 2

func doNothing<T>(someArgument: T) -> T {
    return someArgument
}

doNothing(someArgument: "Hello")
doNothing(someArgument: 123)
doNothing(someArgument: false)

// ex 3

struct GenericArray<T> {
    var items = [T]()
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var myFriendArray = ["Orest", "Ira", "Dima"]
var array = GenericArray(items: myFriendArray)

array.pop()
array.push("Bogdan")
array.push("Olexandr")

printElementsFromArray(arr: array.items)

// ex 4

struct Point<T: Numeric> {
    var x: T
    var y: T
}

var floatPoint = Point(x: Float(3), y: 5)
var doublePoint = Point(x: 4, y: 4.5)
var intPoint = Point(x: 4, y: 5)


func bubbleSort<T: Comparable>(array: [T]) -> [T] {
    var sortedArray = array
    
    for i in 0..<sortedArray.count {
        for j in 1..<sortedArray.count - i {
            if sortedArray[j] < sortedArray[j - 1] {
                sortedArray.swapAt(j, j - 1)
            }
        }
    }
    
    return sortedArray
}

var intArray2 = [1,4,6,2,4,7,9,345,342,5,15,12,52,52,35,23,45,6]
intArray2 = bubbleSort(array: intArray)
