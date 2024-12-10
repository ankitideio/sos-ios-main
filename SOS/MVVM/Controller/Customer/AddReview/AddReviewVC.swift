//
//  AddReviewVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 22/03/23.
//

import UIKit
import FloatRatingView


class AddReviewVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var vwTxtReview: UITextView!
    @IBOutlet weak var vwRating: FloatRatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        
    }
    // MARK: - ButtonAction
    @IBAction func actionSubmit(_ sender: UIButton) {
    }
}
