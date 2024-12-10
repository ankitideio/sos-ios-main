//
//  SavedCardTVC.swift
//  SOS
//
//  Created by meet sharma on 20/03/23.
//

import UIKit

class SavedCardTVC: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var imgVwBackground: UIImageView!
    @IBOutlet weak var lblExpiry: UILabel!
    @IBOutlet weak var lblCardHolder: UILabel!
    @IBOutlet weak var vwBackground: UIView!
    @IBOutlet weak var imgVwCard: UIImageView!
    @IBOutlet weak var lblCardNumber: UILabel!
    @IBOutlet weak var lblExpiryDate: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
