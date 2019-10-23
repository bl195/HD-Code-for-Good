import UIKit

class HelpViewController: UIViewController {

   

    @IBAction func policebutton(_ sender: UIButton) {
        guard let numberString = URL(string: "tel://" + "9196842444") else {
            return
        }
        print(numberString)
        UIApplication.shared.open(numberString)
        
    }
    
    
    @IBAction func samcell(_ sender: UIButton) {
        guard let numberString = URL(string: "tel://" + "4104282378") else {
            return
        }
        UIApplication.shared.open(numberString)
    }
    
    
    @IBAction func vickicell(_ sender: UIButton) {
        guard let numberString = URL(string: "tel://" + "9089388667") else {
            return
        }
        UIApplication.shared.open(numberString)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
