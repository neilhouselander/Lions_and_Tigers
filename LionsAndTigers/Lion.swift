//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Neil Houselander on 04/02/2016.
//  Copyright © 2016 Neil Houselander. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage (named: "anyName")
    var name = "anyName"
    var subSpecies = "anySub"
    
    func roar () {
        print("\(self.name) roar roar")
    }
    
    func changeToAlphaMale () {
        self.isAlphaMale = true
    }
    
    func randomFact () ->String {
        let randomFact: String
        if self.isAlphaMale {
            randomFact = "Male lions are easy to recognize thanks to their distinctive manes. Males with darker manes are more likely to attract females."
        }
        else {
            randomFact = "Female Lionesses form the stable social unit and do not tolerate outside females."
        }
        return randomFact
    }
}
