//
//  BirthdayPickerViewController.swift
//  Ginnee App
//
//  Created by Admin on 12/02/22.
//

import UIKit

class BirthdayPickerViewController: UIViewController,UIPickerViewDelegate {
    

    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var ageLbl: UILabel!
    var isAge:Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        isAge = false
        birthdayPicker?.addTarget(self, action: #selector(self.dateChanged), for: .valueChanged)
        // Do any additional setup after loading the view.
    }
    
    @objc func dateChanged(sender : UIDatePicker) {
        
        let dateOfBirth = birthdayPicker.date
        let gregorian = Calendar(identifier: .gregorian)
        let ageComponents = gregorian.dateComponents([.year], from: gregorian.startOfDay(for: dateOfBirth), to: gregorian.startOfDay(for: Date()))
        let age = ageComponents.year!
        ageLbl.text = String(age)
        verifyAge(age)
        
        
    }
    
    func verifyAge(_ age: Int){
        
        ageLbl.textColor = age < 18 ? .red : UIColor(named: "boderColor") ?? .darkGray
        if(age<18)
        {
            isAge = false
        }else
        {
            isAge = true
        }
    }
    
    @IBAction func proceedPressButton(_ sender: Any) {
        if(isAge)
        {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AboutMeViewController") as? AboutMeViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        
    }
}
