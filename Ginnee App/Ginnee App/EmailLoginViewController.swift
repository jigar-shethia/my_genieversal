//
//  EmailLoginViewController.swift
//  Ginnee App
//
//  Created by Jigar on 15/01/22.
//

import UIKit

class EmailLoginViewController: UIViewController {
    @IBOutlet weak var emailTextFiield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorShowCase: UILabel!
    @IBOutlet weak var errorImage: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.maxLength = 20
        print("LoginViewController 111")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func proceedClicked(_ sender: UIButton) {
        
        if(emailTextFiield.text != "" && passwordTextField.text != "")
        {
            if(isValidEmail(emailTextFiield.text ?? ""))
            {
                print("email2323")
                let apiconnection = ApiConnection()
                apiconnection.loginWithEmail(Email: emailTextFiield.text ?? "", Password: passwordTextField.text ?? "") { data, error in
                    
                    if let safeData=data
                    {

                        let dataString = String(data: safeData, encoding: .utf8)
                        print("loginWithEmail 2323 \(dataString!)")
                        if dataString!.contains("Login success") {
                            DispatchQueue.main.async{
                            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "uploadImageViewController") as? UploadImageViewController
                            self.navigationController?.pushViewController(vc!, animated: true)
                            }
//
//                                self.errorShowCase.isHidden = false
//                                self.errorImage.isHidden = false
//                                self.errorShowCase.text = "Login Success"
//                            }
                        }else{
                            
                            DispatchQueue.main.async{
                                self.errorShowCase.isHidden = false
                                self.errorImage.isHidden = false
                                self.errorShowCase.text = "Invail Credentails"
                            }
                            
                        }
                        
                        
                    }
                }
            }
            else
            {
                DispatchQueue.main.async{
                    self.errorShowCase.isHidden = false
                    self.errorImage.isHidden = false
                    self.errorShowCase.text = "Invalid Email format!"
                }
            }
            
        }
        else{
            DispatchQueue.main.async{
                self.errorShowCase.isHidden = false
                self.errorImage.isHidden = false
                self.errorShowCase.text = "Username or Password cannot be empty"
            }
        }
        
        
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
