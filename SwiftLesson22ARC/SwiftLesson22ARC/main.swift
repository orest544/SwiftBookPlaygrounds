//Рассмотрим такую ситуацию: есть семья - папа, мама и дети.
//Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа - Мама - Дети, Дети на одном уровне.
//Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить "дай игрушку", спрашивать Маму: "Мама, дай конфетку", общаться с Папой: "Папа, купи игрушку".
//Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, т.е. метод вернёт массив всех членов Семьи.
//У Папы есть 3 кложера (closures) - 1. когда он обращается к Семье - распечатать всю Семью, 2. распечатать Маму, 3. распечатать всех Детей.
//Создать всю иерархию со связями. При выходе из зоны видимости все объекты должны быть уничтожены. Используем Command-Line Tool.

class Family {
    var father: Father?
    
    func showFamily() -> [String] {
        var array = [father?.firstName ?? "", father?.vife?.firstName ?? ""]
        
        for kid in Kid.kids {
            array.append(kid.firstName)
        }
        return array
    }
}

class Father {
    var firstName: String
    var vife: Mother?
    weak var family: Family?
    
    lazy var showVife: () -> () = { [unowned self] in
        
        print("Vife: \(self.vife?.firstName ?? "")")
    }
    
    lazy var showKids: () -> () = { [unowned self] in
        print("Kids: ", terminator: "")
        for kid in Kid.kids {
            print(kid.firstName, terminator: " ")
        }
        print()
    }
    func buyAToy() {
        print("Daddy, buy me a toy")
        
    }
    
    init(firstName: String) {
        self.firstName = firstName
    }
    
    deinit {
        print("Father released")
    }
}

class Mother {
    var firstName: String
    
    weak var husband: Father?
    static var kids = Kid.kids
    
    func giveACandy() {
        print("Mammy give me a candy please")
    }
    
    init(firstName: String) {
        self.firstName = firstName
    }
    deinit {
        print("Mother released")
    }
}

class Kid {
    static var kids = [Kid]()
    var firstName: String
    
    weak var father: Father?
    weak var mother: Mother?
    
    func giveMeAToy(fromKidWithIndex index: Int) {
        if index >= Kid.kids.count {
            print("Out of range!")
        } else {
            print("\(self.firstName) say to \(Kid.kids[index].firstName): Give me a toooy")
        }
    }
    
    init(firstName: String, father: Father? = nil, mother: Mother? = nil) {
        self.father = father
        self.mother = mother
        self.firstName = firstName
        Kid.kids.append(self)
    }
    
    deinit {
        print("Kid released")
    }
}

if true {
    var family = Family()
    var orest = Father(firstName: "Orest")
    var ira = Mother(firstName: "Ira")
    var max = Kid(firstName: "Max", father: orest, mother: ira)
    var bob = Kid(firstName: "Emmy", father: orest, mother: ira)
    
    orest.vife = ira
    ira.husband = orest
    
    family.father = orest
    orest.family = family
    
    bob.giveMeAToy(fromKidWithIndex: 0)
    max.father?.buyAToy()
    bob.mother?.giveACandy()
    
    print("Family: \(orest.family?.showFamily() ?? [""])")
    print("Family: \(family.showFamily())")
    orest.showKids()
    orest.showVife()
    
    
    Kid.kids.removeAll()
}


