import UIKit

class Message{
    
    let summary: String
    let location: String
    
    init(for loc: String, _ summ: String){
        self.summary = summ
        self.location = loc
    }
}

class TableViewController: UITableViewController {

    let datas: [Message] = [Message(for:"Twinnie's","Midnight Snacks"), Message(for:"Hudson (222,224,232)","Nap Time"), Message(for:"Schiciano Atrium","Breakfast"), Message(for:"Hudson 216","The Future of Health"), Message(for:"Hudson 222","Turning Hack into Startup"), Message(for:"Schiciano Atrium","Lunch"), Message(for:"All Participants","Hacking Ends"), Message(for:"Schiciano Lobby","Judging & Demos"), Message(for:"All Participants","HackDuke Ends"), Message(for:"Reynolds Theatre","Closing Ceremony"), Message(for:"Science Drive","VTech Bus Leaves")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sunday, Day 2"
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
