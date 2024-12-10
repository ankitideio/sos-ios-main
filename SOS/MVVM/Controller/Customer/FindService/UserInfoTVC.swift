//
//  UserInfoTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 21/03/23.
//

import UIKit
import FloatRatingView

class UserInfoTVC: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnBookWidth: NSLayoutConstraint!
    @IBOutlet weak var btnBookTrailing: NSLayoutConstraint!
    @IBOutlet weak var btnBookNow: UIButton!
    @IBOutlet weak var btnViewMore: UIButton!
    @IBOutlet weak var vwRating: FloatRatingView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
