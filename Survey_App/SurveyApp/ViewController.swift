//
//  ViewController.swift
//  SurveyApp
//
//  Created by For Programming on 31/01/2018.
//  Copyright © 2018 Ahmet Efeoglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - UIElements
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: - Other properties
    var pageIndex  = 1
    var currentViewController: UIViewController?
    var survey:Survey = Survey()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func nextTapped(_ sender: UIButton) {
        
        switch(pageIndex) {
        case 1:
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
            
            
            if let fromVC = currentViewController,  let toVC = nextViewController {
                
                (toVC as! SecondViewController).survey = survey
                switchChildViewControlllers(fromVC: fromVC, toVC: toVC)
                
                
                pageIndex += 1
                setNav()
            }
            break
            
        case 2:
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ThirdVC")
            if let fromVC = currentViewController,  let toVC = nextViewController {
                (toVC as! ThirdViewController).survey = survey
                switchChildViewControlllers(fromVC: fromVC, toVC: toVC)
                pageIndex += 1
                setNav()
            }
            break //transition to third vc
        case 3:
            let nextViewController = storyboard?.instantiateViewController(withIdentifier: "FourthVC")
            if let fromVC = currentViewController,  let toVC = nextViewController {
                (toVC as! FourthViewController).survey = survey
                switchChildViewControlllers(fromVC: fromVC, toVC: toVC)
                
                pageIndex += 1
                setNav()
            }
            
        default:
          return
        }
    }
    
    
    @IBAction func backTapped(_ sender: UIButton) {
        
        switch(pageIndex) {
        case 2:
            let previousViewController = storyboard?.instantiateViewController(withIdentifier: "FirstVC")
            if let fromVC = currentViewController, let toVC = previousViewController {
                // sending survey data back to FirstView Controller
                (toVC as! FirstViewViewController).survey = survey
                switchChildViewControlllers(fromVC: fromVC, toVC: toVC)
                pageIndex -= 1
                setNav()
            }
                
            
        case 3:
            let previousViewController = storyboard?.instantiateViewController(withIdentifier: "SecondVC")
            if let fromVC = currentViewController, let toVC = previousViewController {
                (toVC as!  SecondViewController).survey =  survey
                switchChildViewControlllers(fromVC: fromVC, toVC: toVC)
                pageIndex -= 1
                setNav()
            }
            
        
        default:
            return
        }
    }
    
    
    func setNav() {
        progressLabel.text = "Step \(pageIndex) of 3"
        switch(pageIndex) {
        case 1:
            backButton.alpha = 0
            nextButton.alpha = 1
            progressLabel.alpha = 1
            nextButton.setTitle("Next", for: .normal)
            
        case 2:
            backButton.alpha = 1
            nextButton.alpha = 1
            progressLabel.alpha = 1
            nextButton.setTitle("Next", for: .normal)
        case 3:
            backButton.alpha = 1
            nextButton.alpha = 1
            progressLabel.alpha  = 1
            nextButton.setTitle("Submit", for: .normal)
            
        case 4:
            backButton.alpha = 0
            nextButton.alpha = 0
            progressLabel.alpha = 0
            
        
        default:
            return
        }
    }
    
    func switchChildViewControlllers(fromVC: UIViewController,  toVC: UIViewController) {
        // Tell the current VC that it is transitioning
        fromVC.willMove(toParentViewController: nil)
        
        // add the new VC and its view
        self.addChildViewController(toVC)
        containerView.addSubview(toVC.view)
        
        //Size the frame of the toVC
        toVC.view.frame = fromVC.view.bounds
        
        //set the new vc alpha to zero
        toVC.view.alpha = 0
        
        //Animate the new VC alpha to 1, and the old VC alpha to 0
        
        UIView.animate(withDuration: 0.5, animations: {
            toVC.view.alpha = 1
            fromVC.view.alpha = 0
        }) { (Bool) in
            // remove the old VC view, then its VC
            fromVC.view.removeFromSuperview()
            fromVC.removeFromParentViewController()
            
            
            // Tell the new VC it has transitioned
            toVC.didMove(toParentViewController: self)
            self.currentViewController = toVC
            
        }
        
        
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        currentViewController = segue.destination
        (segue.destination as! FirstViewViewController).survey = survey
    }
    
}

