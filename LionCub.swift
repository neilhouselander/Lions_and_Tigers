//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Neil Houselander on 14/02/2016.
//  Copyright © 2016 Neil Houselander. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubBelly () {
        print("Sunggle & be happy")
    }
    
    override func roar() {
        
        print("\(self.name): growl growl")
        super.roar()
    }
    
    override func randomFact() -> String {
        var randomFactString: String
        if self.isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
    
}
