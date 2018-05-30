//
//  ThirdViewController.swift
//  SurveyApp
//
//  Created by For Programming on 03/02/2018.
//  Copyright © 2018 Ahmet Efeoglu. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var survey:Survey?
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        textView.layer.cornerRadius = 5.0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
    

    func textViewDidEndEditing(_ textView: UITextView) {
        textView.resignFirstResponder()
        
        if let actualText = textView.text {
            survey?.comments =  actualText
        }
        
    }

}
