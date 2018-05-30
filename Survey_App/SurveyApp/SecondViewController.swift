//
//  SecondViewController.swift
//  SurveyApp
//
//  Created by For Programming on 31/01/2018.
//  Copyright © 2018 Ahmet Efeoglu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    //MARK: - UI ELements
    @IBOutlet weak var experienceStepper: UIStepper!

    @IBOutlet weak var locationPicker: UIPickerView!

    @IBOutlet weak var locationPickerHeight: NSLayoutConstraint!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    //Slider Properties
    @IBOutlet weak var decorSlider: UISlider!
    @IBOutlet weak var decorLabel: UILabel!
    @IBOutlet weak var serviceSlider: UISlider!
    
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var foodSlider: UISlider!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    //Other properties
    var  survey: Survey?
    
    let locations = ["Halifax", "Toronto", "Ontario", "Montreal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        locationPicker.dataSource = self
        locationPicker.delegate = self
        
        //change the corner of  stepper
        experienceStepper.layer.cornerRadius = 5.0
        
        //if survey is not nil, set the UI element values
        if let actualSurvey = survey {
            // set the pickerView
            //let index = locations.index(of: actualSurvey.location)
            
            //set the pickerView row
            //if let actualIndex = index {
             //    locationPicker.selectRow(actualIndex, inComponent: 0, animated: false)
            //}
            
            //set the  button text
            locationButton.setTitle(actualSurvey.location, for: .normal)
           
            // set the stepper
            experienceStepper.value = Double(actualSurvey.rating)
            ratingLabel.text = "Rating: " +  String(actualSurvey.rating)
            // set the  sliders
            let decorVal = Float(actualSurvey.decor)
            let serviceVal = Float(actualSurvey.service)
            let foodVal = Float(actualSurvey.food)
            decorSlider.setValue(decorVal, animated: true)
            decorLabel.text = "Rating: " + String(Int(decorVal))
            serviceSlider.setValue(serviceVal, animated: true)
            serviceLabel.text = "Rating: " + String(Int(serviceVal))
            foodSlider.setValue(foodVal, animated: true)
            foodLabel.text = "Rating: " + String(Int(foodVal))
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
   
    
    
    
    
    
    
    // MARK: Location PickerView Datasource Methods
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attrString = NSAttributedString(string: locations[row], attributes:[NSAttributedStringKey.foregroundColor: UIColor.white])
        return attrString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let title = locations[row]
        locationButton.setTitle(title, for: .normal)
        
        UIView.animate(withDuration: 0.25, animations: {
            self.locationPicker.alpha = 0
            self.view.layoutIfNeeded()
            })  { (completion) in
                UIView.animate(withDuration: 0.25, animations: {
                    self.locationPickerHeight.constant = 0
                    self.view.layoutIfNeeded()
                })
                
            
        }
            
    }
    
    // MARK: - Button  Functions
    
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.25, animations: {
            
            //Animate the height
            self.locationPickerHeight.constant = 216
            self.view.layoutIfNeeded()
            
        }) { (completed) in
            self.locationPicker.alpha = 1
            self.view.layoutIfNeeded()
            
        }
    }
    
    
    // MARK: -  Stepper  Methods
    @IBAction func stepperChanged(_ sender: UIStepper) {
        ratingLabel.text =  "Rating: " + String(Int(experienceStepper.value))
        survey?.rating = Int(sender.value)
    }
    
    //MARK: - Slider Method
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        // set the slider vlue to  a notch
        sender.value = Float(Int(sender.value))
        if  sender == decorSlider {
            survey?.decor = Int(sender.value)
            decorLabel.text = "Rating " + String(Int(sender.value))
        }
        
        else if sender == serviceSlider {
            survey?.service = Int(sender.value)
            serviceLabel.text = "Rating " + String(Int(sender.value))
        }
        
        else if sender == foodSlider {
            survey?.food = Int(sender.value)
            foodLabel.text = "Rating " + String(Int(sender.value))
        }
    }
    
    
}
