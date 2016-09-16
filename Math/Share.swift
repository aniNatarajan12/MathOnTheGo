//
//  Share.swift
//  Math
//
//  Created by Anirudh on 5/24/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit
import Social

class Share : UIViewController, UITextFieldDelegate {
    
    var score = 0
    var level = 1
    var mode = String()
    var image = UIImage()
    var sound = true
    var PQuestions = 20
    
    let levelStuff: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        if(mode=="addition"){
            if let checker = levelStuff.valueForKey("levelA") as? String{
                var A = levelStuff.valueForKey("levelA") as! NSString
                level = A.integerValue
            }
        }
        else if(mode=="subtraction"){
            if let checker = levelStuff.valueForKey("levelS") as? String{
                var S = levelStuff.valueForKey("levelS") as! NSString
                level = S.integerValue
            }
        }
        else if(mode=="multiplication"){
            if let checker = levelStuff.valueForKey("levelM") as? String{
                var M = levelStuff.valueForKey("levelM") as! NSString
                level = M.integerValue
            }
        }
    }
    
    @IBAction func shareToFB(sender: AnyObject) {
        
        let FB = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        self.presentViewController(FB, animated: true , completion: nil)
        
        FB.setInitialText("I'm playing MathOnTheGo and I scored \(score) on my level \(level-1) \(mode) test!  https://www.facebook.com/MathOnTheGo" )
        FB.addImage(image)
        
    }
    

    @IBAction func shareToTwitter(sender: AnyObject) {
        
        let Twitter : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        self.presentViewController(Twitter, animated: true , completion: nil)
        
        Twitter.setInitialText("I'm playing MathOnTheGo and I scored \(score) on my level \(level-1) \(mode) test!  https://www.facebook.com/MathOnTheGo" )
        Twitter.addImage(image)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : MainMenu = segue.destinationViewController as! MainMenu
        
        DestViewController.PQuestions = PQuestions
        DestViewController.sound = sound
    }
    
}