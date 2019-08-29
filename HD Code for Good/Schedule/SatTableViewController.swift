import UIKit

class SatTableViewController: UITableViewController {
    
    let datas: [Message] = [Message(for: "Schiciano Atrium", "Check-In"), Message(for: "Reynolds Theatre", "Opening Ceremony"), Message(for: "Schiciano Atrium", "Lunch"), Message(for: "Schiciano Lobby", "Team Formation Mixer"), Message(for: "Harrington Quad", "Frisbee, Football, Volleyball"), Message(for:"Hudson 201","Intro to Hardware"), Message(for:"Hudson 232","VR Workshop"), Message(for:"Hudson 222","Health Track Kickoff"), Message(for:"Hudson 216","Javascript Workshop"), Message(for:"Harrington Quad","Puppies!!!!!"), Message(for:"Hudson 115A","API Workshop"), Message(for:"Hudson 216","Mobile Workshop"), Message(for:"Schiciano Atrium","Dinner"), Message(for:"Schiciano Lobby","MLH werewolf"), Message(for:"Innovation Co-Lab","Mixer for Female-Identifying"), Message(for:"Twinnie's Floor 2","Nerf War"), Message(for:"Schiciano Atrium","Spicy Noodle Challenge")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.title = "Saturday, Day 1"
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
        self.navigationController?.popToViewController(vc!, animated: true)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let important = importantAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [important])
    }
    
    func importantAction(at indexPath: IndexPath) -> UIContextualAction{
        let data = datas[indexPath.row]
        let action = UIContextualAction(style: .normal, title: "Important"){ (action, view, completion) in
//            data.isImportant = !data.isImportant
            completion(true)
        }
        action.image = UIImage(contentsOfFile: "icons8-alarm-50")
        action.backgroundColor = .blue
        return action
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
