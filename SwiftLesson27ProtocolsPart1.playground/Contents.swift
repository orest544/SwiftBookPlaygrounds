// 1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями

protocol Food {
    var name: String { get }
    func taste() -> String
}

protocol Storable {
    var expired: Bool { get set }
    var daysToExpire : Int { get set }
}
// 2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты по имени. Используйте для этого отдельную функцию, которая принимает массив продуктов

class Apple: Food {
    var name = "Apple"
    func taste() -> String {
        return "Сrispy and sweet"
    }
}

class Egg: Food {
    var name = "Eggs"
    func taste() -> String {
        return "Healthy too"
    }
}

class Milk: Food, Storable {
    var name = "Milk"
    
    var expired: Bool
    var daysToExpire: Int
    
    func taste() -> String {
        return "Healthy"
    }
 
    init(expired: Bool, daysToExpire: Int) {
        self.expired = expired
        self.daysToExpire = daysToExpire
    }
    
    convenience init(expired: Bool) {
        self.init(expired: expired, daysToExpire: 0)
    }
}

class Chicken: Food, Storable {
    var name = "Chicken"
    
    var expired: Bool
    var daysToExpire: Int
    
    func taste() -> String {
        return "Juicy and delicious"
    }
    
    init(expired: Bool, daysToExpire: Int) {
        self.expired = expired
        self.daysToExpire = daysToExpire
    }
    
    convenience init(expired: Bool) {
        self.init(expired: expired, daysToExpire: 0)
    }
}

class Cheese: Food, Storable  {
    var name = "Cheese"
    
    var expired: Bool
    var daysToExpire: Int
    
    func taste() -> String {
        return "A food derived from milk"
    }
    
    init(expired: Bool, daysToExpire: Int) {
        self.expired = expired
        self.daysToExpire = daysToExpire
    }
    
    convenience init(expired: Bool) {
        self.init(expired: expired, daysToExpire: 0)
    }
}

var apple = Apple()
var egg = Egg()
var milk = Milk(expired: false, daysToExpire: 43)
var chicken = Chicken(expired: true)
var cheese = Cheese(expired: false, daysToExpire: 31)

var bag: [Food] = [apple, milk, chicken, egg, cheese]


func printBag(_ array: [Food]) {
    for food in array {
        print(food.name, "\n", food.taste())
    }
}

func foodSortedByName(bagWithFood array: [Food]) -> [Food] {
    return array.sorted(by: {$0.name.lowercased() < $1.name.lowercased()})
}

printBag(bag)

bag = foodSortedByName(bagWithFood: bag)
print("\nSorted by name:")
printBag(bag)


// 3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника

bag = bag.filter{ food in
    if let food = food as? Storable {
        return !food.expired
    } else {
        return true
    }
}

var refrigerator = [Food&Storable]()

for food in bag {
    if let food = food as? Food&Storable {
        refrigerator.append(food)
    }
}


// 4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.

refrigerator = refrigerator.sorted(by: {
    if $0.daysToExpire < $1.daysToExpire {
        return true
    } else if $0.daysToExpire == $1.daysToExpire {
        return $0.name.lowercased() < $1.name.lowercased()
    } else {
        return false
    }
})

print("\nRefrigerator:")
printBag(refrigerator)

// 5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.
