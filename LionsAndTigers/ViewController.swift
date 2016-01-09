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
    
    //set up arrays - 1 for tiger structs so array type is [Tiger]
    //the other for the animation options 
    
    var myTigersArray: [Tiger] = []
    var animationOptionsListArray: [UIViewAnimationOptions] = []
    var anotherRandomIndexName = ""
    var currentTiger = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the tiger instances and add to the array
        
        var myTiger = Tiger()  //variable called myTiger which is of the Tiger type -> the struct
        myTiger.age = 3
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTigersArray.append(myTiger)
        
   //    print("My tiger is called \(myTiger.name) he is \(myTiger.age) years old. His breed is \(myTiger.breed) and he looks like this \(myTiger.image) ")
        
        var secondTiger = Tiger()
        secondTiger.age = 2
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.age = 4
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.age = 5
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigersArray += [secondTiger, thirdTiger, fourthTiger]
        
        //set up the animations array with all the different types
        
        animationOptionsListArray += [UIViewAnimationOptions.TransitionCurlUp, UIViewAnimationOptions.TransitionFlipFromBottom, UIViewAnimationOptions.TransitionFlipFromLeft, UIViewAnimationOptions.TransitionFlipFromRight, UIViewAnimationOptions.TransitionFlipFromTop, UIViewAnimationOptions.TransitionCrossDissolve]
        
        //set up the initial screen
        
        myImageView.image = myTiger.image
        nameLabel.text = myTiger.name
        ageLabel.text = "\(myTiger.age)"
        breedLabel.text = myTiger.breed
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //press the button
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        //get a random number to index into the tiger array
        var randomIndex = Int(arc4random_uniform(UInt32(myTigersArray.count)))
        
        //checking in the console if indexs match or not
        print("current tiger index: \(currentTiger) Random index : \(randomIndex)")
     
        
//        //detect duplicates ie current tiger (index number) is the same as the new random index number generated
//        if randomIndex == currentTiger {
//            randomIndex++
//            print("DUPLICATE RANDOM INDEX INCREASED BY 1")
//        }
        
        //try detecting duplicates with a while loop
        while randomIndex == currentTiger {
              randomIndex = Int(arc4random_uniform(UInt32(myTigersArray.count)))
            print("Duplicate detected new random tiger number: \(randomIndex)")
        }
        
        //set the random tiger variable ready to call and populate the view items
        let randomTiger = myTigersArray[randomIndex]
        
        //get a random number to chose an animation type
        let anotherRandomIndex = Int(arc4random_uniform(UInt32(animationOptionsListArray.count)))
       
        
        //put the colours right so white text doesn't get lost in the snow !
        if randomIndex == 3 {
            nameLabel.textColor = UIColor.blackColor()
            ageLabel.textColor = UIColor.blackColor()
            breedLabel.textColor = UIColor.blackColor()
            
        }
        else {
            nameLabel.textColor = UIColor.whiteColor()
            ageLabel.textColor = UIColor.whiteColor()
            breedLabel.textColor = UIColor.whiteColor()
        }
        
        //set up the view transitions and add the tiger based on the random index selected
        UIView.transitionWithView(self.view, duration: 2, options: animationOptionsListArray[anotherRandomIndex],
            animations: {
                self.myImageView.image = randomTiger.image
                self.nameLabel.text = randomTiger.name
                self.ageLabel.text = "\(randomTiger.age)"
                self.breedLabel.text = randomTiger.breed
            
            },
            completion: {
                (finished: Bool) -> () in})
        
        currentTiger = randomIndex

   }

}

