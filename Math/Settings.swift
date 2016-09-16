//
//  Settings.swift
//  Math
//
//  Created by Anirudh on 5/23/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class Settings : UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var Two: UIButton!
    @IBOutlet weak var Three: UIButton!
    @IBOutlet weak var Four: UIButton!
    @IBOutlet weak var soundSwitch: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var PQuestions = 0
    var sound = true
    var morning = false
    
    let AlarmSystem: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(PQuestions==0 || PQuestions==20){
            Two.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            Three.titleLabel?.textColor  = UIColor.blueColor()
            Four.titleLabel?.textColor  = UIColor.blueColor()
            PQuestions = 20
        }
        else if(PQuestions==30){
            Two.titleLabel?.textColor  = UIColor.blueColor()
            Three.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            Four.titleLabel?.textColor  = UIColor.blueColor()
            PQuestions = 30
        }
        else if(PQuestions==40){
            Two.titleLabel?.textColor  = UIColor.blueColor()
            Three.titleLabel?.textColor  = UIColor.blueColor()
            Four.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            PQuestions = 40
        }
        if(!sound){
            soundSwitch.setOn(false, animated: true)
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let date = AlarmSystem.valueForKey("Date") as? NSDate{
            datePicker.date = date
        }
    }
    
    func SetNotifications(){
        
        if let checker = AlarmSystem.valueForKey("firstTime") as? String{
            cancelLocalNotificationsWithUUID(712)
        }
        else{
            AlarmSystem.setObject("1", forKey: "firstTime")
            AlarmSystem.synchronize()
        }
        
        let fireDateOfNotification: NSDate = datePicker.date
        
        let notification = UILocalNotification()
        notification.timeZone = NSTimeZone.localTimeZone()
        notification.alertBody = "Time to do some Math!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.fireDate = fireDateOfNotification
        notification.repeatInterval = NSCalendarUnit.Day
        notification.userInfo = ["UUID": 712]
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func cancelLocalNotificationsWithUUID(uuid: Int) {
        for item in UIApplication.sharedApplication().scheduledLocalNotifications! {
            let notification = item as UILocalNotification
            if let notificationUUID = notification.userInfo?["UUID"] as? Int {
                
                if notificationUUID == uuid {
                    UIApplication.sharedApplication().cancelLocalNotification(notification)
                }
            }
        }
    }
    
    @IBAction func twenty(sender: AnyObject) {
        Two.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        Three.titleLabel?.textColor  = UIColor.blueColor()
        Four.titleLabel?.textColor  = UIColor.blueColor()
        PQuestions = 20
    }
    @IBAction func thirty(sender: AnyObject) {
        Two.titleLabel?.textColor  = UIColor.blueColor()
        Three.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        Four.titleLabel?.textColor  = UIColor.blueColor()
        PQuestions = 30
    }
    @IBAction func fourty(sender: AnyObject) {
        Two.titleLabel?.textColor  = UIColor.blueColor()
        Three.titleLabel?.textColor  = UIColor.blueColor()
        Four.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        PQuestions = 40
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DestViewController:MainMenu = segue.destinationViewController as! MainMenu
        
        DestViewController.PQuestions = PQuestions
        DestViewController.sound = soundSwitch.on
        SetNotifications()
        AlarmSystem.setObject(datePicker.date, forKey: "Date")
        AlarmSystem.synchronize()
    }
    
}







