//
//  ViewController.swift
//  Math
//
//  Created by Anirudh Natarajan on 3/14/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class Math : UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var firstNumber: UILabel!
    @IBOutlet weak var secondNumber: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var Solution: UIImageView!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var options: UIButton!
    @IBOutlet weak var end: UIButton!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    
    var addition = false
    var subtraction = false
    var multiplication = false
    
    var randone = 0
    var randtwo = 0
    var OP = 0
    
    var AnswerG = 0
    
    var correct = 0
    var wrong = 0
    var total = 0
    var high = 0
    
    var timerCount = 60
    var timerRunning = false
    var timer = NSTimer()
    var timePlaceHold = 0
    
    var numbers:[String] = ["0","1","2","3","4","5","6","7","8","9"]
    var operations:[String] = ["plus","minus"]
    var result:[String] = ["right","wrong"]
    
    
    
    func Counting(){
        timerCount -= 1
        timerLabel.text = "\(timerCount)"
        
        if(timerCount<=0){
            answer.resignFirstResponder()
            timer.invalidate()
            timerRunning = false
            firstNumber.hidden = true
            secondNumber.hidden = true
            timerLabel.hidden = true
            operation.hidden = true
            answer.hidden = true
            enter.hidden = true
            score.hidden = true
            Solution.hidden = true
            ScoreLabel.hidden = true
            TimeLabel.hidden = true
            options.hidden = true
            end.hidden = false
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("nextPage"), userInfo: nil, repeats: false)
        }
        
    }
    
    func nextPage(){
        self.performSegueWithIdentifier("timesUp", sender: self)
    }
    
    
    override func viewDidLoad() {
        end.hidden = true
        timerLabel.text = "\(timerCount)"
        score.text = "\(correct)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        timerRunning = true
        
        if(addition){
            randone = Int(arc4random_uniform(10))
            randtwo = Int(arc4random_uniform(10))
            
            
            secondNumber.text = numbers[randtwo]
            firstNumber.text = numbers[randone]
            operation.text = "+"
            
        }
        else if(subtraction){
            randone = Int(arc4random_uniform(10))
            randtwo = Int(arc4random_uniform(UInt32(randone)))
            
            secondNumber.text = numbers[randtwo]
            firstNumber.text = numbers[randone]
            operation.text = "-"
            
        }
        else if(multiplication){
            
            randone = Int(arc4random_uniform(10))
            randtwo = Int(arc4random_uniform(10))
            
            secondNumber.text = numbers[randtwo]
            firstNumber.text = numbers[randone]
            operation.text = "x"
            operation.font = UIFont(name: operation.font.fontName, size: 90)
            
        }
        
        
        //        randone = Int(arc4random_uniform(10))
        //        randtwo = Int(arc4random_uniform(10))
        //        OP = Int(arc4random_uniform(2))
        //        self.secondNumber.image = UIImage(named: self.numbers[randtwo])
        //        self.firstNumber.image = UIImage(named: self.numbers[randone])
        //        self.operation.image = UIImage(named: self.operations[OP])
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func txtClear(sender: UITextField) {
        answer.text = ""
    }
    
    
    @IBAction func submitted(sender: UIButton) {
        
        if timerCount > 0 {
            if(addition){
                
                AnswerG = randone + randtwo
                
                if(Int(answer.text!)! != AnswerG){
                    self.Solution.image = UIImage(named: self.result[1])
                    wrong++
                    total++
                }
                else{
                    self.Solution.image = UIImage(named: self.result[0])
                    correct++
                    total++
                    score.text = "\(correct)"
                }
                
                randone = Int(arc4random_uniform(10))
                randtwo = Int(arc4random_uniform(10))
                
                self.secondNumber.text = numbers[randtwo]
                self.firstNumber.text = numbers[randone]
                
            }
            else if(subtraction){
                
//                println("hello")
                
                AnswerG = randone - randtwo
                
                if(Int(answer.text!)! != AnswerG){
                    self.Solution.image = UIImage(named: self.result[1])
                    wrong++
                    total++
                }
                else{
                    self.Solution.image = UIImage(named: self.result[0])
                    correct++
                    total++
                    score.text = "\(correct)"
                }
                
                randone = Int(arc4random_uniform(10))
                randtwo = Int(arc4random_uniform(UInt32(randone)))
                
                self.secondNumber.text = numbers[randtwo]
                self.firstNumber.text = numbers[randone]
                
            }
            else if(multiplication){
                
                AnswerG = randone * randtwo
                
                if(Int(answer.text!) != AnswerG){
                    self.Solution.image = UIImage(named: self.result[1])
                    wrong++
                    total++
                }
                else{
                    self.Solution.image = UIImage(named: self.result[0])
                    correct++
                    total++
                    score.text = "\(correct)"
                }
                
                randone = Int(arc4random_uniform(10))
                randtwo = Int(arc4random_uniform(10))
                
                self.secondNumber.text = numbers[randtwo]
                self.firstNumber.text = numbers[randone]
                
            }
            
            txtClear(answer)
            
            if(correct>high){
                high = correct
                
            }
            
        }
        if timerCount <= 0 {
            answer.resignFirstResponder()
            timer.invalidate()
            timerRunning = false
            firstNumber.hidden = true
            secondNumber.hidden = true
            timerLabel.hidden = true
            operation.hidden = true
            answer.hidden = true
            enter.hidden = true
            score.hidden = true
            Solution.hidden = true
            ScoreLabel.hidden = true
            TimeLabel.hidden = true
            options.hidden = true
            end.hidden = false
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let highCheck = defaults.valueForKey("highScore") as? String{
            
            if(high > Int(highCheck)){
                defaults.setObject("\(high)", forKey: "highScore")
                defaults.synchronize()
            }
        }
        else{
            defaults.setObject("\(high)", forKey: "highScore")
            defaults.synchronize()
        }
        
        let myStringH = defaults.valueForKey("highScore") as? String
        let x : Int = total
        let myStringT = String(x)
        let y : Int = wrong
        let myStringW = String(y)
        let z : Int = correct
        let myStringC = String(z)
        
        if (segue.destinationViewController.isKindOfClass(GameOver)) {
            
            let DestViewController : GameOver = segue.destinationViewController as! GameOver
            DestViewController.HSText = myStringH!
            DestViewController.totalText = myStringT
            DestViewController.wrongText = myStringW
            DestViewController.correctText = myStringC
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
        else if (segue.destinationViewController.isKindOfClass(OptionsMenu)) {
            
            let DestViewController : OptionsMenu = segue.destinationViewController as! OptionsMenu
            
            DestViewController.TimerPlaceHolder = timerCount
            DestViewController.ScorePLaceHolder = correct
            DestViewController.WrongPlaceHolder = wrong
            DestViewController.TotalPlaceHolder = total
            DestViewController.HSPlaceHolder = high
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

/* 
func randomInt(min: Int, max:Int) -> Int {
return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}
*/
