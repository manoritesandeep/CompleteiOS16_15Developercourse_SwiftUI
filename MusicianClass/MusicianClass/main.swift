//
//  main.swift
//  MusicianClass
//
//  Created by Sandeep Solanki on 5/25/23.
//

import Foundation

// print("Hello, World!")

let james = Musicians(nameInit: "James King",
                      ageInit: 50,
                      instrumentInit: "Guitar",
                      typeInit: .Vocalist)

// print(james.age)
print("The name of the musician is: \(james.name), of type \(james.type) ,aged: \(james.age) and plays the \(james.instrument) instrument.")
james.sing()

let kirk = SuperMusician(nameInit: "Kirk",
                         ageInit: 55,
                         instrumentInit: "Guitar",
                         typeInit: .LeadGuitar)
print(kirk.age)
kirk.sing2()
kirk.sing()



