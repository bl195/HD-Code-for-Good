
import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var menubut: UIButton!
    
    let futureDate: Date = {
        var future = DateComponents(
            year: 2019,
            month: 11,
            day: 2,
            hour: 11,
            minute: 0,
            second: 0
        )
       
        return Calendar.current.date(from: future)!
    }()
    
    var countdown: DateComponents {
        return Calendar.current.dateComponents([.day, .hour, .minute, .second], from: Date(), to: futureDate)
    }
    
    @objc func updateTime() {
        let countdown = self.countdown //only compute once per call
        let days = countdown.day!
        let hours = countdown.hour!
        let minutes = countdown.minute!
        let seconds = countdown.second!
        if(seconds > -1){
        dateLabel.text = String(format: "%02d Days  %02d Hours  %02d Min  %02d Sec", days, hours, minutes, seconds)
        }
        else{
            dateLabel.text = String("Code for Good has started!")
        }
    }

    
    @IBAction func checkin(_ sender: Any) {
        
        if let url = URL(string: "https://hackduke.typeform.com/to/vwGW81") {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
    
    
    
    @IBOutlet weak var checkedinlabel: UILabel!
    
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
        var bgcolor = hexStringToUIColor(hex: "#FFD38D")
        self.view.backgroundColor = bgcolor
        print(checkedin)
        if checkedin == true{
            menubut.isHidden = true
            checkedinlabel.isHidden = false
        }
        else{
            checkedinlabel.isHidden = true
            menubut.isHidden = false
        }
        super.viewDidLoad()
        menubut.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
}
