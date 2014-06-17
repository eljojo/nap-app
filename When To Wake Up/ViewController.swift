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
    
    var timeLabels = UILabel[]()
    let sleepCycle: Double = 5400
    let timeToFallAsleep: Double = 14 * 60


    let gray        = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    let lightGreen  = UIColor(red: 153.0/255.0, green: 204.0/255.0, blue: 102.0/255.0, alpha: 1.0)
    let darkGreen   = UIColor(red: 0.0/255.0,   green: 204.0/255.0, blue: 51.0/255.0,  alpha: 1.0)
    var colours     = UIColor[]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returning to view
    override func viewWillAppear(animated: Bool) {
        // this code is pretty horrible
        if timeLabels.count == 0 {
            timeLabels = [firstTime, secondTime, thirdTime, fourthTime, fifthTime, sixthTime, seventhTime, eightTime]
        }

        // i have no freaking clue on how to do class variables in swift
        if colours.count == 0 {
            colours = [gray, gray, gray, lightGreen, darkGreen, darkGreen, darkGreen, darkGreen]
        }
        
        setTimes()
    }

    func setTimes() {
        var date = NSDate()
        if fallAsleepSwitch.on == true {
            date = date.dateByAddingTimeInterval(timeToFallAsleep)
        }
        for (index, timeLabel) in enumerate(timeLabels) {
            var extraTime: NSTimeInterval = sleepCycle * Double(index + 1)
            var newDate = date.dateByAddingTimeInterval(extraTime)
            timeLabel.text = formatTime(newDate)
            timeLabel.textColor = colours[index]
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

