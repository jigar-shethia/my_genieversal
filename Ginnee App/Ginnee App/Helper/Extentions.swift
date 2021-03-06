//
//  Extentions.swift
//  Ginnee App
//
//  Created by Jigar on 22/01/22.
//

import Foundation
import UIKit

private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = String(t!.prefix(maxLength))
    }
}
extension String
{
    func convertStringToDictionary() -> [String:AnyObject]? {
    
        if let data = self.data(using: .utf8) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    return json
                } catch {
                    print("Something went wrong")
                }
            }
            return nil
    }
    
}

