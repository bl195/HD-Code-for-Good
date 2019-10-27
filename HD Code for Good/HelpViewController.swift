import UIKit

class HelpViewController: UIViewController {

   

    @IBAction func policebutton(_ sender: UIButton) {
        guard let numberString = URL(string: "tel://" + "9196842444") else {
            return
        }
        print(numberString)
        UIApplication.shared.open(numberString)
        
    }
    
    
    @IBAction func slack(_ sender: Any) {
        if let url = URL(string: "https://tinyurl.com/JoinHDSlack") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    
    @IBAction func devpost(_ sender: Any) {
        if let url = URL(string: "https://hackduke-2019.devpost.com/") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
        
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
    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        var bgcolor = hexStringToUIColor(hex: "#2B9B99")
        self.view.backgroundColor = bgcolor
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
