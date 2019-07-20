import UIKit

class SatTableViewController: UITableViewController {
    
    let datas: [Message] = [Message(for: "Schiciano Atrium", "Check-In"), Message(for: "Reynolds Theatre", "Opening Ceremony"), Message(for: "Schiciano Atrium", "Lunch"), Message(for: "Schiciano Lobby", "Team Formation Mixer"), Message(for: "Harrington Quad", "Frisbee, Football, Volleyball"), Message(for:"Hudson 201","Intro to Hardware"), Message(for:"Hudson 232","VR Workshop"), Message(for:"Hudson 222","Health Track Kickoff"), Message(for:"Hudson 216","Javascript Workshop"), Message(for:"Harrington Quad","Puppies!!!!!"), Message(for:"Hudson 115A","API Workshop"), Message(for:"Hudson 216","Mobile Workshop"), Message(for:"Schiciano Atrium","Dinner"), Message(for:"Schiciano Lobby","MLH werewolf"), Message(for:"Innovation Co-Lab","Mixer for Female-Identifying"), Message(for:"Twinnie's Floor 2","Nerf War"), Message(for:"Schiciano Atrium","Spicy Noodle Challenge")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        return cell
    }

}
