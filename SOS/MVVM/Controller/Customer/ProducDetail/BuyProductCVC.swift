//
//  BuyProductCVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/03/23.
//

import UIKit
import FloatRatingView
class BuyProductCVC: UICollectionViewCell {

    @IBOutlet weak var lblLess: UILabel!
    @IBOutlet weak var btnBuyNow: UIButton!
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var imgVwProduct: UIImageView!
    @IBOutlet weak var vwFloatRating: FloatRatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
