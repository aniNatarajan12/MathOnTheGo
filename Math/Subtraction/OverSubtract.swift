//
//  GameOver.swift
//  Math
//
//  Created by Anirudh on 4/9/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import UIKit

class OverSubtract : UIViewController {
    
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var wrong: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var HS: UILabel!
    @IBOutlet weak var High: UILabel!
    @IBOutlet weak var Congrats: UILabel!
    @IBOutlet weak var passed: UILabel!
    @IBOutlet weak var NextLevel: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var achievments: UIButton!
    @IBOutlet weak var redstar1: UIImageView!
    @IBOutlet weak var redstar2: UIImageView!
    @IBOutlet weak var redstar3: UIImageView!
    @IBOutlet weak var redstar4: UIImageView!
    @IBOutlet weak var goldstar: UIImageView!
    @IBOutlet weak var trophy: UIImageView!
    @IBOutlet weak var notificationsImage: UIImageView!
    
    var levelStuff: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var AlarmSystem: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var totalText = String()
    var wrongText = String()
    var correctText = String()
    var HSText = String()
    var practice = false
    var test = false
    var advance = false
    var level = 1
    var PQuestions = 0
    var sound = true
    
    override func viewDidLoad() {
        
        levelStuff.setObject("\(level)", forKey: "levelS")
        levelStuff.synchronize()
        if let checker = levelStuff.valueForKey("levelM") as? String{
            var M = levelStuff.valueForKey("levelM") as! NSString
            levelStuff.setObject("\(M)", forKey: "levelM")
            levelStuff.synchronize()
        }
        if let checker = levelStuff.valueForKey("levelA") as? String{
            var A = levelStuff.valueForKey("levelA") as! NSString
            levelStuff.setObject("\(A)", forKey: "levelA")
            levelStuff.synchronize()
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
        
        Congrats.hidden = false
        passed.hidden = false
        NextLevel.hidden = false
        redstar1.hidden = true
        redstar2.hidden = true
        redstar3.hidden = true
        redstar4.hidden = true
        goldstar.hidden = true
        trophy.hidden = true
        notificationsImage.hidden = true
        
        if(practice){
            Congrats.hidden = true
            passed.hidden = true
            NextLevel.hidden = true
            HS.hidden = true
            High.hidden = true
            share.hidden = true
        }
        else if(!advance){
            Congrats.text = "so close!"
            var image = UIImage(named: "try_again.png")
            NextLevel.setImage(image, forState: .Normal)
        }
        
        var tS = Int(totalText)! - 1
        var totalShow = String(tS)
        
        total.text = totalShow
        wrong.text = wrongText
        correct.text = correctText
        HS.text = HSText
    }
    
    override func viewDidAppear(animated: Bool) {
        var trophyCheck = false
        var redStars = 0
        var goldStars = 0
        var trophys = 0
        
        if(test && advance){
            defaults.setObject("true", forKey: "notifications")
            defaults.synchronize()
            notificationsImage.hidden = false
            
            goldStars++
            goldstar.hidden = false
            flyStar(goldstar, stop: 0.1)
            if let checker = levelStuff.valueForKey("goldStars") as? String{
                var G = levelStuff.valueForKey("goldStars") as! NSString
                goldStars += G.integerValue
                if(goldStars>=10){
                    trophy.hidden = false
                    flyStar(trophy, stop: 0.3)
                }
            }
            if let checker = levelStuff.valueForKey("redStars") as? String{
                var R = levelStuff.valueForKey("redStars") as! NSString
                redStars = R.integerValue
            }
            if let checker = levelStuff.valueForKey("trophys") as? String{
                var T = levelStuff.valueForKey("trophys") as! NSString
                trophys = T.integerValue
            }
        }
        else if (practice){
            redStars = Int(correctText)!/10
            if(redStars==1){
                print("1 correct")
                redstar1.hidden = false
                flyStar(redstar1, stop: 0.1)
                
                defaults.setObject("true", forKey: "notifications")
                defaults.synchronize()
                notificationsImage.hidden = false
            }
            else if(redStars==2){
                redstar1.hidden = false
                redstar2.hidden = false
                flyStar(redstar1, stop: 0.1)
                flyStar(redstar2, stop: 0.3)
                
                defaults.setObject("true", forKey: "notifications")
                defaults.synchronize()
                notificationsImage.hidden = false
            }
            else if(redStars==3){
                redstar1.hidden = false
                redstar2.hidden = false
                redstar3.hidden = false
                flyStar(redstar1, stop: 0.1)
                flyStar(redstar2, stop: 0.3)
                flyStar(redstar3, stop: 0.5)
                
                defaults.setObject("true", forKey: "notifications")
                defaults.synchronize()
                notificationsImage.hidden = false
            }
            else if(redStars==4){
                redstar1.hidden = false
                redstar2.hidden = false
                redstar3.hidden = false
                redstar4.hidden = false
                flyStar(redstar1, stop: 0.1)
                flyStar(redstar2, stop: 0.3)
                flyStar(redstar3, stop: 0.5)
                flyStar(redstar4, stop: 0.7)
                
                defaults.setObject("true", forKey: "notifications")
                defaults.synchronize()
                notificationsImage.hidden = false
            }
            if let checker = levelStuff.valueForKey("redStars") as? String{
                var R = levelStuff.valueForKey("redStars") as! NSString
                var redStarsTemp = redStars
                redStars += R.integerValue
                if(redStars>=10){
                    trophyCheck = true
                    goldstar.hidden = false
                    if(redStarsTemp==1){
                        flyStar(goldstar, stop: 0.3)
                    }
                    else if(redStarsTemp==2){
                        flyStar(goldstar, stop: 0.5)
                    }
                    else if(redStarsTemp==3){
                        flyStar(goldstar, stop: 0.7)
                    }
                    else if(redStarsTemp==4){
                        flyStar(goldstar, stop: 0.9)
                    }
                }
            }
            if let checker = levelStuff.valueForKey("goldStars") as? String{
                var G = levelStuff.valueForKey("goldStars") as! NSString
                goldStars = G.integerValue
                if(trophyCheck==true){
                    if(goldStars==9){
                        flyStar(trophy, stop: 1.1)
                    }
                }
            }
            if let checker = levelStuff.valueForKey("trophys") as? String{
                var T = levelStuff.valueForKey("trophys") as! NSString
                trophys = T.integerValue
            }
        }
        else{
            if let checker = levelStuff.valueForKey("redStars") as? String{
                var R = levelStuff.valueForKey("redStars") as! NSString
                redStars = R.integerValue
            }
            if let checker = levelStuff.valueForKey("goldStars") as? String{
                var G = levelStuff.valueForKey("goldStars") as! NSString
                goldStars = G.integerValue
            }
            if let checker = levelStuff.valueForKey("trophys") as? String{
                var T = levelStuff.valueForKey("trophys") as! NSString
                trophys = T.integerValue
            }
        }
        
        if(redStars>=10){
            redStars -= 10
            goldStars++
        }
        
        if(goldStars>=10){
            goldStars -= 10
            trophys++
        }
        
        levelStuff.setObject("\(redStars)", forKey: "redStars")
        levelStuff.synchronize()
        levelStuff.setObject("\(goldStars)", forKey: "goldStars")
        levelStuff.synchronize()
        levelStuff.setObject("\(trophys)", forKey: "trophys")
        levelStuff.synchronize()
        
        if(defaults.valueForKey("notifications") as? String == "true"){
            notificationsImage.hidden = false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
       
        if(segue.destinationViewController.isKindOfClass(ChosenSubtract)){
            let DestViewController : ChosenSubtract = segue.destinationViewController as! ChosenSubtract
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
            DestViewController.level = level
        }
        else if(segue.destinationViewController.isKindOfClass(MainMenu)){
            let DestViewController : MainMenu = segue.destinationViewController as! MainMenu
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
            DestViewController.levelS = level
        }
        else if(segue.destinationViewController.isKindOfClass(Achievments)){
            let DestViewController : Achievments = segue.destinationViewController as! Achievments
            levelStuff.setObject("\(level)", forKey: "levelS")
            levelStuff.synchronize()
            DestViewController.sound = sound
            DestViewController.PQuestions = PQuestions
        }
        else if(segue.destinationViewController.isKindOfClass(Share)){
            let DestViewController : Share = segue.destinationViewController as! Share
            
            DestViewController.score = Int(correctText)!
            DestViewController.mode = "subtraction"
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
            
            UIGraphicsBeginImageContextWithOptions(UIScreen.mainScreen().bounds.size, false, 0);
            self.view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
            let image:UIImage = UIGraphicsGetImageFromCurrentImageContext();
            DestViewController.image = image
        }
    }
    
    func flyStar (star: UIImageView, stop: NSTimeInterval){
        let frm: CGRect = achievments.frame
        UIView.animateWithDuration(2, delay: stop, options: UIViewAnimationOptions.CurveEaseInOut, animations: {() -> Void in
            star.center = CGPointMake(frm.origin.x + 30, frm.origin.y + 27)
            }, completion: {
                (value: Bool) in
                star.removeFromSuperview()
        })
    }
    
}
