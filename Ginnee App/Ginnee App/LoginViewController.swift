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
        let Facebooktapped = UITapGestureRecognizer(target: self, action: #selector(self.openfaceBooklogin(_:)))
        faceBookLogin.addGestureRecognizer(Facebooktapped)
        
        phoneNumberLogin.isHidden = true
        emailLogin.isHidden = true
        
        let otherLogintapped = UITapGestureRecognizer(target: self, action: #selector(self.otherLoginClicked(_:)))
        otherLoginView.addGestureRecognizer(otherLogintapped)
        let phoneNumberLogintapped = UITapGestureRecognizer(target: self, action: #selector(self.phoneNumberLoginClicked(_:)))
        phoneNumberLogin.addGestureRecognizer(phoneNumberLogintapped)
        phoneNumberLogin.backgroundColor = .clear
        phoneNumberLogin.layer.cornerRadius = 17.5
        phoneNumberLogin.layer.borderWidth = 1
        phoneNumberLogin.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
        let emailLogintapped = UITapGestureRecognizer(target: self, action: #selector(self.emailLoginClicked(_:)))
        emailLogin.addGestureRecognizer(emailLogintapped)
        emailLogin.backgroundColor = .clear
        emailLogin.layer.cornerRadius = 17.5
        emailLogin.layer.borderWidth = 1
        emailLogin.layer.borderColor = UIColor(named: "boderColor")?.cgColor
    }
    func SetupfacebookLogin()
    {
//
//
//        let loginButton = FBLoginButton()
//        loginButton.frame = CGRect(x: 0, y: 0, width: faceBookLogin.frame.size.width, height: faceBookLogin.frame.size.height)
//        loginButton.layer.cornerRadius = 20;
//        faceBookLogin.addSubview(loginButton)
//
//
//        if let token = AccessToken.current,
//                !token.isExpired {
//            print("token 12 \(token)")
//                // User is logged in, do work such as go to next view controller.
//            }
    }
    func SetupNavigationViewController()
    {
        let myViewController: LoginViewController? = LoginViewController()
       let myNavigationController = UINavigationController(rootViewController: myViewController!)
    }
    
    @objc func openfaceBooklogin(_ sender: UITapGestureRecognizer? = nil) {
        print("openfaceBooklogin clicked! ")
        let loginManager = LoginManager()
                loginManager.logIn(permissions: ["public_profile"], from: self) { result, error in
                    if let error = error {
                        print("Encountered Erorr: \(error)")
                    } else if let result = result, result.isCancelled {
                        print("Cancelled")
                    } else {
                        print("Logged In")
                    }
                }
        
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
    @objc func emailLoginClicked(_ sender: UITapGestureRecognizer? = nil) {
        print("emailLoginClicked clicked! ")
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "emailLogin") as? EmailLoginViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @objc func phoneNumberLoginClicked(_ sender: UITapGestureRecognizer? = nil) {
        print("phoneNumberLoginClicked clicked!")
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "phoneNumberLogin") as? PhoneNumberViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
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
