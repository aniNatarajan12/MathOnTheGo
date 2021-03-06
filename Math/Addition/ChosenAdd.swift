//
//  ChosenAdd.swift
//  Math
//
//  Created by Anirudh on 4/26/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class ChosenAdd: UIViewController {
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var extraView: UIView!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var goHome: UIButton!
    @IBOutlet weak var logo: UIImageView!
    
    var practice = false
    var test = false
    var level = 1
    var PQuestions = 0
    var sound = true
    
    var levelStuff: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var AlarmSystem: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        
        if let checker = levelStuff.valueForKey("levelA") as? String{
            var A = levelStuff.valueForKey("levelA") as! NSString
            level = A.integerValue
        }
        if let checker = AlarmSystem.valueForKey("sound") as? String{
            var S = AlarmSystem.valueForKey("sound") as! NSString
            AlarmSystem.setObject("\(S)", forKey: "sound")
            AlarmSystem.synchronize()
        }
        if let checker = AlarmSystem.valueForKey("questions") as? String{
            var Q = AlarmSystem.valueForKey("questions") as! NSString
            AlarmSystem.setObject("\(Q)", forKey: "questions")
            AlarmSystem.synchronize()
        }
        
        levelLabel.text = "\(level)"
        
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
        
        extraView.hidden = true;
        logo.hidden = true
        

    }
    
    @IBAction func practicePressed(sender: AnyObject) {
        practice = true
        self.performSegueWithIdentifier("goToNextPageA", sender: self)
    }
    @IBAction func testPressed(sender: AnyObject) {
        test = true
        extraView.hidden = false
        logo.hidden = false
        goHome.hidden = true
    }
    
    @IBAction func yesPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("goToNextPageA", sender: self)
    }
    @IBAction func noPressed(sender: AnyObject) {
        extraView.hidden = true
        logo.hidden = true
        goHome.hidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.destinationViewController.isKindOfClass(MathAdd)) {
            let DestViewController:MathAdd = segue.destinationViewController as! MathAdd
            DestViewController.level = level
            if(practice==true){
                DestViewController.practice = true
                DestViewController.test = false
            }
            else if(test==true){
                DestViewController.test = true
                DestViewController.practice = false
            }
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
        }
        else if(segue.destinationViewController.isKindOfClass(MainMenu)){
            let DestViewController:MainMenu = segue.destinationViewController as! MainMenu
            
            DestViewController.levelStuff.setObject("\(level)", forKey: "levelA")
            DestViewController.levelStuff.synchronize()
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
        }
    }
}