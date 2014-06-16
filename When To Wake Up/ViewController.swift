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
    
    var times = UILabel[]()
    let sleepCycle = 5400
    
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
        if times.count == 0 {
            times.append(firstTime)
            times.append(secondTime)
            times.append(thirdTime)
            times.append(fourthTime)
            times.append(fifthTime)
            times.append(sixthTime)
        }
        
        setTimes()
    }

    func setTimes() {
        let date = NSDate().dateByAddingTimeInterval(15 * 60).dateByAddingTimeInterval(5400)
        for i in 0..6 {
            var timeLabel = times[i]
            var extraTime: NSTimeInterval = 5400 * Double(i + 1)
            var newDate = date.dateByAddingTimeInterval(extraTime)
            timeLabel.text = formatTime(newDate)
        }
    }
    
    func formatTime(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:MM"
//        formatter.timeStyle = .ShortStyle
        return formatter.stringFromDate(date)
    }

}

