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
    let timeToFallAsleep: Double = 15 * 60
    
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
        if timeLabels.count == 0 {
            timeLabels = [firstTime, secondTime, thirdTime, fourthTime, fifthTime, sixthTime, seventhTime, eightTime]
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

