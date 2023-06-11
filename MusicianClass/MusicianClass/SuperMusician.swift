//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Sandeep Solanki on 5/25/23.
//

import Foundation

// Inheritence
// class NAME: (Inheritence class NAME)
class SuperMusician : Musicians {
    
    func sing2() {
        print("Enter Night")
    }
    
    override func sing() {
        super.sing()
        print("Exit Light")
    }
}

