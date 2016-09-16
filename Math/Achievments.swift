//
//  Achievments.swift
//  Math
//
//  Created by Anirudh on 6/4/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class Achievments : UIViewController {
    
    @IBOutlet weak var redStarLabel: UILabel!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var goldStarLabel: UILabel!
    @IBOutlet weak var goldView: UIView!
    @IBOutlet weak var trophyLabel: UILabel!
    @IBOutlet weak var trophyView: UIView!
    
    var levelStuff: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var PQuestions = 0
    var sound = true
    
    var redStars = 0
    var goldStars = 0
    var trophys = 0
    
    override func viewDidLoad() {
        
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


        if let checker = levelStuff.valueForKey("redStars") as? String{
            var redStarsT = levelStuff.valueForKey("redStars") as! NSString
            redStars = redStarsT.integerValue
            levelStuff.synchronize()
        }
        if let checker = levelStuff.valueForKey("goldStars") as? String{
            var goldStarsT = levelStuff.valueForKey("goldStars") as! NSString
            goldStars = goldStarsT.integerValue
            levelStuff.synchronize()
        }
        if let checker = levelStuff.valueForKey("trophys") as? String{
            var trophysT = levelStuff.valueForKey("trophys") as! NSString
            trophys = trophysT.integerValue
            levelStuff.synchronize()
        }
        
        if(goldStars==0){
            goldView.hidden = true
        }
        else{
            goldView.hidden = false
        }
        
        if(trophys==0){
            trophyView.hidden = true
        }
        else{
            trophyView.hidden = false
        }
        
        defaults.setObject("false", forKey: "notifications")
        defaults.synchronize()
        
        redStarLabel.text = "\(redStars)"
        goldStarLabel.text = "\(goldStars)"
        trophyLabel.text = "\(trophys)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let DestViewController : MainMenu = segue.destinationViewController as! MainMenu
        
        DestViewController.PQuestions = PQuestions
        DestViewController.sound = sound
        
    }
    
}