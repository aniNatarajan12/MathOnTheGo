//
//  OptionsMenu.swift
//  Math
//
//  Created by Anirudh on 4/14/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class OptionsMenu : UIViewController {
    var TimerPlaceHolder = Int()
    var ScorePLaceHolder = Int()
    var TotalPlaceHolder = Int()
    var WrongPlaceHolder = Int()
    var HSPlaceHolder = Int()
    var addition = false
    var subtraction = false
    var multiplication = false
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.destinationViewController.isKindOfClass(Math)){
            
            let DestViewController : Math = segue.destinationViewController as! Math
        
            DestViewController.timerCount = TimerPlaceHolder
            DestViewController.correct = ScorePLaceHolder
            DestViewController.wrong = WrongPlaceHolder
            DestViewController.total = TotalPlaceHolder
            DestViewController.high = HSPlaceHolder
            
            if(addition){
                DestViewController.addition = true
            }
            else if(subtraction){
                DestViewController.subtraction = true
            }
            else if(multiplication){
                DestViewController.multiplication = true
            }
            
        }
        
    }
    
}