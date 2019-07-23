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

    let datas: [Message] = [Message(for:"Twinnie's","Midnight Snacks"), Message(for:"Hudson (222,224,232)","Nap Time"), Message(for:"Schiciano Atrium","Breakfast"), Message(for:"Hudson 216","The Future of Health"), Message(for:"Hudson 222","TUrning Hack into Startup"), Message(for:"Schiciano Atrium","Lunch"), Message(for:"All Participants","Hacking Ends"), Message(for:"Schiciano Lobby","Judging & Demos"), Message(for:"All Participants","HackDuke Ends"), Message(for:"Reynolds Theatre","Closing Ceremony"), Message(for:"Science Drive","VTech Bus Leaves")]
    
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
