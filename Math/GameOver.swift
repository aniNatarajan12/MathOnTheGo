//
//  GameOver.swift
//  Math
//
//  Created by Anirudh on 4/9/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import UIKit

class GameOver : UIViewController {
    
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var wrong: UILabel!
    @IBOutlet weak var correct: UILabel!
    @IBOutlet weak var HS: UILabel!
    
    var totalText = String()
    var wrongText = String()
    var correctText = String()
    var HSText = String()
    var addition = false
    var subtraction = false
    var multiplication = false
    
    
    override func viewDidLoad() {
        total.text = totalText
        wrong.text = wrongText
        correct.text = correctText
        HS.text = HSText

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if(segue.destinationViewController.isKindOfClass(Math)){
            let Maths : Math = segue.destinationViewController as! Math
            
            if(addition){
                Maths.addition = true
            }
            else if(subtraction){
                Maths.subtraction = true
            }
            else if(multiplication){
                Maths.multiplication = true
            }
        }
        
    }
    
}
