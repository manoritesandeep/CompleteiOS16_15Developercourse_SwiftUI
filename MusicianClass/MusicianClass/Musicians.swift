//
//  Musicians.swift
//  MusicianClass
//
//  Created by Sandeep Solanki on 5/25/23.
//

import Foundation

/*
 enum's make our life easier when we try to categorize things.
 enum's help standarize categories thus reducing chances for errors as well...
 */

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case violinist
}


class Musicians {
    
    
    // Property
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    /*
     If we don't want to assign values to properties, as above,
     then we have to create an initializer.
     */
    // Initializer aka Constructor in other languages
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        // print("musician created")
        
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
    
    func sing() {
        print("Nothing Else Matters")
    }
    
    private func test() {
        print("This function has access level of private, that is can only be accessed in this file or class")
    }
    
}




