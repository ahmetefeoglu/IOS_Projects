//
//  FourthViewController.swift
//  SurveyApp
//
//  Created by For Programming on 03/02/2018.
//  Copyright © 2018 Ahmet Efeoglu. All rights reserved.
//

import UIKit
import FirebaseDatabase
class FourthViewController: UIViewController {
    var ref: DatabaseReference?
    var survey:Survey?
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        if let actualSurvey = survey {
            var d = [String: Any]()
            d["name"] = actualSurvey.name
            d["email"]  = actualSurvey.email
            d["contact"]  = actualSurvey.contact
            d["location"] = actualSurvey.location
            d["rating"] = actualSurvey.rating
            d["decor"] = actualSurvey.decor
            d["service"] = actualSurvey.service
            d["food"] = actualSurvey.food
            d["comments"] = actualSurvey.comments
            
            ref?.child("surveys").childByAutoId().setValue(d)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
