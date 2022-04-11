//
//  WiteyourStroyViewController.swift
//  Ginnee App
//
//  Created by Admin on 26/03/22.
//

import UIKit

class WiteyourStroyViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var storyTextView: UITextView!
    @IBOutlet weak var StoryView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StoryView.backgroundColor = .clear
        StoryView.layer.cornerRadius = 10
        StoryView.layer.borderWidth = 1
        StoryView.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        // Do any additional setup after loading the view.
        
        storyTextView.text = "You can wirte your story here"
        storyTextView.textColor = UIColor.lightGray
        storyTextView.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditing")
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor(named: "boderColor")
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        print("textViewDidEndEditing")
        if textView.text.isEmpty {
            textView.text = "You can wirte your story here"
            textView.textColor = UIColor.lightGray
        }
    }
    func hideKeyboardWhenTappedAround() {
           let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }
       
       @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    @IBAction func proceedClicked(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TagsViewController") as? TagsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
