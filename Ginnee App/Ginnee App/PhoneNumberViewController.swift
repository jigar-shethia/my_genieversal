  //
//  PhoneNumberViewController.swift
//  Ginnee App
//
//  Created by Jigar shethia on 11/01/22.
//

import UIKit
import NKVPhonePicker
class PhoneNumberViewController: UIViewController {
   
    @IBOutlet weak var phoneNumberTextView: NKVPhonePickerTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        phoneNumberTextView.phonePickerDelegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func proceedClicked(_ sender: UIButton) {
        
        // Do valiadation
        
        // Send to OTP scree.
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
