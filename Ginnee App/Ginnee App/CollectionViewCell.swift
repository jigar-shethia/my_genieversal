//
//  CollectionViewCell.swift
//  Ginnee App
//
//  Created by Jigar on 30/01/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var testLabel: UILabel!
    func addLabelName(with labelName:String)
    {
        testLabel.text = labelName
    }
    
}
