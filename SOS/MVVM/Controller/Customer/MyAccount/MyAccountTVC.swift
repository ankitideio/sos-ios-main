//
//  MyAccountTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import UIKit

class MyAccountTVC: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgVwIcons: UIImageView!
    
    var type = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
