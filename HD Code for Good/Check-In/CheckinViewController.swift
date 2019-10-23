import UIKit
import FirebaseDatabase

var checkedin = false

class CheckinViewController: UIViewController {
    
    var userref: DatabaseReference?
 
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var pronouns: UITextField!
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var subbut: UIButton!
    
    override func viewDidLoad() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        firstname.inputAccessoryView = toolbar
        lastname.inputAccessoryView = toolbar
        pronouns.inputAccessoryView = toolbar
        school.inputAccessoryView = toolbar
        year.inputAccessoryView = toolbar
        category.inputAccessoryView = toolbar
        email.inputAccessoryView = toolbar
        
        userref = Database.database().reference()
        
        super.viewDidLoad()
        subbut.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    @IBAction func addPost(_ sender: Any) {
        userref?.child("Users").childByAutoId().setValue(firstname.text)
        userref?.child("Users").childByAutoId().setValue(lastname.text)
        userref?.child("Users").childByAutoId().setValue(pronouns.text)
        userref?.child("Users").childByAutoId().setValue(year.text)
        userref?.child("Users").childByAutoId().setValue(category.text)
        userref?.child("Users").childByAutoId().setValue(email.text)
        
        checkedin = true
        
    }
    

}
