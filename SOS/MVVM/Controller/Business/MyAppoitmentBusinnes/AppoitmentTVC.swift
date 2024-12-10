//
//  AppoitmentTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 10/04/23.
//

import UIKit

class AppoitmentTVC: UITableViewCell {
    @IBOutlet weak var widthStackVw: NSLayoutConstraint!
    @IBOutlet weak var btnReject: UIButton!
    @IBOutlet weak var btnAccept: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
