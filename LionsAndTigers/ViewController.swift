//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Neil Houselander on 01/01/2016.
//  Copyright © 2016 Neil Houselander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var factLabel: UILabel!
    
    //set up arrays - 1 for tiger structs so array type is [Tiger]
    //the other for the animation options 
    
    var myTigersArray: [Tiger] = []
    var animationOptionsListArray: [UIViewAnimationOptions] = []
    
    var currentTiger = 0
    
    var currentFact = ""
    
    var aFact = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the tiger instances and add to the array
        
        var myTiger = Tiger()  //variable called myTiger which is of the Tiger type -> the struct
        myTiger.age = 3
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        
        
        
        //myTiger.chuff()
        
        self.myTigersArray.append(myTiger)
        
   //    print("My tiger is called \(myTiger.name) he is \(myTiger.age) years old. His breed is \(myTiger.breed) and he looks like this \(myTiger.image) ")
        
        var secondTiger = Tiger()
        secondTiger.age = 2
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.age = 4
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.age = 5
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        self.myTigersArray += [secondTiger, thirdTiger, fourthTiger]
        
        //set up the animations array with all the different types
        
        self.animationOptionsListArray += [UIViewAnimationOptions.TransitionCurlUp, UIViewAnimationOptions.TransitionFlipFromBottom, UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.TransitionFlipFromRight, UIViewAnimationOptions.TransitionFlipFromTop, UIViewAnimationOptions.TransitionCrossDissolve]
        
        //set up the initial screen
        
        self.myImageView.image = myTigersArray[currentTiger].image
        self.nameLabel.text = myTigersArray[currentTiger].name
        self.ageLabel.text = "\(myTigersArray[currentTiger].age)"
        self.breedLabel.text = myTigersArray[currentTiger].breed
        self.factLabel.text = myTigersArray[currentTiger].randomTigerFact()
        
        myTiger.chuffANumberOfTimes(5, isLoud: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //press the button
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        //hide the webView if its visible
        self.webView.hidden = true
        
        //get a random number to index into the tiger array
        var randomIndex = Int(arc4random_uniform(UInt32(self.myTigersArray.count)))
        
        //checking in the console if indexs match or not
        print("current tiger: \(self.currentTiger) Random tiger: \(randomIndex)")
     
        
//        //detect duplicates ie current tiger (index number) is the same as the new random index number generated
//        if randomIndex == currentTiger {
//            randomIndex++
//            print("DUPLICATE RANDOM INDEX INCREASED BY 1")
//        }
        
        //try detecting duplicates with a while loop
        while randomIndex == self.currentTiger {
              randomIndex = Int(arc4random_uniform(UInt32(self.myTigersArray.count)))
            print("Duplicate detected new random tiger number: \(randomIndex)")
        }
        
        //set the random tiger variable ready to call and populate the view items
        let randomTiger = self.myTigersArray[randomIndex]
        print("Index: \(randomIndex) :\(randomTiger.name)")
        
        //get a random number to choose an animation type
        let anotherRandomIndex = Int(arc4random_uniform(UInt32(animationOptionsListArray.count)))
       
        
        //put the colours right so white text doesn't get lost in the snow !
        if randomIndex == 3 {
            self.nameLabel.textColor = UIColor.blackColor()
            self.ageLabel.textColor = UIColor.blackColor()
            self.breedLabel.textColor = UIColor.blackColor()
            self.factLabel.textColor = UIColor.blackColor()
            
        }
        else {
            self.nameLabel.textColor = UIColor.whiteColor()
            self.ageLabel.textColor = UIColor.whiteColor()
            self.breedLabel.textColor = UIColor.whiteColor()
            self.factLabel.textColor = UIColor.whiteColor()
        }
        
        //set up the view transitions and add the tiger based on the random index selected
        UIView.transitionWithView(self.view, duration: 2, options: self.animationOptionsListArray[anotherRandomIndex],
            animations: {
                self.myImageView.image = randomTiger.image
                self.nameLabel.text = randomTiger.name
                self.ageLabel.text = "\(randomTiger.age)"
                self.breedLabel.text = randomTiger.breed
                randomTiger.chuffANumberOfTimes(5, isLoud: false)
                
                //assigned the randomfact function to a local so I can check if same as current view fact. If it is then function called again
                self.aFact = randomTiger.randomTigerFact()
                
                while self.aFact == self.currentFact {
                    print("fact duplicate - re-randomized")
                    self.aFact = randomTiger.randomTigerFact()
                }
                self.factLabel.text = self.aFact
              },
            completion: {
                (finished: Bool) -> () in})
        
        self.currentTiger = randomIndex
        self.currentFact = aFact
     

   }
    
    @IBAction func playVideoButtonPressed(sender: UIBarButtonItem) {
        self.webView.hidden = false
        let youTubeUrl = "https://www.youtube.com/embed/5Ksr0-H1gmI"
        webView.allowsInlineMediaPlayback = true
        self.webView.loadHTMLString("<iframe width=\"\(webView.frame.width)\" height=\"\(webView.frame.height)\" src=\"\(youTubeUrl)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
    }
    

}

