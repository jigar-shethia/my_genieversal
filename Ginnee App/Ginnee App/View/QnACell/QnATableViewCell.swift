//
//  QnATableViewCell.swift
//  Ginnee App
//
//  Created by Admin on 24/03/22.
//

import UIKit

class QnATableViewCell: UITableViewCell {

    @IBOutlet weak var buttonL1: UIButton!
    @IBOutlet weak var buttonL2: UIButton!
    @IBOutlet weak var buttonL3: UIButton!
    
    @IBOutlet weak var buttonCenter: UIButton!
    
    @IBOutlet weak var buttonR1: UIButton!
    @IBOutlet weak var buttonR2: UIButton!
    @IBOutlet weak var buttonR3: UIButton!
    @IBOutlet weak var lhsLabel: UILabel!
    @IBOutlet weak var rhsLabel: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonL3pressed(_ sender: Any) {
        print("buttonL3pressed")
        buttonL3.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonL2.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonL1.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonCenter.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        
//        suit.heart
    }
    @IBAction func buttonL2pressed(_ sender: Any) {
        print("buttonL2pressed")
        buttonL3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL2.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonL1.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonCenter.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        

    }
    @IBAction func buttonL1pressed(_ sender: Any) {
        print("buttonL1pressed")
        buttonL3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL1.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonCenter.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
    }
    @IBAction func buttonCentrepressed(_ sender: Any) {
        print("buttonCentrepressed")
        buttonL3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonCenter.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonR1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
    }
    @IBAction func buttonR1pressed(_ sender: Any) {
        print("buttonR1pressed")
        buttonL3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonCenter.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR1.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonR2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
    }
    @IBAction func buttonR2pressed(_ sender: Any) {
        print("buttonR2pressed")
        buttonL3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonCenter.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR1.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonR2.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonR3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
    }
    @IBAction func buttonR3pressed(_ sender: Any) {
        print("buttonR3pressed")
        buttonL3.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL2.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonL1.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonCenter.setImage(UIImage(systemName:"suit.heart"), for: .normal)
        buttonR1.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonR2.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
        buttonR3.setImage(UIImage(systemName:"suit.heart.fill"), for: .normal)
    }
    
}
