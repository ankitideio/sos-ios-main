//
//  AddRatingVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 21/03/23.
//

import UIKit
import FloatRatingView

class AddRatingVC: UIViewController{
    // MARK: - Outlets
    @IBOutlet weak var txtVwReview: UITextView!
    @IBOutlet weak var vwRating: FloatRatingView!
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

