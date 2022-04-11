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
    
    @IBOutlet weak var orientationLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let gendertapped = UITapGestureRecognizer(target: self, action: #selector(self.genderViewClicked(_:)))
        genderView.addGestureRecognizer(gendertapped)
        let orientationtapped = UITapGestureRecognizer(target: self, action: #selector(self.orientationViewClicked(_:)))
        orientationView.addGestureRecognizer(orientationtapped)
        
        
//        genderView.addGestureRecognizer(phoneNumberLogintapped)
        genderView.backgroundColor = .clear
        genderView.layer.cornerRadius = 22.5
        genderView.layer.borderWidth = 1
        genderView.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
//        orientationView.addGestureRecognizer(phoneNumberLogintapped)
        orientationView.backgroundColor = .clear
        orientationView.layer.cornerRadius = 22.5
        orientationView.layer.borderWidth = 1
        orientationView.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func proceedButtonPressed(_ sender: Any) {
        
    }
    @objc func genderViewClicked(_ sender: UITapGestureRecognizer? = nil) {
        print("genderViewClicked clicked!")
        
        let alert = UIAlertController(title: "My Gender is", message:nil , preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Female", style: .default , handler:{ (UIAlertAction)in
                
                self.genderLabel.text = "Female"
            }))

            alert.addAction(UIAlertAction(title: "Male", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Male"
            }))
            alert.addAction(UIAlertAction(title: "Gender Fluid", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Gender Fluid"
            }))
            alert.addAction(UIAlertAction(title: "Trans Female", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Trans Female"
            }))
            alert.addAction(UIAlertAction(title: "Trans Male", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Trans Male"
            }))
            alert.addAction(UIAlertAction(title: "Transgender", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Transgender"
            }))
            alert.addAction(UIAlertAction(title: "Transgender Man", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Transgender Man"
            }))
            alert.addAction(UIAlertAction(title: "Transgender Woman", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Transgender Woman"
            }))
            alert.addAction(UIAlertAction(title: "Transsexual Person", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Transsexual Person"
            }))
            alert.addAction(UIAlertAction(title: "Two-Spirit", style: .default , handler:{ (UIAlertAction)in
                self.genderLabel.text = "Two-Spirit"
            }))

            
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))

            
            //uncomment for iPad Support
            //alert.popoverPresentationController?.sourceView = self.view

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        
    }
    @objc func orientationViewClicked(_ sender: UITapGestureRecognizer? = nil) {
        print("orientationViewClicked clicked!")
        
        let alert = UIAlertController(title: "You can select multiple enteries", message:nil , preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Straight", style: .default , handler:{ (UIAlertAction)in
                
                self.orientationLabel.text = "Straight"
            }))

            alert.addAction(UIAlertAction(title: "Lesbian", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Lesbian"
            }))
            alert.addAction(UIAlertAction(title: "Asexual", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Asexual"
            }))
            alert.addAction(UIAlertAction(title: "Aromantic", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Aromantic"
            }))
            alert.addAction(UIAlertAction(title: "Bicurious", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Bicurious"
            }))
            alert.addAction(UIAlertAction(title: "Bisexual", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Bisexual"
            }))
            alert.addAction(UIAlertAction(title: "Coming out", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Coming out"
            }))
            alert.addAction(UIAlertAction(title: "Demisexual", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Transgender Woman"
            }))
            alert.addAction(UIAlertAction(title: "Fluid", style: .default , handler:{ (UIAlertAction)in
                self.orientationLabel.text = "Fluid"
            }))
          

            
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))

            
            //uncomment for iPad Support
            //alert.popoverPresentationController?.sourceView = self.view

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
        
        
    }
    
    @IBAction func proceedClicked(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "QnAViewController") as? QnAViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    

}
