//
//  LoginViewController.swift
//  Ginnee App
//
//  Created by Jigar shethia on 04/01/22.
//

import UIKit
import FacebookLogin
import GoogleSignIn
import AuthenticationServices
import CryptoKit

class LoginViewController: UIViewController {
   
    
let signInConfig = GIDConfiguration.init(clientID: "176288681458-g7cslcneetbc8jge159cvau9v7ot682b.apps.googleusercontent.com")
    
    @IBOutlet weak var faceBookLogin: UIView!
    @IBOutlet weak var emailLogin: UIView!
    @IBOutlet weak var phoneNumberLogin: UIView!
    @IBOutlet weak var otherLoginView: UIView!
    
    @IBOutlet weak var appleLogin: UIView!
    @IBOutlet weak var googleLogin: UIView!
    fileprivate var currentNonce: String?
    @IBAction func GoogleLogin(_ sender: Any) {
        
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil else { return }
            print("Access token \(String(describing: user?.authentication.accessToken))")
            // If sign in succeeded, display the app's main content View.
          }
        
        
    }
    
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
        
        let Googletapped = UITapGestureRecognizer(target: self, action: #selector(self.googlelogin(_:)))
        googleLogin.addGestureRecognizer(Googletapped)
        let Appletapped = UITapGestureRecognizer(target: self, action: #selector(self.applelogin(_:)))
        appleLogin.addGestureRecognizer(Appletapped)
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
//        print("openfaceBooklogin clicked! ")
//        let loginManager = LoginManager()
//                loginManager.logIn(permissions: ["public_profile"], from: self) { result, error in
//                    if let error = error {
//                        print("Encountered Erorr: \(error)")
//                    } else if let result = result, result.isCancelled {
//                        print("Cancelled")
//                    } else {
//                        print("Logged In")
//                    }
//                }
        
    }
    @objc func applelogin(_ sender: UITapGestureRecognizer? = nil) {
    print("Apple login tapped")
    startSignInWithAppleFlow()
        
    }
    
    @objc func googlelogin(_ sender: UITapGestureRecognizer? = nil) {
        print("googlelogin clicked! ")
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            user?.authentication.do { authentication, error in
                    guard error == nil else { return }
                    guard let authentication = authentication else { return }

                    let idToken = authentication.idToken
                     print("Token ID 11 \(idToken)")
                let apiconnection = ApiConnection()
                apiconnection.loginWithGoogle(Token: idToken ?? "") { data, error in
                    print("loginWithGoogle Data in \(String(describing: data))")
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
                            
//                            DispatchQueue.main.async{
//                                self.errorShowCase.isHidden = false
//                                self.errorImage.isHidden = false
//                                self.errorShowCase.text = "Invail Credentails"
//                            }
                            
                        }
                        
                        
                    }
                    
                }
                    // Send ID token to backend (example below).
                }
            
            guard error == nil else { return }
            print("Login success 12")
            // If sign in succeeded, display the app's main content View.
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
    
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
    @available(iOS 13, *)
    func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
//      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }
    
}
extension LoginViewController: ASAuthorizationControllerDelegate {

  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
      let jsonObject: NSMutableDictionary = NSMutableDictionary()
      
    if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
       
        
        
      guard let nonce = currentNonce else {
        fatalError("Invalid state: A login callback was received, but no login request was sent.")
      }
      guard let appleIDToken = appleIDCredential.identityToken else {
        print("Unable to fetch identity token")
        return
      }
      guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
        print("Unable to serialize token string from data")
        return
      }
        print("Final token is :\(idTokenString)")
        print("Final token is fullName:\(String(describing: appleIDCredential.fullName?.givenName))")
        print("Final token is User :\(String(describing: appleIDCredential.user))")
        
      
        jsonObject.setValue(idTokenString, forKey: "token")
        var _user:String
        var _token:String
        var _fullname:String
        
        _token = idTokenString
        if let fullname = appleIDCredential.fullName
        {
            _fullname =    String(describing: fullname.givenName!)+" "+String(describing: fullname.familyName!)
        }else
        {
            _fullname = ""
        }
//        if let user = appleIDCredential.user
//        {
//            _user = String(describing: user)
//        }else
//        {
//            _user = ""
//        }
        
//        let requestBody = AppleDetails(fullname: _fullname, user: _user, token: _token)
//       
//        
//        let encoder = JSONEncoder()
//           encoder.outputFormatting = .prettyPrinted
//           do {
//               let result = try encoder.encode(requestBody)
//               // RESULT IS NOW JSON-LIKE DATA OBJECT
//               if let jsonString = String(data: result, encoding: .utf8){
//                   // JSON STRING
//                   print("JSON \(jsonString)")
//               }
//           } catch {
//               print("Your parsing sucks \(error)")
//               return
//           }
        
    
       
      }
    }
  }

  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
    print("Sign in with Apple errored: \(error)")
  }

