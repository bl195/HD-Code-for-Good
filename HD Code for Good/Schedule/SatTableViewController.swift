import UIKit

class SatTableViewController: UITableViewController {
    
    let datas: [Message] = [Message(for: "Bryan Center", "Opening Ceremony"), Message(for: "Twinnie's", "Team Formation"), Message(for: "Fitzpatrick Lobby", "Lunch"), Message(for: "Fitzpatrick Lobby", "Dinner"), Message(for: "Hudson Hall", "Spicy Ramen Challenge")]
    
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
