//
//  MathAdd.swift
//  Math
//
//  Created by Anirudh on 4/26/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

//
//  ViewController.swift
//  Math
//
//  Created by Anirudh Natarajan on 3/14/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MathAdd : UIViewController, UITextFieldDelegate {
    
    

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstNumber: UILabel!
    @IBOutlet weak var secondNumber: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var clock: UIImageView!
    @IBOutlet weak var saysTime: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var Solution: UIImageView!
    @IBOutlet weak var options: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var end: UIButton!
    
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let levelStuff: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let AlarmSystem: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var correctSound = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Correctanswer", ofType: "mp3")!))
    var wrongSound = try? AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath:
        NSBundle.mainBundle().pathForResource("Wronganswer", ofType: "mp3")!))
    var sound = true
    
    var randone = 0
    var randtwo = 0
    var OP = 0
    
    var AnswerG = 0
    var answerSoFar = 0
    
    var correct = 0
    var wrong = 0
    var total = 1
    var high = 0
    
    var practice = false
    var PQuestions = 0
    var test = false
    var pass = false
    
    var level = 1
    var L = 1
    var ll = 1
    
    var timerCount = Int()
    var resumeTest = false
    var timerRunning = false
    var timer = NSTimer()
    var timePlaceHold = 0
    
    var numbers:[String] = ["0","1","2","3","4","5","6","7","8","9"]
    var operations:[String] = ["plus","minus"]
    var result:[String] = ["right","wrong"]
    
    
    
    func Counting(){
        answer.resignFirstResponder()
        if(practice){
            timerCount++
        }
        else if(test){
            timerCount -= 1
        }
        if(test && correct>=15 && timerCount<=0){
            level++
            pass = true
        }
        timerLabel.text = "\(timerCount)"
        
        if(timerCount<=0 && test){
            answer.resignFirstResponder()
            timer.invalidate()
//            timerRunning = false
//            firstNumber.hidden = true
//            secondNumber.hidden = true
//            timerLabel.hidden = true
//            operation.hidden = true
//            answer.hidden = true
//            enter.hidden = true
//            score.hidden = true
//            Solution.hidden = true
//            ScoreLabel.hidden = true
//            saysTime.hidden = true
//            options.hidden = true
//            question.hidden = true
//            questionLabel.hidden = true
//            one.hidden = true
//            two.hidden = true
//            three.hidden = true
//            four.hidden = true
//            five.hidden = true
//            six.hidden = true
//            seven.hidden = true
//            eight.hidden = true
//            nine.hidden = true
//            zero.hidden = true
//            clear.hidden = true
//            end.hidden = false
//            mainView.hidden = true
//            clock.hidden = true
//            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("nextPage"), userInfo: nil, repeats: false)
            nextPage()
        }
        
    }
    
    func nextPage(){
        self.performSegueWithIdentifier("timesUpAdd", sender: self)
    }
    
    func hideSolution(){
        UIView.animateWithDuration(0.1, delay: 1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {() -> Void in
                self.Solution.alpha = 0
            }, completion: {nil}())
    }
    
    
    override func viewDidLoad() {
        answer.resignFirstResponder()
        Solution.hidden = true
        if(PQuestions==0){
            PQuestions = 20
        }
        if(practice){
            question.text = "\(total)" + "/" + "\(PQuestions)"
        }
        else if(test){
            question.text = "\(total)"
            if(!resumeTest){
                timerCount = 60
            }
        }
        end.hidden = true
        timerLabel.text = "\(timerCount)"
        score.text = "\(correct)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        timerRunning = true
        
        if let checker = levelStuff.valueForKey("levelA") as? String{
            var A = levelStuff.valueForKey("levelA") as! NSString
            level = A.integerValue
        }
        
        
        if(level<6){
            randone = randomInt(0, max: 10)
            randtwo = level
            print(randone)
            print(randtwo)
        }
        else if(level==6){
            randone = randomInt(0, max: 10)
            randtwo = randomInt(1, max: 5)
        }
        else if(level<12){
            randone = randomInt(0, max: 10)
            randtwo = level - 1
        }
        else if(level==12){
            randone = randomInt(1, max: 10)
            randtwo = randomInt(6, max: 10)
        }
        else if(level==13){
            randone = randomInt(1, max: 10)
            randtwo = randomInt(1, max: 10)
        }
        else if(level<19){
            randone = randomInt(10, max: 99)
            randtwo = level - 3
        }
        else if(level==19){
            randone = randomInt(10, max: 99)
            randtwo = randomInt(1, max: 5)
        }
        else if(level<25){
            randone = randomInt(10, max: 90)
            randtwo = level - 4
        }
        else if(level==25){
            randone = randomInt(10, max: 99)
            randtwo = randomInt(6, max: 10)
        }
        else if(level==26){
            randone = randomInt(10, max: 99)
            randtwo = randomInt(1, max: 10)
        }
        
        secondNumber.text = "\(randtwo)"
        firstNumber.text = "\(randone)"
        operation.text = "+"
        operation.font = UIFont(name: operation.font.fontName, size: 90)
        
        
        
//                randone = Int(arc4random_uniform(10))
//                randtwo = Int(arc4random_uniform(10))
//                OP = Int(arc4random_uniform(2))
//                self.secondNumber.image = UIImage(named: self.numbers[randtwo])
//                self.firstNumber.image = UIImage(named: self.numbers[randone])
//                self.operation.image = UIImage(named: self.operations[OP])
        
        
    }
    @IBAction func removeKeyboard(sender: AnyObject) {
        answer.resignFirstResponder()
    }
    
    func txtClear() {
        answer.text! = ""
    }
    @IBAction func clearPressed(sender: AnyObject) {
        answerSoFar /= 10
        answer.text! = "\(answerSoFar)"
        if(answerSoFar==0){
            answer.text! = ""
        }
    }
    
    @IBAction func onePressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 1
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 1
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func twoPressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 2
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 2
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func threePressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 3
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 3
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func fourPressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 4
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 4
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func fivePressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 5
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 5
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func sixPressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 6
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 6
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func sevenPressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 7
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 7
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func eightPressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 8
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 8
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func ninePressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 9
        }
        else{
            var temp = 10 * Int(answer.text!)!
            answerSoFar = temp + 9
        }
        answer.text! = "\(answerSoFar)"
    }
    @IBAction func zeroPressed(sender: AnyObject) {
        if(Int(answer.text!)==nil){
            answerSoFar = 0
        }
        else{
            answerSoFar = 10 * Int(answer.text!)!
        }
        answer.text! = "\(answerSoFar)"
    }
    
    
    @IBAction func submitted(sender: AnyObject) {
        if (((timerCount > 0 && test) || (total<=PQuestions && practice)) && answer.text!.isEmpty != true) {
            
            AnswerG = randone + randtwo
            
            if(Int(answer.text!) != AnswerG){
                self.Solution.image = UIImage(named: self.result[1])
                Solution.hidden = false
                wrong++
                if(sound){
                    wrongSound!.stop()
                    wrongSound!.play()
                }
            }
            else{
                self.Solution.image = UIImage(named: self.result[0])
                Solution.hidden = false
                correct++
                score.text = "\(correct)"
                if(sound){
                    correctSound!.stop()
                    correctSound!.play()
                }
            }
            
            total++
            
            if(level<6){
                var randoneT = randomInt(0, max: 10)
                randtwo = level
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level==6){
                var randoneT = randomInt(0, max: 10)
                randtwo = randomInt(1, max: 5)
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level<12){
                var randoneT = randomInt(0, max: 10)
                randtwo = level - 1
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level==12){
                var randoneT = randomInt(1, max: 10)
                randtwo = randomInt(6, max: 10)
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level==13){
                var randoneT = randomInt(1, max: 10)
                randtwo = randomInt(1, max: 10)
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level<19){
                var randoneT = randomInt(10, max: 90)
                randtwo = level - 3
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level==19){
                var randoneT = randomInt(10, max: 99)
                randtwo = randomInt(1, max: 5)
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level<25){
                var randoneT = randomInt(10, max: 90)
                randtwo = level - 4
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level==25){
                var randoneT = randomInt(10, max: 99)
                randtwo = randomInt(6, max: 10)
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            else if(level==26){
                var randoneT = randomInt(10, max: 99)
                randtwo = randomInt(1, max: 10)
                if(randoneT==randone){
                    randone = randone++
                }
                else{
                    randone = randoneT
                }
            }
            
            self.secondNumber.text = "\(randtwo)"
            self.firstNumber.text = "\(randone)"
        }
        if(test && correct>=15 && timerCount<=0){
            level++
            pass = true
        }
        if(practice){
            if(total >= PQuestions){
                question.text = "\(PQuestions)" + "/" + "\(PQuestions)"
            }
            else{
                question.text = "\(total)" + "/" + "\(PQuestions)"
            }
        }
        if(test){
            question.text = "\(total)"
        }
        txtClear()
        
        if(correct>high){
            high = correct
            
        }
        if(total>PQuestions && practice){
            self.performSegueWithIdentifier("timesUpAdd", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(test){
            if let highCheck = defaults.valueForKey("highScoreAdd") as? String{
                if(high > Int(highCheck)){
                    defaults.setObject("\(high)", forKey: "highScoreAdd")
                    defaults.synchronize()
                }
            }
            else{
                defaults.setObject("\(high)", forKey: "highScoreAdd")
                defaults.synchronize()
            }
        }
        let myStringH = defaults.valueForKey("highScoreAdd") as? String
        let x : Int = total
        let myStringT = String(x)
        let y : Int = wrong
        let myStringW = String(y)
        let z : Int = correct
        let myStringC = String(z)
        
        if (segue.destinationViewController.isKindOfClass(OverAdd)) {
            if(pass){
                levelStuff.setObject("\(level)", forKey: "levelA")
                levelStuff.synchronize()
            }
            let DestViewController : OverAdd = segue.destinationViewController as! OverAdd
            if(test){
                DestViewController.HSText = myStringH!
            }
            DestViewController.totalText = myStringT
            DestViewController.wrongText = myStringW
            DestViewController.correctText = myStringC
            DestViewController.practice = practice
            DestViewController.test = test
            DestViewController.level = level
            DestViewController.PQuestions = PQuestions
            if(correct>=15){
                DestViewController.advance = true
            }
            DestViewController.sound = sound
        }
        else if (segue.destinationViewController.isKindOfClass(OptionsAdd)) {
            timer.invalidate()
            let DestViewController : OptionsAdd = segue.destinationViewController as! OptionsAdd
            
            DestViewController.TimerPlaceHolder = timerCount
            DestViewController.ScorePLaceHolder = correct
            DestViewController.WrongPlaceHolder = wrong
            DestViewController.TotalPlaceHolder = total
            DestViewController.HSPlaceHolder = high
            DestViewController.level = level
            DestViewController.PQuestions = PQuestions
            DestViewController.test = test
            DestViewController.practice = practice
            DestViewController.sound = sound
        }
    }
    
    func randomInt(min: Int, max:Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    @IBAction func textClicked(sender: AnyObject) {
        answer.resignFirstResponder()
    }
    
}