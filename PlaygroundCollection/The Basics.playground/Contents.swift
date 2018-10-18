
//tuples
var tup: (Int, String) = (1,"action passed")

tup.0
tup.1

func sendTuple() -> (Int, String) {
    return (2,"action error")
}

tup = sendTuple()
tup.1


let possibleNumber = "123"

if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

var possibleString: String? = "An optional string."
var forcedString: String = possibleString! // requires an exclamation mark

var assumedString: String! = "An implicitly unwrapped optional string."
var implicitString: String = assumedString // no need for an exclamation mark

//implicitString = ""
//assumedString = nil
if assumedString != nil {
    print(assumedString!)
}else{
    print("\(assumedString) is nil")
}


func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}


