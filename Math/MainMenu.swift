//
//  MainMenu.swift
//  Math
//
//  Created by Anirudh on 4/9/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import UIKit

class MainMenu : UIViewController {
    
    @IBOutlet weak var notificationsImage: UIImageView!
    
    var levelA = 1
    var levelS = 1
    var levelM = 1
    var PQuestions = 0
    var sound = true
    
    var levelStuff: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var AlarmSystem: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        notificationsImage.hidden = true
        
        if let checker = levelStuff.valueForKey("levelA") as? String{
            var A = levelStuff.valueForKey("levelA") as! NSString
            levelA = A.integerValue
        }
        
        if let checker = levelStuff.valueForKey("levelS") as? String{
            var S = levelStuff.valueForKey("levelS") as! NSString
            levelS = S.integerValue
        }
        
        if let checker = levelStuff.valueForKey("levelM") as? String{
            var M = levelStuff.valueForKey("levelM") as! NSString
            levelM = M.integerValue
        }
        
        if(defaults.valueForKey("notifications") as? String == "true"){
            notificationsImage.hidden = false
        }
        
        if let checker = levelStuff.valueForKey("redStars") as? String{
            var R = levelStuff.valueForKey("redStars") as! NSString
            levelStuff.setObject("\(R)", forKey: "redStars")
            levelStuff.synchronize()
        }
        if let checker = levelStuff.valueForKey("goldStars") as? String{
            var G = levelStuff.valueForKey("goldStars") as! NSString
            levelStuff.setObject("\(G)", forKey: "golddStars")
            levelStuff.synchronize()
        }
        if let checker = levelStuff.valueForKey("trophy") as? String{
            var T = levelStuff.valueForKey("trophy") as! NSString
            levelStuff.setObject("\(T)", forKey: "trophy")
            levelStuff.synchronize()
        }
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.destinationViewController.isKindOfClass(ChosenAdd)){
            let DestViewController : ChosenAdd = segue.destinationViewController as! ChosenAdd
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
            
            DestViewController.level = levelA
        }
        else if(segue.destinationViewController.isKindOfClass(ChosenSubtract)){
            let DestViewController : ChosenSubtract = segue.destinationViewController as! ChosenSubtract
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
            
            DestViewController.level = levelS
        }
        else if(segue.destinationViewController.isKindOfClass(ChosenMultiply)){
            let DestViewController : ChosenMultiply = segue.destinationViewController as! ChosenMultiply
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
            
            DestViewController.level = levelM
        }
        else if(segue.destinationViewController.isKindOfClass(Settings)){
            let DestViewController : Settings = segue.destinationViewController as! Settings
            DestViewController.PQuestions = PQuestions
            if(!sound){
                DestViewController.sound = sound
            }
        }
        else if(segue.destinationViewController.isKindOfClass(Help)){
            let DestViewController : Help = segue.destinationViewController as! Help
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
        }
        else if(segue.destinationViewController.isKindOfClass(Achievments)){
            let DestViewController : Achievments = segue.destinationViewController as! Achievments
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
        }
    }
}
