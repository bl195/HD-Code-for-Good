//
//  MapTableView.swift
//  HD Code for Good
//
//  Created by Brian Li on 8/29/19.
//  Copyright © 2019 Brian Li. All rights reserved.
//

import UIKit


class MapTableView: UITableView {

    let datas: [Message] =
        [Message(for: "Schiciano Atrium", "Check-In Begins", "8:00 AM"),
         Message(for: "Reynolds Theatre", "Opening Ceremonies", "10:00 AM"),
         Message(for: "Schiciano Atrium", "Lunch", "11:00 AM"),
         Message(for: "Schiciano Lobby", "Team Formation Mixer", "11:00 AM"),
         Message(for: "Harrington Quad", "Frisbee, Football, Volleyball", "12:00 PM"),
         Message(for:"Hudson 201","Intro to Hardware", "1:00 PM"),
         Message(for:"Hudson 232","VR Workshop", "2:00 PM"),
         Message(for:"Hudson 222","Health Track Kickoff", "3:00 PM"),
         Message(for:"Hudson 216","Javascript Workshop", "4:00 PM"),
         Message(for:"Harrington Quad","Puppies!!!!!", "4:00 PM"),
         Message(for:"Hudson 115A","API Workshop", "5:00 AM"),
         Message(for:"Hudson 216","Mobile Workshop", "5:00 PM"),
         Message(for:"Schiciano Atrium","Dinner", "6:00 PM"),
         Message(for:"Schiciano Lobby","MLH werewolf", "8:00 PM"),
         Message(for:"Innovation Co-Lab","Mixer for Female-Identifying", "9:00 PM"),
         Message(for:"Twinnie's Floor 2","Nerf War", "10:00 PM"),
         Message(for:"Schiciano Atrium","Spicy Noodle Challenge", "11:00 PM")]
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @objc func tapped(){
        print("tapped")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell") as! MapCell
        
        cell.eventLabel.text = datas[indexPath.row].summary
        cell.locationLabel.text = datas[indexPath.row].location
        cell.timeLabel.text = datas[indexPath.row].time
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text: String = datas[indexPath.row].location
        
    }


}
