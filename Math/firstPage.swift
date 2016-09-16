//
//  firstPage.swift
//  Math
//
//  Created by Anirudh on 6/7/15.
//  Copyright (c) 2015 PhoenixFire. All rights reserved.
//

import Foundation
import UIKit

class firstPage : UIViewController{
    
    @IBOutlet weak var byMe: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var settings: UIButton!
    @IBOutlet weak var notificationsImage: UIImageView!
    
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    let AlarmSystem: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLayoutSubviews() {
        byMe.center = CGPointMake(byMe.center.x, byMe.center.y+1000)
        mainView.alpha = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let wratio: CGFloat = 375/252
        let hratio: CGFloat = 667/68
        let swidth = wratio * screenWidth
        let sheight = hratio * screenHeight
        
        settings.frame = CGRectMake((screenWidth/2)-(swidth/2), (screenHeight-14)-(sheight/2), swidth, sheight)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.byMe.center = CGPointMake(self.byMe.center.x, self.byMe.center.y-1000)
        })
        
        NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("animationTwo"), userInfo: nil, repeats: false)
        
        if(defaults.valueForKey("notifications") as? String == "true"){
            notificationsImage.hidden = false
        }
    }
    
    func animationTwo(){
        UIView.animateWithDuration(2, animations: { () -> Void in
            self.mainView.alpha = 1
        })
    }
    
    override func viewDidLoad() {
        notificationsImage.hidden = true
        if let checker = AlarmSystem.valueForKey("firstTime") as? String{
            
        }
        else{
            SetNotifications()
        }
    }
    
    func SetNotifications(){

        AlarmSystem.setObject("1", forKey: "firstTime")
        AlarmSystem.synchronize()
        
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        
        let date: NSDate = NSDate()
        let cal: NSCalendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)!
        let newDate: NSDate = cal.dateBySettingHour(17, minute: 0, second: 0, ofDate: date, options: NSCalendarOptions())!
        AlarmSystem.setObject(newDate, forKey: "Date")
        AlarmSystem.synchronize()
        
        let fireDateOfNotification: NSDate = newDate
        
        let notification = UILocalNotification()
        notification.timeZone = NSTimeZone.localTimeZone()
        notification.alertBody = "Time to do some Math!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.fireDate = fireDateOfNotification
        notification.repeatInterval = NSCalendarUnit.Day
        notification.userInfo = ["UUID": 712]
        
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
        
    func drawAShape(notification:NSNotification){
        let view:UIView = UIView(frame:CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(view)
        
    }
    
    func showAMessage(notification:NSNotification){
        let message:UIAlertController = UIAlertController(title: "A Notification Message", message: "Time to do some Math!", preferredStyle: UIAlertControllerStyle.Alert)
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.destinationViewController.isKindOfClass(ChosenAdd)){
            let DestViewController : ChosenAdd = segue.destinationViewController as! ChosenAdd
        }
        else if(segue.destinationViewController.isKindOfClass(ChosenSubtract)){
            let DestViewController : ChosenSubtract = segue.destinationViewController as! ChosenSubtract
        }
        else if(segue.destinationViewController.isKindOfClass(ChosenMultiply)){
            let DestViewController : ChosenMultiply = segue.destinationViewController as! ChosenMultiply
        }
        else if(segue.destinationViewController.isKindOfClass(Settings)){
            let DestViewController : Settings = segue.destinationViewController as! Settings
        }
        else if(segue.destinationViewController.isKindOfClass(Help)){
            let DestViewController : Help = segue.destinationViewController as! Help
        }
        else if(segue.destinationViewController.isKindOfClass(Achievments)){
            let DestViewController : Achievments = segue.destinationViewController as! Achievments
        }
    }

}
    
