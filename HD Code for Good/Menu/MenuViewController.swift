//
//  MenuViewController.swift
//  HD Code for Good
//
//  Created by Brian Li on 7/15/19.
//  Copyright © 2019 Brian Li. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var menubut: UIButton!
    
    let formatter = DateFormatter()
    let userCalendar = NSCalendar.current
    
    let requestcomponent: NSCalendar.Unit = [
        NSCalendar.Unit.month,
        NSCalendar.Unit.day,
        NSCalendar.Unit.hour,
        NSCalendar.Unit.minute,
        NSCalendar.Unit.second
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menubut.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    func printTime(){
        formatter.dateFormat = "MM/dd/yy hh:mm:ss a"
        let startTime = NSDate()
        let endTime = formatter.date(from: "10/13/19 09:00:00 a")
//        let timedifference = userCalendar.dateComponents(requestcomponent, from: startTime, to: endTime)
    }
   

}
