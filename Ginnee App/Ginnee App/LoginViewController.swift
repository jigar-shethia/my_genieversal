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
    @IBOutlet weak var emailLogin: UIView!
    @IBOutlet weak var phoneNumberLogin: UIView!
    @IBOutlet weak var otherLoginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        SetupfacebookLogin()
      
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupLayout()
    }
    func setupLayout()
    {
        phoneNumberLogin.isHidden = true
        emailLogin.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.otherLoginClicked(_:)))
        otherLoginView.addGestureRecognizer(tap)
        phoneNumberLogin.backgroundColor = .clear
        phoneNumberLogin.layer.cornerRadius = 17.5
        phoneNumberLogin.layer.borderWidth = 1
        phoneNumberLogin.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
        emailLogin.backgroundColor = .clear
        emailLogin.layer.cornerRadius = 17.5
        emailLogin.layer.borderWidth = 1
        emailLogin.layer.borderColor = UIColor(named: "boderColor")?.cgColor
    }
    func SetupfacebookLogin()
    {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openfaceBooklogin(_:)))
//        faceBookLogin.addGestureRecognizer(tap)
//        faceBookLogin.layer.cornerRadius = 15;
//        faceBookLogin.layer.masksToBounds = true;
//        faceBookLogin = FBLoginButton()
//        faceBookLogin.center = view.center
//        view.addSubview(faceBookLogin)
//
//        setupLayout()
//        if let token = AccessToken.current,
//                !token.isExpired {
//                // User is logged in, do work such as go to next view controller.
//            }
    }
    @objc func openfaceBooklogin(_ sender: UITapGestureRecognizer? = nil) {
        print("openfaceBooklogin clicked! ")
        
    }
    @objc func otherLoginClicked(_ sender: UITapGestureRecognizer? = nil) {
        print("otherLoginClicked clicked! ")
        if(phoneNumberLogin.isHidden == true)
        {
            phoneNumberLogin.isHidden = false
            emailLogin.isHidden = false
        }else
        {
            phoneNumberLogin.isHidden = true
            emailLogin.isHidden = true
        }
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
