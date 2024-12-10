//
//  PaymentVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 07/04/23.
//

import UIKit
import FloatRatingView


class PaymentVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldCardNumber: UITextField!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var txtVwAddNote: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonActions
    @IBAction func actionPayNow(_ sender: UIButton) {
    }
    @IBAction func actionMyOffers(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "YourOfferVC") as! YourOfferVC
        vc.isSelect  = 2
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

