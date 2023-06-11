import UIKit

var greeting = "Hello, playground"

// Array
var myFavMovies = ["Pulp Fiction", "Kill Bill", "Reservoir Dogs"]

// Any type Array
var myAnyArray = ["Pulp Fiction", "Kill Bill", "Reservoir Dogs", 5, true] as [Any]
// as -> casting
// any -> any object

// Indexing Array
myAnyArray[0]
myAnyArray[1]
myAnyArray[3]

var myStringArray = ["Test9", "Test2", "Test3", "Test4","Test7", "Test1"]
myStringArray[0].uppercased()
myStringArray.count
myStringArray[2]
myStringArray[myStringArray.count - 1]
myStringArray.last  // returns last object
myStringArray.sort()

var myNumArr = [1,2,4,3,5,5,7,6]
myNumArr.count
myNumArr.append(8)
myNumArr.sort()
myNumArr.last
// update value using index
myNumArr[0] = 15
myNumArr[0]


// Set
    // are unordered collection of data and returns/have unique values.
    // Sets have no indexes (thus unordered), but unique elements...
var mySet: Set = [1,2,3,4,5,1,2]
mySet
mySet.first

var myInternetArray = [1,2,3,4,5,1,2,3,6,7]
var myInternetSet = Set(myInternetArray)
print(myInternetArray)
print(myInternetSet)

var mySet1 : Set = [1,2,3]
var mySet2 : Set = [3,4,5]

// var mySet1 = Set([1,2,3])
// var mySet2 = Set([3,4,5])

var mySet3 = mySet1.union(mySet2)


// ------- Dictionaries ---------
// key:value pairs

var myFavDirectors = ["Pulp Fiction":"Mr. Tarantino",
                      "Lock, Stock" : "Guy Ritchie",
                      "The Dark Knight" : "Christopher Nolan"]

myFavDirectors["Pulp Fiction"]
myFavDirectors["The Dark Knight"]

myFavDirectors["Pulp Fiction"] = "Quentin Tarantino"
print(myFavDirectors)

myFavDirectors["Seven Samurai"] = "Akira Kurisowa"
print(myFavDirectors)


var myDictionary = ["Run": 100, "Swim": 200, "Basketball": 300]
myDictionary["Run"]





