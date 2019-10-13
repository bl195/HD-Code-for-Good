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
    
    
    
    let futureDate: Date = {
        var future = DateComponents(
            year: 2019,
            month: 11,
            day: 2,
            hour: 0,
            minute: 0,
            second: 0
        )
       
        return Calendar.current.date(from: future)!
    }()
    
    
    var countdown: DateComponents {
        return Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate)
    }
    
    
    @objc func updateTime() {
        let countdown = self.countdown //only compute once per call
        let days = countdown.day!
        let hours = countdown.hour!
        let minutes = countdown.minute!
        let seconds = countdown.second!
        dateLabel.text = String(format: "%02d Days  %02d Hours  %02d Min  %02d Sec", days, hours, minutes, seconds)
    }
    

    @IBOutlet weak var checkedinlabel: UILabel!
    
    override func viewDidLoad() {
        print(checkedin)
        if checkedin == true{
            menubut.isHidden = true
            checkedinlabel.isHidden = false
        }
        else{
            checkedinlabel.isHidden = true
            menubut.isHidden = false
        }
        super.viewDidLoad()
        menubut.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
}
