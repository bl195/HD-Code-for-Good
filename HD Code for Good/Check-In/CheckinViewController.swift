//
//  CheckinViewController.swift
//  HD Code for Good
//
//  Created by Brian Li on 7/15/19.
//  Copyright © 2019 Brian Li. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CheckinViewController: UIViewController {
    
    var ref: DatabaseReference?
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var pronouns: UITextField!
    @IBOutlet weak var school: UITextField!
    @IBOutlet weak var category: UITextField!
    @IBOutlet weak var email: UITextField!
    
    
    @IBOutlet weak var subbut: UIButton!
    
    override func viewDidLoad() {
        
        ref = Database.database().reference()
        
        super.viewDidLoad()
        subbut.layer.cornerRadius = 20.0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPost(_ sender: Any) {
        ref?.child("Posts").childByAutoId().setValue(firstname.text)
        
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
