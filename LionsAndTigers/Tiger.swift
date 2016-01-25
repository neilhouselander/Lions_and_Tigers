//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Neil Houselander on 01/01/2016.
//  Copyright © 2016 Neil Houselander. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var name = ""
    var age = 0
    var breed = ""
    var image = UIImage(named: "anystring")
    
    func chuff() {
        print("\(self.name) says Chuff Chuff")
   
    }
    
    func chuffANumberOfTimes (numberOfChuffs: Int) {
        for var chuff = 0; chuff < numberOfChuffs; chuff++ {
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes (numberOfChuffs: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfChuffs; chuffTimes++ {
            if isLoud {
                chuff()
            }
            else {
                print("\(self.name) says purr, purr")
            }
        }
    }
    
    func ageInTigerYearsFromAge (tigerAge : Int) ->Int {
        let newAge = tigerAge * 3
        return newAge
    }
    
    func randomTigerFact() ->String {
        let randomFact = ["The tiger is the biggest species in the cat family", "Tigers can reach a length of 3.3 meters", "A group of tigers is known as a 'streak' or 'ambush'"]
        let randomFactIndex = Int(arc4random_uniform(UInt32(randomFact.count)))
        print(randomFact[randomFactIndex])
        
        return randomFact[randomFactIndex]
        
        
    }
    
}



