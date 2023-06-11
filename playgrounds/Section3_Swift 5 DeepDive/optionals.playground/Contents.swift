import UIKit

var greeting = "Hello, playground"

// Optionals

// Optionals are great tools to work and make our code safer. So by safer, we mean immune to crashes.

var myName : String?
myName?.uppercased()

// optionals : ? vs !

var myAge = "25"

// ?? means default to .. COALESE ..
var myInteger = (Int(myAge) ?? 0) * 5

if let myNumber = Int(myAge) {
    print(myNumber * 10)
}   else {
    print("Invalid Input")
}



