//
//  UploadImageViewController.swift
//  Ginnee App
//
//  Created by Jigar shethia on 09/01/22.
//

import UIKit
import BSImagePicker
import Photos

class UploadImageViewController: UIViewController {
    
    @IBOutlet weak var InstagramUpload: UIView!
    @IBOutlet weak var CameraUpload: UIView!
    @IBOutlet weak var FacebookUpload: UIView!
    @IBOutlet weak var QuoteText: UILabel!
    var globalAssets = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupLayout()
    }
    
    
    func setupLayout()
    {
        
        let tappedOnInsta = UITapGestureRecognizer(target: self, action: #selector(self.uploadImageViaInstagram(_:)))
        InstagramUpload.addGestureRecognizer(tappedOnInsta)
        
    
        InstagramUpload.backgroundColor = .clear
        InstagramUpload.layer.cornerRadius = 12
        InstagramUpload.layer.borderWidth = 1
        InstagramUpload.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
        
        let tappedOnCarmeraRoll = UITapGestureRecognizer(target: self, action: #selector(self.uploadImageViaCameraRoll(_:)))
        CameraUpload.addGestureRecognizer(tappedOnCarmeraRoll)
        
    
        CameraUpload.backgroundColor = .clear
        CameraUpload.layer.cornerRadius = 12
        CameraUpload.layer.borderWidth = 1
        CameraUpload.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
        
        let tappedOnFacebook = UITapGestureRecognizer(target: self, action: #selector(self.uploadImageViaFacebook(_:)))
        FacebookUpload.addGestureRecognizer(tappedOnFacebook)
        
        FacebookUpload.backgroundColor = .clear
        FacebookUpload.layer.cornerRadius = 12
        FacebookUpload.layer.borderWidth = 1
        FacebookUpload.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
        QuoteText.backgroundColor = .clear
        QuoteText.layer.cornerRadius = 12
        QuoteText.layer.borderWidth = 1
        QuoteText.layer.borderColor = UIColor(named: "boderColor")?.cgColor
        
    
    }
    
  
    @objc func uploadImageViaInstagram(_ sender: UITapGestureRecognizer? = nil) {
        print("uploadImageViaInstagram clicked! ")
        
    }
    @objc func uploadImageViaCameraRoll(_ sender: UITapGestureRecognizer? = nil) {
        print("uploadImageViaCameraRoll clicked! ")
        let imagePicker = ImagePickerController()
        imagePicker.settings.selection.max = 6
        imagePicker.settings.theme.selectionStyle = .numbered
        imagePicker.settings.fetch.assets.supportedMediaTypes = [.image]
        imagePicker.settings.selection.unselectOnReachingMax = true

        let start = Date()
        self.presentImagePicker(imagePicker, select: { (asset) in
            print("Selected: \(asset)")
        }, deselect: { (asset) in
            print("Deselected: \(asset)")
        }, cancel: { (assets) in
            print("Canceled with selections: \(assets)")
        }, finish: { (assets) in
            self.globalAssets = assets
            DispatchQueue.main.async{
          
               
            print("UIStoryboard 112")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "BirthdayPickerViewController") as? BirthdayPickerViewController
            self.navigationController?.pushViewController(vc!, animated: true)
    
            
            }

            print("Finished with 232 selections: \(assets)")
                        
        }, completion: {
            let finish = Date()
            print(finish.timeIntervalSince(start))
        })
        
        
    }
    @objc func uploadImageViaFacebook(_ sender: UITapGestureRecognizer? = nil) {
        print("uploadImageViaFacebook clicked! ")
        
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
