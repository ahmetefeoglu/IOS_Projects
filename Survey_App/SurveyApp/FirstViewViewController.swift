//
//  FirstViewViewController.swift
//  SurveyApp
//
//  Created by For Programming on 31/01/2018.
//  Copyright © 2018 Ahmet Efeoglu. All rights reserved.
//

import UIKit

class FirstViewViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contactSwitch: UISwitch!
    var survey:Survey?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        
        //if survey is not nil, set the  survey  UI's
        if let actualSurvey = survey {
            //set the name field
            nameTextField.text = actualSurvey.name
            
            //set the email
            emailTextField.text = actualSurvey.email
            
            //set the contact switch
            contactSwitch.isOn = actualSurvey.contact
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // Set the survey properties for textfield
        if let  actualText = textField.text {
            if textField == nameTextField {
                survey?.name = actualText
            }
            
            else if textField == emailTextField {
                survey?.email = actualText
            }
            
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        return true
    }
    

    // MARK: - Switch Methods
    
    @IBAction func switchChanged(_ sender: Any) {
        let switchToggle = sender as! UISwitch
        survey?.contact = switchToggle.isOn
    }
    
}
