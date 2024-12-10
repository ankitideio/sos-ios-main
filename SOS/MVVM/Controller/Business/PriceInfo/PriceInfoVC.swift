//
//  PriceInfoVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 23/03/23.
//

import UIKit

class PriceInfoVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldDiscount: UITextField!
    @IBOutlet weak var txtFldPriceTo: UITextField!
    @IBOutlet weak var txtFldPriceFrom: UITextField!
    @IBOutlet weak var txtFldPriceRange: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonAction
    @IBAction func actionNext(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LocationInfoVC") as! LocationInfoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
