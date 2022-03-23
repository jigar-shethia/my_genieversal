//
//  AboutMeViewController.swift
//  Ginnee App
//
//  Created by Admin on 18/02/22.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var genderView: UIView!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var orientationView: UIView!
    
    @IBOutlet weak var orientationLabel: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//        let otherLogintapped = UITapGestureRecognizer(target: self, action: #selector(self.otherLoginClicked(_:)))
//        otherLoginView.addGestureRecognizer(otherLogintapped)
//        let phoneNumberLogintapped = UITapGestureRecognizer(target: self, action: #selector(self.phoneNumberLoginClicked(_:)))
        
        
//        genderView.addGestureRecognizer(phoneNumberLogintapped)
        genderView.backgroundColor = .clear
        genderView.layer.cornerRadius = 17.5
        genderView.layer.borderWidth = 1
        genderView.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
//        orientationView.addGestureRecognizer(phoneNumberLogintapped)
        orientationView.backgroundColor = .clear
        orientationView.layer.cornerRadius = 17.5
        orientationView.layer.borderWidth = 1
        orientationView.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func proceedButtonPressed(_ sender: Any) {
        
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
