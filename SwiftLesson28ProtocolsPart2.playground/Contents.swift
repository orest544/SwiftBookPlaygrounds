// 1. Почитать о том, что такое стек и очередь.
// 2. Используя протокол из прикрепленного фото, сделать расширение "Container" для класса "stackay" таким образом, чтобы массивом можно было управлять как стеком. Небольшая подсказка, указывать в качестве типа данных вместо Self.Generator.Element нужно просто Element.

// 3. Создать расширение протокола "Container", которое позволит управлять массивом, как очередью. О том, какие у очереди должны быть методы и свойства - почитайте в интернете.
// 4. Разберитесь, почему код не работает и какой тип данных необходимо использовать для того, чтобы все заработало.
// 5. Еще одной задачей для усложнения, окажется то, что изначально все работать не будет и вам придется разобраться какое наследование и полиморфизм нужно организовать в нашем проекте для того, чтобы это все заработало. Сделать это можно, изучив структуру наследования класса stackay и того, какие протоколы он использует.


protocol Container: Collection, RangeReplaceableCollection {
    mutating func pop() -> Self.Iterator.Element?
    mutating func push(_ element: Self.Iterator.Element)
    func peek() -> Self.Iterator.Element?
}



extension Array: Container {
    
    mutating func pop() -> Element? {
        if let lastElement = self.last{
            self.remove(at: self.count - 1)
            return lastElement
        } else {
            print("Stack is empty")
            return nil
        }
    }
    
    mutating func push(_ element: Element) {
        self.append(element)
    }
    
    func peek() -> Element? {
        return self.last
    }
}

var stack = [2,5,6,3,2,1]

stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.pop()
stack.pop()

stack.push(5)
stack.push(3)


extension Container {
    mutating func enqueue(_ element: Self.Iterator.Element) {
        self.append(element)
    }
    
    mutating func dequeue() -> Self.Iterator.Element? {
        let firstElement = self.first
        
        if self.isEmpty {
            print("Queue is empty")
            return nil
        } else {
            self.removeFirst()
            return firstElement
        }
    }
}

var queue = [1, 2, 3, 4, 5]

queue.dequeue()
queue
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.dequeue()
queue.dequeue()

queue.enqueue(1)
queue.enqueue(2)
