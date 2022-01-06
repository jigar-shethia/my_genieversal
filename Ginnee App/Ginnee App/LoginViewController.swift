//
//  LoginViewController.swift
//  Ginnee App
//
//  Created by Jigar shethia on 04/01/22.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController {
    
    @IBOutlet weak var faceBookLogin: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openfaceBooklogin(_:)))
        faceBookLogin.addGestureRecognizer(tap)
        faceBookLogin.layer.cornerRadius = 15;
        faceBookLogin.layer.masksToBounds = true;
        faceBookLogin = FBLoginButton()
        faceBookLogin.center = view.center
        view.addSubview(faceBookLogin)
        
        if let token = AccessToken.current,
                !token.isExpired {
                // User is logged in, do work such as go to next view controller.
            }
        
        // Do any additional setup after loading the view.
    }
    
  
    @objc func openfaceBooklogin(_ sender: UITapGestureRecognizer? = nil) {
        print("openfaceBooklogin clicked! ")
        
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
