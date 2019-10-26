import UIKit

class SatTableViewController: UITableViewController {
    
    let datas: [Message] =
        [Message(for:"Schiciano Foyer","Check-In Begins","9:00 AM"),
         Message(for:"Page Auditorium","Opening Ceremonies","11:00 AM"),
         Message(for:"Schiciano Foyer","Track Talks","12:30 PM"),
         Message(for:"Schiciano Foyer","Lunch","1:00 PM"),
         Message(for:"Schiciano Foyer","Team Formation Mixer","2:00 PM"),
         Message(for:"Innovation Co-Lab","Database Workshop","2:00 PM"),
         Message(for:"Hudson 218","React Workshop","3:00 PM"),
         Message(for:"Harrington Quad","Puppies!!!!!","3:00 PM"),
         Message(for:"Harrington Quad","Spikeball & Frisbee","3:00 PM"),
         Message(for:"Hudson 218","AR/VR Workshop", "4:00 PM"),
         Message(for:"Innovation Co-Lab","Mixer for Female-Identifying", "6:00 PM"),
         Message(for:"Schiciano Atrium","Dinner", "6:30 PM"),
         Message(for:"CIEMAS 1st Floor","Pie an Organizer", "7:30 PM"),
         Message(for:"Location TBA","WIT Mixer", "9:00 PM"),
         Message(for:"Schiciano Foyer","MLH Minigame", "8:00 PM"),
         Message(for:"Twinnie's Floor 2","Nerf War", "10:00 PM"),
         Message(for:"Schiciano Foyer","Spicy Noodle Challenge", "11:00 PM")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let button = UIButton(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "back"), for: .normal)
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton = UIBarButtonItem(customView: button)
        
        self.navigationItem.leftBarButtonItem = barButton
        
        
    }
    
    @objc func tapped(){
        print("tapped")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageCell
        
        cell.summarylabel.text = datas[indexPath.row].summary
        cell.Locationlabel.text = datas[indexPath.row].location
        cell.timelabel.text = datas[indexPath.row].time
        
        return cell
    }
    
}
