//
//  EditAvailabilityTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 27/03/23.
//

import UIKit

class EditAvailabilityTVC: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var switchDays: UISwitch!
    @IBOutlet weak var lblDays: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
