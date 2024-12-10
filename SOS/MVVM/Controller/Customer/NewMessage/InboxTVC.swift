//
//  InboxTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 30/03/23.
//

import UIKit

class InboxTVC: UITableViewCell {
    @IBOutlet weak var lblInbox: UILabel!
    
    @IBOutlet weak var btnCheckbox: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
