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
    
    var myTigersArray: [Tiger] = []
    var lionsArray:[Lion] = []
    var lionCubArray : [LionCub] = []
    
    var currentAnimal = (species: "Tiger", index: 0)
    
    var currentTiger = 0
    
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
        
        //set up the lion instances
        
        let lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mustafa"
        lion.subSpecies = "West African"
        
        let lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subSpecies = "Barbary"
        
        self.lionsArray += [lion, lioness]
        
        let lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.isAlphaMale = true
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subSpecies = "Masai"
        
        let femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.isAlphaMale = false
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subSpecies = "Transvaal"
        
        lionCubArray += [lionCub, femaleLionCub]
        
        
        //set up the initial screen
        
        self.myImageView.image = myTigersArray[currentTiger].image
        self.nameLabel.text = myTigersArray[currentTiger].name
        self.ageLabel.text = "\(myTigersArray[currentTiger].age)"
        self.breedLabel.text = myTigersArray[currentTiger].breed
        self.factLabel.text = myTigersArray[currentTiger].randomTigerFact()
        
        myTiger.chuffANumberOfTimes(1, isLoud: true)
        
        lion.roar()
        lioness.roar()
        lionCub.roar()
        lionCub.rubLionCubBelly()
        
        lion.changeToAlphaMale()
        print("is lion alphaMale? :\(lion.isAlphaMale)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //press the button
    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        //hide the webView if its visible
        self.webView.hidden = true
        
        self.updateAnimal()
        self.updateViewWithCurrentAnimal()
  
   }
    
    //helper functions
    //whats the current animal - switch to the other and pick a random one from the array
    
    func updateAnimal() {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionsArray.count)))
            currentAnimal = ("Lion", randomIndex)
            
        case ("Lion Cub", _):
            let randomIndex = Int(arc4random_uniform(UInt32(myTigersArray.count)))
            currentAnimal = ("Tiger", randomIndex)
            
        default:
            
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubArray.count)))
            currentAnimal = ("Lion Cub", randomIndex)
         }
        
    }
    //set the view to generated lion/tiger
    func updateViewWithCurrentAnimal() {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromLeft,
            animations: {
        
        if self.currentAnimal.species == "Tiger" {
            let tiger = self.myTigersArray[self.currentAnimal.index]
             
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.factLabel.text = tiger.randomTigerFact()
                        
        }
        else if self.currentAnimal.species == "Lion" {
            
            let lion = self.lionsArray[self.currentAnimal.index]
            self.myImageView.image = lion.image
            self.nameLabel.text = lion.name
            self.ageLabel.text = "\(lion.age)"
            self.breedLabel.text = lion.subSpecies
            self.factLabel.text = lion.randomFact()
            
        }
        else {
            let smallCub = self.lionCubArray[self.currentAnimal.index]
            self.myImageView.image = smallCub.image
            self.nameLabel.text = smallCub.name
            self.ageLabel.text = "\(smallCub.age)"
            self.breedLabel.text = smallCub.subSpecies
            self.factLabel.text = smallCub.randomFact()
                       
        }
       
            },
            completion: {
                (finished: Bool) -> () in})
        
        
        
    }
    
    @IBAction func playVideoButtonPressed(sender: UIBarButtonItem) {
        self.webView.hidden = false
        let youTubeUrl = "https://www.youtube.com/embed/5Ksr0-H1gmI"
        webView.allowsInlineMediaPlayback = true
        self.webView.loadHTMLString("<iframe width=\"\(webView.frame.width)\" height=\"\(webView.frame.height)\" src=\"\(youTubeUrl)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>", baseURL: nil)
        
    }
    

}

