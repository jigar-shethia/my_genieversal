//
//  OTPViewController.swift
//  Ginnee App
//
//  Created by Jigar on 15/01/22.
//

import UIKit
import AEOTPTextField

class OTPViewController: UIViewController,AEOTPTextFieldDelegate {
    

    @IBOutlet weak var otpTextField: AEOTPTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        otpTextField.otpDelegate = self
        otpTextField.otpFilledBorderColor = UIColor(named: "AccentColor") ?? .darkGray
        otpTextField.configure()
        otpTextField.textContentType = .oneTimeCode
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func didUserFinishEnter(the code: String) {
        print(code)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
