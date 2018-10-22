/// Closures

import UIKit
import Foundation

/*
 - Global functions are closures that have a name and do not capture any values.
 - Nested functions are closures that have a name and can capture values from their enclosing function.
 - Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
 
 */

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

reversedNames = names.sorted(by: { (s1, s2) -> Bool in return s1 < s2 })
reversedNames
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})
reversedNames
reversedNames = names.sorted(by: { $0 < $1 })
reversedNames
reversedNames = names.sorted(by: >)
reversedNames

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]

func makeIncrementer(forIncrement amount: Int) -> (Int) -> Int {
    var runningTotal = 0
    func incrementer(toAdd: Int) -> Int {
        runningTotal += amount
        runningTotal += toAdd
        return runningTotal
    }
    return incrementer
}

var i = makeIncrementer(forIncrement: 5)
i(3)

///Escaping clojures
// escaping states that clojure is needed outside of the declaration place
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

completionHandlers.append {
    print("Hello")
}
completionHandlers.append {
    print("World!")
}
completionHandlers.map { (clo) in
    clo()
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
//    completionHandlers.append(closure) // compiletime error
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.last?()
print(instance.x)
// Prints "100"


/// For delayed purposes.
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"

// Escaping Autoclojures

// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"



