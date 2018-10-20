import UIKit
import Foundation

// Multiline String
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496

// Initialization
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax

if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"

for character in "Dog!🐶" {
    print(character)
}

let string1 = "hello"
let string2 = " there"
var added = string1 + string2
// added now equals "hello there"

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"

// UNICODE UTF-16
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"


// We can think String as an array of Character value type.

let welcome = "Guten Tag!"
welcome.index(after: welcome.startIndex).encodedOffset
welcome.indices.endIndex

welcome[welcome.startIndex]
// G
welcome[welcome.index(before: welcome.endIndex)]
// !
welcome[welcome.index(after: welcome.startIndex)]
// u
let index = welcome.index(welcome.startIndex, offsetBy: 7)
// a

var welcomen = "hello"
welcomen.insert("!", at: welcomen.endIndex)
// welcome now equals "hello!"

welcomen.insert(contentsOf: " there", at: welcomen.index(before: welcomen.endIndex))
// welcome now equals "hello there!"


// Substrings
let greeting = "Hello, world!"
let greetingIndex = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<greetingIndex]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)

// Prefix and Suffix Equality
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"
