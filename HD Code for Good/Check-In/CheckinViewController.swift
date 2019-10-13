//
//  CheckinViewController.swift
//  HD Code for Good
//
//  Created by Brian Li on 7/15/19.
//  Copyright © 2019 Brian Li. All rights reserved.
//

import UIKit
import FirebaseDatabase

var checkedin = false

class CheckinViewController: UIViewController {
    
    var firstref: DatabaseReference?
    var lastref: DatabaseReference?
    var pronounref: DatabaseReference?
    var schoolref: DatabaseReference?
    var classref: DatabaseReference?
    var categoryref: DatabaseReference?
    var emailref: DatabaseReference?
    
    
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
        
        firstref = Database.database().reference()
        lastref = Database.database().reference()
        pronounref = Database.database().reference()
        schoolref = Database.database().reference()
        classref = Database.database().reference()
        categoryref = Database.database().reference()
        emailref = Database.database().reference()
        
        super.viewDidLoad()
        subbut.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    @IBAction func addPost(_ sender: Any) {
        firstref?.child("First Name").childByAutoId().setValue(firstname.text)
        lastref?.child("Last Name").childByAutoId().setValue(lastname.text)
        pronounref?.child("Pronoun").childByAutoId().setValue(pronouns.text)
        classref?.child("Class").childByAutoId().setValue(year.text)
        categoryref?.child("Category").childByAutoId().setValue(category.text)
        emailref?.child("Email").childByAutoId().setValue(email.text)
        
        checkedin = true
        
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
