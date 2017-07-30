import Foundation

//1. Самостоятельно повторить проделанное в уроке

struct DOB {
    var day: Int
    var month: Int
    var year: Int
}

struct Student {
    var firstName: String {
        willSet {
            print("firstName will set " + newValue + " instead of " + firstName)
        }
        didSet {
            print("firstName did set " + firstName + " instead of " + oldValue)
            firstName = firstName.capitalized
        }
    }
    var lastName: String {
        didSet {
            lastName = lastName.capitalized
        }
        
    }
    var fullName: String {
        get {
            return firstName + " " + lastName
        }
        set {
            let words = newValue.components(separatedBy: " ")
            
            if words.count > 0 {
                firstName = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
        }
    }
    var dateOfBirth: DOB
    
    var age: Int {
        
        let todayDate = DOB(day: 18, month: 7, year: 2017)
        
        if (todayDate.month > dateOfBirth.month) || (todayDate.month == dateOfBirth.month && todayDate.day >= dateOfBirth.day) {
            return todayDate.year - dateOfBirth.year
        } else {
            return todayDate.year - dateOfBirth.year - 1
        }
        
    }
    var yearsOfStuding: Int {
        return age > 6 ? age - 6 : 0
    }
    
}

var student = Student(firstName: "Orest", lastName: "Patlyka", dateOfBirth: DOB(day: 23, month: 6, year: 1997))
student.firstName
student.firstName = "ira"

student.firstName
student.lastName
student.fullName = "Orest Ira"
student.fullName

print(student.dateOfBirth)

//2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)

student.age
student.yearsOfStuding

//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)

//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B

struct Point {
    var x: Double
    var y: Double
}

struct Vector {
    var pointA: Point
    var pointB: Point
    
    var midPoint: Point {
        get {
            let midPointX = (pointA.x + pointB.x) / 2
            let midPointY = (pointA.y + pointB.y) / 2
            return Point(x: midPointX, y: midPointY)
        }
        set {
            let deltaX = newValue.x - midPoint.x
            let deltaY = newValue.y - midPoint.y
            
            pointA.x += deltaX
            pointA.y += deltaY
            
            pointB.x += deltaX
            pointB.y += deltaY
        }
    }
    var lenght: Double {
        get {
            let lenght = sqrt(pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2))
            return lenght
        }
        set {
            let deltaLenght = newValue - lenght
            let ratio = lenght / deltaLenght
            
            pointB.x += (pointB.x - pointA.x) / ratio
            pointB.y += (pointB.y - pointA.y) / ratio
        }
    }
}

var vector = Vector(pointA: Point(x: 1, y: 35), pointB: Point(x: 15, y: 35))

print("Middle point: \(vector.midPoint)")
vector.midPoint = Point(x: 10, y: 16)
print("Point A: \(vector.pointA)")
print("Point B: \(vector.pointB)")
print("Vector lenght: \(vector.lenght)")

vector.lenght = 10
print("Vector lenght: \(vector.lenght)")
print("Point A: \(vector.pointA)")
print("Point B: \(vector.pointB)")