//
//  ViewController.swift
//  When To Wake Up
//
//  Created by José Albornoz on 16/06/14.
//  Copyright (c) 2014 José Albornoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var firstTime:  UILabel!
    @IBOutlet var secondTime: UILabel!
    @IBOutlet var thirdTime:  UILabel!
    @IBOutlet var fourthTime: UILabel!
    @IBOutlet var fifthTime:  UILabel!
    @IBOutlet var sixthTime:  UILabel!
    @IBOutlet var seventhTime:  UILabel!
    @IBOutlet var eightTime:  UILabel!
    @IBOutlet var fallAsleepSwitch: UISwitch!
    @IBOutlet var storyboardView: UIView!
    
    var sleepLabels = UILabel[]()
    var napLabels   = UILabel[]()
    let sleepCycle: Double = 5400
    let napTime: Double = 20 * 60
    let timeToFallAsleep: Double = 14 * 60

    let gray        = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    let lightGreen  = UIColor(red: 153.0/255.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    let darkGreen   = UIColor(red: 0.0/255.0,   green: 204.0/255.0, blue: 51.0/255.0,  alpha: 1.0)
    let orange      = UIColor(red: 254.0/255.0, green: 102.0/255.0, blue: 2.0/255.0,   alpha: 1.0)
    var sleepColours = UIColor[]()
    var napColours   = UIColor[]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        var labelFrame = CGRectMake(10.0, 10.0, 200.0, 25.0)
        var testLabel = UILabel()
        testLabel.drawTextInRect(labelFrame)
        testLabel.text = "hi world"
        testLabel.textColor = orange
        testLabel.font = UIFont.boldSystemFontOfSize(16)
        self.view = testLabel
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returning to view
    override func viewWillAppear(animated: Bool) {
        // this code is pretty horrible
        if sleepLabels.count == 0 {
            sleepLabels = [secondTime, thirdTime, fourthTime, fifthTime, sixthTime, seventhTime, eightTime]
        }
        if napLabels.count == 0 {
            napLabels = [firstTime]
        }

        // i have no freaking clue on how to do class variables in swift
        if sleepColours.count == 0 {
            sleepColours = [gray, gray, gray, lightGreen, darkGreen, darkGreen, darkGreen]
        }
        if napColours.count == 0 {
            napColours = [orange]
        }
        
        setTimes()
    }

    func setTimes() {
        var now = NSDate()
        var dateForSleep = now

        if fallAsleepSwitch.on == true {
            dateForSleep = dateForSleep.dateByAddingTimeInterval(timeToFallAsleep)
        }

        for (index, timeLabel) in enumerate(sleepLabels) {
            let extraTime: NSTimeInterval = sleepCycle * Double(index + 1)
            let sleepTime = dateForSleep.dateByAddingTimeInterval(extraTime)
            timeLabel.text = formatTime(sleepTime)
            timeLabel.textColor = sleepColours[index]
        }

        for (index, timeLabel) in enumerate(napLabels) {
            let extraTime: NSTimeInterval = napTime * Double(index + 1)
            let sleepTime = now.dateByAddingTimeInterval(extraTime)
            timeLabel.text = formatTime(sleepTime)
            timeLabel.textColor = napColours[index]
        }
    }

    func formatTime(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
//        formatter.timeStyle = .ShortStyle
        return formatter.stringFromDate(date)
    }

    @IBAction func refreshButton(sender: UIButton) {
        setTimes()
    }

}

