//
//  CartTVC.swift
//  SOS
//
//  Created by meet sharma on 20/03/23.
//

import UIKit

class CartTVC: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var imgVwProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
