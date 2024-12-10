//
//  ProductCategoryTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 23/03/23.
//

import UIKit

class ProductCategoryTVC: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var btnCheckBox: UIButton!
    @IBOutlet weak var lblProductName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
