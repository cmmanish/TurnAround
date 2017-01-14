
//
//  ViewController.swift
//  TimerInSwift
//
//  Created by Raul Pop on 5/23/15.
//  Copyright (c) 2015 Raul Pop. All rights reserved.
//

import UIKit

public class ViewController: UIViewController {
    
    @IBOutlet weak var timeCounterLabel: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    public var count = 300
    var timer = Timer()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        displayTimeCounter()
        
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func displayTimeCounter() {
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        timeCounterLabel.text = formatter.string(from: date as Date)
    
    }
    
    @IBAction func start(_ sender: UIButton) {
        timer.invalidate() // just in case this button is tapped multiple times
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        count = 300
        let minutes = String(count / 60)
        let seconds = String(count % 60)
        countDownLabel.text = minutes + ":" + seconds
    }
    
    // called every time interval from the timer
    public func timerAction() {
        if (count > 0){
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            countDownLabel.text = minutes + ":" + seconds
        }
        count = count - 1
    }
}

