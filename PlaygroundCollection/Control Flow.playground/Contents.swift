// Control flow

// For in
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

for _ in 1...5 {
    print("no need index times 5")
}

// 1..<5
// 20..>5

let minutes = 60
let minuteInterval = 5
stride(from: 0, to: minutes, by: minuteInterval)

for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    // render the tick mark every 5 minutes (0, 5, 10, 15 ... 45, 50, 55)
    print("\(tickMark) after five minutes!")
}
// Closed ranges are also available, by using stride(from:through:by:) instead:

var hours = 12
let hourInterval = 3
for _ in stride(from: 3, through: hours, by: hourInterval) {
    // render the tick mark every 3 hours (3, 6, 9, 12)
}

/// WHILE DO WHILE

while hours != 0 {
    print("you have \(hours) is left!")
    hours -= 3
}
repeat {
    hours += 3
    print("added \(hours) more hours!")
} while hours != 12

/// IF - ELSE

var temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// Prints "It's really warm. Don't forget to wear sunscreen."

/// SWITCH is powerful!

let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"

let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String = ""
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")
// Prints "There are dozens of moons orbiting Saturn."

/// TUPLE

let somePoint = (1, 0)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
// Prints "(1, 1) is inside the box"

//However, if multiple matches are possible, the first matching case is always used

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
// Prints "on the x-axis with an x value of 2"

let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"

let someCharacter2: Character = "e"
switch someCharacter2 {
case "a", "e", "i", "o", "u":
    print("\(someCharacter2) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter2) is a consonant")
default:
    print("\(someCharacter2) is not a vowel or a consonant")
}
// Prints "e is a vowel"

/*
 Control Transfer Statements
 --
 continue
 break
 fallthrough
 return
 throw
 */

let puzzleInput = "123456789"
var puzzleOutput = ""
let charactersToRemove_Continue: [Character] = ["1","3","5"]
let charactersToRemove_Break: [Character] = ["2","4","6"]
for character in puzzleInput {
    if charactersToRemove_Continue.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print("\(puzzleOutput) for Continue flow!")

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 3, 5, 7:
    description += " very good number and"
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."

func greet(person: [String: String]) {

    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

if #available(iOS 10, *){
    print("ios 10")
}else{
    print("not ios 10")
}






