//: Playground - noun: a place where people can play

import UIKit

do {
    struct ReverseIndexIterator: IteratorProtocol {
        
        var index: Int
        
        init<T>(array: [T]) {
            index = array.endIndex - 1
        }
        
        mutating func next() -> Int? {
            guard index >= 0 else {
                return nil
            }
            defer { index -= 1 }
            return index
        }
        
    }
    
    let letters = ["a", "b", "c"]
    
    var iterator = ReverseIndexIterator(array: letters)
    while let i = iterator.next() {
        print(letters[i])
    }
}

do {
    struct PowerIterator: IteratorProtocol {
        
        var power: NSDecimalNumber = 1
        
        mutating func next() -> NSDecimalNumber? {
            self.power = self.power.multiplying(by: 2)
            return self.power
        }
        
        mutating func find(where predicate: (NSDecimalNumber) -> Bool) -> NSDecimalNumber? {
            while let x = next() {
                if predicate(x) {
                    return x
                }
            }
            return nil
        }
    }
    
    var p = PowerIterator()
    for i in 1...20 {
        print(p.next())
    }
    
    print(p.find(where: { $0.intValue > 1000 }))
}
