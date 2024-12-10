//
//  ViewProductRatingVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 11/04/23.
//

import UIKit
import FloatRatingView

class ViewProductRatingVC: UIViewController {

    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var txtVwReview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
       
    }
    // MARK: - ButtonAction
    @IBAction func actionSubmit(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}

