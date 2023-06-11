import UIKit

var greeting = "Hello, playground"

// FUNCTIONS

func myFunction(){
    print("My Function")
}

myFunction()

// Input & Output & Return

func sumFunction(x: Int, y: Int){
    print(x + y)
}

sumFunction(x: 10, y: 20)

// Return
func sumFunction1(x: Int, y: Int) -> Int {
    return x + y
}

let myFuncReturn = sumFunction1(x: 15, y: 20)
print(myFuncReturn)

func logicFunction(a: Int, b: Int) -> Bool {
    if a > b {
        return true
    } else {
        return false
    }
}

logicFunction(a: 10, b: 5)


func stringFunction(a: Int, b: Int) -> String {
    if a > b {
        return "Greater"
    } else {
        return "Smaller"
    }
}

stringFunction(a: 10, b: 15)

