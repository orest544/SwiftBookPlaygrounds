// 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).

struct StudentStruct {
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var averageScore: Double
}

var student1 = StudentStruct(name: "Orest", lastName: "Patlyka", yearOfBirth: 1997, averageScore: 4.7)
var student2 = StudentStruct(name: "Dima", lastName: "Danylyshyn", yearOfBirth: 1997, averageScore: 4.5)
var student3 = StudentStruct(name: "Bogdan", lastName: "Birdie", yearOfBirth: 1997, averageScore: 4.3)
var student4 = StudentStruct(name: "Irynka", lastName: "Komarynska", yearOfBirth: 1997, averageScore: 4.9)
var student5 = StudentStruct(name: "Oleksandr", lastName: "Birdie", yearOfBirth: 1997, averageScore: 4.9)

var journal = [student1, student2, student3, student4, student5]

// 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.

func showJournal(journal: [StudentStruct]) {
    for i in 0..<journal.count {
        print("\(i + 1).\(journal[i].lastName) \(journal[i].name) \t \(journal[i].yearOfBirth), score: \(journal[i].averageScore)")
    }
}

//showJournal(journal: journal)


// 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.

var sortedJournal = journal.sorted { $0.averageScore > $1.averageScore }

print(" Sorted by score:")
showJournal(journal: sortedJournal)

// 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.

sortedJournal = journal.sorted {
    if $0.lastName != $1.lastName {
        return $0.lastName < $1.lastName
    } else {
        return $0.name < $1.name
    }
}

print("\n Sorted by last name:")
showJournal(journal: sortedJournal)

// 5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var newJournal = journal

for i in 0..<newJournal.count {
    newJournal[i].lastName = "Hello"
    newJournal[i].name = "World"
}

print("\n old:")
showJournal(journal: journal)

print("\n new:")
showJournal(journal: newJournal)

///// FOR CLASSES !!!!!<<><<<<<><><><><><><><><><>><><><><><><><><><><><><<><><><><

class StudentClass {
    var name: String
    var lastName: String
    var yearOfBirth: Int
    var averageScore: Double
    
    init(name: String, lastName: String, yearOfBirth: Int, averageScore: Double) {
        self.name = name
        self.lastName = lastName
        self.yearOfBirth = yearOfBirth
        self.averageScore = averageScore
    }
}

func showJournal(journal: [StudentClass]) {
    for i in 0..<journal.count {
        print("\(i + 1).\(journal[i].lastName) \(journal[i].name) \t \(journal[i].yearOfBirth), score: \(journal[i].averageScore)")
    }
}


var student01 = StudentClass(name: "Orest", lastName: "Patlyka", yearOfBirth: 1997, averageScore: 4.7)
var student02 = StudentClass(name: "Dima", lastName: "Danylyshyn", yearOfBirth: 1997, averageScore: 4.5)
var student03 = StudentClass(name: "Bogdan", lastName: "Birdie", yearOfBirth: 1997, averageScore: 4.3)
var student04 = StudentClass(name: "Irynka", lastName: "Komarynska", yearOfBirth: 1997, averageScore: 4.9)
var student05 = StudentClass(name: "Oleksandr", lastName: "Birdie", yearOfBirth: 1997, averageScore: 4.9)

var journalClass = [student01, student02, student03, student04, student05]

print()
showJournal(journal: journalClass)

journalClass.sorted { $0.averageScore < $1.averageScore }

print("\n Sorted by score:")
showJournal(journal: journalClass.sorted {$0.averageScore < $1.averageScore})


print("\n Sorted by last name:")
showJournal(journal: journalClass.sorted {
    if $0.lastName != $1.lastName {
        return $0.lastName < $1.lastName
    } else {
        return $0.name < $1.name
    }
})

var newJournalClass = journalClass


for i in 0..<newJournalClass.count {
    newJournalClass[i].lastName = "Hello"
    newJournalClass[i].name = "World"
}


print("\n old:")
showJournal(journal: journalClass)

print("\n new:")
showJournal(journal: newJournalClass)


