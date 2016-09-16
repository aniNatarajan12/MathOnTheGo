//
//  Help.swift
//  Math
//
//  Created by Anirudh on 5/26/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class Help : UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var helpLabel: UILabel!
    
    @IBOutlet weak var page1: UIImageView!
    @IBOutlet weak var page2: UIImageView!
    @IBOutlet weak var page3: UIImageView!
    
    var sound = true
    var PQuestions = 0
    var page = 1
    
    override func viewDidLoad() {
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "swipedLeft:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "swipedRight:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        mainImage.image = UIImage(named: "help1")
        page1.image = UIImage(named: "Page")
        page2.image = UIImage(named: "notPage")
        page3.image = UIImage(named: "notPage")
        helpLabel.hidden = false
        
        //self.view.bringSubviewToFront(closeView)
    }
    
    func swipedLeft(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            page++
            
            if(page>=3){
                page = 3
            }
            
            if(page==1){
                mainImage.image = UIImage(named: "help1")
                page1.image = UIImage(named: "Page")
                page2.image = UIImage(named: "notPage")
                page3.image = UIImage(named: "notPage")
                helpLabel.hidden = false
            }
            else if(page==2){
                mainImage.image = UIImage(named: "help2")
                page1.image = UIImage(named: "notPage")
                page2.image = UIImage(named: "Page")
                page3.image = UIImage(named: "notPage")
                helpLabel.hidden = true
            }
            else if(page==3){
                mainImage.image = UIImage(named: "help3")
                page1.image = UIImage(named: "notPage")
                page2.image = UIImage(named: "notPage")
                page3.image = UIImage(named: "Page")
                helpLabel.hidden = true
            }
        }
        //self.view.bringSubviewToFront(closeView)
    }
    
    func swipedRight(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            page--
            
            if(page<=1){
                page = 1
            }
            
            if(page==1){
                mainImage.image = UIImage(named: "help1")
                page1.image = UIImage(named: "Page")
                page2.image = UIImage(named: "notPage")
                page3.image = UIImage(named: "notPage")
                helpLabel.hidden = false
            }
            else if(page==2){
                mainImage.image = UIImage(named: "help2")
                page1.image = UIImage(named: "notPage")
                page2.image = UIImage(named: "Page")
                page3.image = UIImage(named: "notPage")
                helpLabel.hidden = true
            }
            else if(page==3){
                mainImage.image = UIImage(named: "help3")
                page1.image = UIImage(named: "notPage")
                page2.image = UIImage(named: "notPage")
                page3.image = UIImage(named: "Page")
                helpLabel.hidden = true
            }
        }
        //self.view.bringSubviewToFront(closeView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController : MainMenu = segue.destinationViewController as! MainMenu
        
        DestViewController.sound = sound
        DestViewController.PQuestions = PQuestions
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
}