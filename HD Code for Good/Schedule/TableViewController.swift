import UIKit

class Message{
    
    let summary: String
    let location: String
    let time: String
    
    init(for loc: String, _ summ: String, _ tim: String){
        self.summary = summ
        self.location = loc
        self.time = tim
    }
}

class TableViewController: UITableViewController {

    let datas: [Message] = [Message(for:"Twinnie's","Midnight Snacks", "12:00 AM"),
                            Message(for:"Hudson (222,224,232)","Nap Time", "12:00 AM"),
                            Message(for:"Schiciano Foyer","Breakfast", "9:00 AM"),
                            Message(for:"Hudson Hall","Workshop 4", "11:00 AM"),
                            Message(for:"Schiciano Foyer","Lunch", "12:00 PM"),
                            Message(for:"All Participants","Hacking Ends", "1:30 PM"),
                            Message(for:"CIEMAS Lobby","First-Round Judging", "2:00 PM"),
                            Message(for:"CIEMAS Lobby","Final Demos and Judging", "2:45 PM"),
                            Message(for:"Page Auditorium","Closing Ceremony", "4:30 PM"),
                            Message(for:"Science Drive","Buses Leave", "6:00 PM")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "back"), for: .normal)
        
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton = UIBarButtonItem(customView: button)
        
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    @objc func tapped(){
        print("tapped")
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
