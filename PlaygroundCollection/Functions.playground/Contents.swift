/// Functions
import Foundation

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))
// Prints "Hello, Anna!"
print(greet(person: "Brian"))
// Prints "Hello, Brian!"

type(of: greet)

func minMax(array: [Int]) -> (min: Int, max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds!.min) and max is \(bounds!.max)")
// Prints "min is -6 and max is 109"

func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
    print("\(parameterName) is here!")
}

someFunction(argumentLabel: 2)

func defaultParameter(_ firstParameterName: Int = 12, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
    print("\(firstParameterName) is first and \(secondParameterName) is second!")
}
defaultParameter(1, secondParameterName: 2)

defaultParameter(secondParameterName: 5)

/// Variadic parameters

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

func sumOf(added numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total
}

arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers
arithmeticMean(3, 8.25, 18.75)
// returns 10.0, which is the arithmetic mean of these three numbers
sumOf(added:3, 8.25, 18.75)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Prints "someInt is now 107, and anotherInt is now 3"

/// Function types

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")
// Prints "Result: 5"

func stepForward(_ input: Int) -> Int {
    return input+1
}
func stepBackward(_ input: Int) -> Int {
    return input-1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 10
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
// moveNearerToZero now refers to the stepBackward() function
while currentValue != 0 {
    currentValue = chooseStepFunction(backward: currentValue > 0)(currentValue)
    print("\(currentValue) is going backwards!")
}
