//
//  AddProductRAtingVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 14/04/23.
//

import UIKit
import FloatRatingView

class AddProductRAtingVC: UIViewController {

    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var txtVWReview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func actionSubmit(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
