//
//  FavouriteProductsCVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 28/04/23.
//

import UIKit

class FavouriteProductsCVC: UICollectionViewCell {
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblDecription: UILabel!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var imgVwProduct: UIImageView!
   
    @IBOutlet weak var btnFavourite: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
