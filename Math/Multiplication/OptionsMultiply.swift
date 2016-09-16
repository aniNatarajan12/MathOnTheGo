//
//  OptionsMenu.swift
//  Math
//
//  Created by Anirudh on 4/14/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class OptionsMultiply : UIViewController {
    
    var TimerPlaceHolder = Int()
    var ScorePLaceHolder = Int()
    var TotalPlaceHolder = Int()
    var WrongPlaceHolder = Int()
    var HSPlaceHolder = Int()
    var practice = false
    var test = false
    var level = 1
    var PQuestions = 0
    var sound = true
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.destinationViewController.isKindOfClass(MathMultiply)){
            let DestViewController : MathMultiply = segue.destinationViewController as! MathMultiply
            
            DestViewController.timerCount = TimerPlaceHolder
            DestViewController.correct = ScorePLaceHolder
            DestViewController.wrong = WrongPlaceHolder
            DestViewController.total = TotalPlaceHolder
            DestViewController.high = HSPlaceHolder
            DestViewController.level = level
            DestViewController.PQuestions = PQuestions
            DestViewController.test = test
            DestViewController.practice = practice
            DestViewController.resumeTest = true
            DestViewController.sound = sound
            
        }
        else if(segue.destinationViewController.isKindOfClass(MainMenu)){
            let DestViewController : MainMenu = segue.destinationViewController as! MainMenu
            
            DestViewController.levelM = level
            DestViewController.PQuestions = PQuestions
            DestViewController.sound = sound
        }
        
    }
    
}