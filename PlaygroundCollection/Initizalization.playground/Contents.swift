import Foundation
import UIKit

class Car{
    let wheelType: String = "Front"
    let doorType: String?   // It can be only assigned first introduced class which is "Car"
    init() {
        self.doorType = "4"
    }
}
// Note that if you define a custom initializer for a value type, you will no longer have access to the default initializer

class BMW: Car {
    override init() {
        super.init()
        //        self.doorType = "2" // Error
    }
}

var a = BMW()
a.doorType


struct CarCompany {
    var name: String = "Audi"
    var foundationDate: Date = Date.init(timeIntervalSince1970: 0)
}
/// Memberwise Initializer
let company = CarCompany(name: "BMW", foundationDate: Date(timeIntervalSince1970: 1000*1000))


struct CarSize {
    var width = 0.0
    var height = 0.0
}

struct CarColor {
    var metalic = false
    var color = UIColor.white
}

struct CarSuply {
    var size = CarSize()
    var color = CarColor()
    
    init(){} // 1 default initialization
    init(size: CarSize, color: CarColor) { // 2 different values initialization
        self.size = size
        self.color = color
    }
    init(country: Int) { // 3 country related complex initialization
        switch country {
        case 1:
            self.init(size: CarSize(width: 10, height: 10), color: CarColor(metalic: true, color: UIColor.black))
        default:
            self.init(size: CarSize(width: 20, height: 20), color: CarColor(metalic: true, color: UIColor.blue))
        }
    }
}

var b = CarSuply(country: 1)
b.color
b.size


/// Class Inheritance and Initialization

// 1 - Designated initializers = General modified init
// 2 - Convenience initializers = Calls only in the class and ensures to give responsibility to designated

/*
 Rule 1
 - A designated initializer must call a designated initializer from its immediate superclass.
 Rule 2
 - A convenience initializer must call another initializer from the same class.
 Rule 3
 - A convenience initializer must ultimately call a designated initializer.
 
 --SuperClass
 Designated <- Convenience <- Convenience
 |      |
 -Subclass
 Designated Designated <- Convenience
 
 
 Phase 1
 
 A designated or convenience initializer is called on a class.
 Memory for a new instance of that class is allocated. The memory is not yet initialized.
 A designated initializer for that class confirms that all stored properties introduced by that class have a value. The memory for these stored properties is now initialized.
 The designated initializer hands off to a superclass initializer to perform the same task for its own stored properties.
 This continues up the class inheritance chain until the top of the chain is reached.
 Once the top of the chain is reached, and the final class in the chain has ensured that all of its stored properties have a value, the instance’s memory is considered to be fully initialized, and phase 1 is complete.
 Phase 2
 
 Working back down from the top of the chain, each designated initializer in the chain has the option to customize the instance further. Initializers are now able to access self and can modify its properties, call its instance methods, and so on.
 Finally, any convenience initializers in the chain have the option to customize the instance and to work with self.
 
 
 */


class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle: Vehicle {
    override init() { // overriding superclass
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver



/*
 Only one designated init and you're your own!
 Rule 1
 If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers.
 Rule 2
 If your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers.
 These rules apply even if your subclass adds further convenience initializers.
 */

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    init(other: Bool) {
        if other {
            self.name = "true"
        }else{
            self.name = "false"
        }
    }
    
    init(number: Int) {
        self.name = String(number)
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
        print("convenience init")
    }
}

let namedMeat = Food(name: "Bacon")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
        print("override convenience init")
    }
    
    override init(number: Int) {
        self.quantity = number
        super.init(number: number)
    }
}

var ing = RecipeIngredient(number: 3)
ing.name

