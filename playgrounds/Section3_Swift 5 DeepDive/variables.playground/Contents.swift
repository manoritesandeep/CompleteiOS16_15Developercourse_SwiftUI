import UIKit

var greeting = "Hello, playground"

var myNumber = 5*4
var myNumber1 = 5*5
print(myNumber)


// Variables & Constants

// PART1:
// snake case (snakeCase)
    // var user_name =

// camel case
    // camelCase

var userName = "James"
print(userName)
userName.append("ooo")
userName.lowercased()
userName.uppercased()

var userSurname = "Heart"

// observe we are no longer writing var.. i.e we need to define a variable only once and re-use the name as required.
userName = "Lars"
print(userName)

// Constants: makes values constant
// integer & double & float - Once we assign a type to a variable it sticks with it..
// integer
let userAge = 50
print(userAge)
// userAge = 30 // won't work due to let...
let randomNum = 4
userAge/randomNum


//double
let pi = 3.14
let userAgeD = 50.0
let randomNumD = 4.0
userAgeD / randomNumD

// userAge * pi    // type of variable should be same...

// boolean
var myBool1 = false
myBool1 = true

// Once we assign a type to a variable it sticks with it... allowed in Python not Swift
var randomNumD1 = 4.0
// randomNumD1 = "Text" // This is invalid...

//  -----------------Part2-------------------:
// Pre-defining variable types
let myString: String = "50"
let anotherNumber: Int = 50

let stringNum = String(20)
var stringNum1 = Int(stringNum)
let double_intNum = Int(10.5)

// define
let myVar: String
// Initialize
myVar = "Test Text"
// myVar.uppercased()
let myUpperVar = myVar.uppercased() // reassign to a new variable
print(myVar)
print(myUpperVar)



