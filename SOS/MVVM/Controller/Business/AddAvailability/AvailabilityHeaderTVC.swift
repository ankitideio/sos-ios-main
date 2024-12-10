//
//  AvailabilityHeaderTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 11/04/23.
//

import UIKit

class AvailabilityHeaderTVC: UITableViewCell {

    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var btnSwitch: UIButton!
    @IBOutlet weak var lblDaysName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
