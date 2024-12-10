//
//  ShippingAddressVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/03/23.
//

import UIKit

class ShippingAddressVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldSelectShopping: UITextField!
    @IBOutlet weak var txtFldPostCode: UITextField!
    @IBOutlet weak var txtFldStreetName: UITextField!
    @IBOutlet weak var txtFldFirstLineOfAddress: UITextField!
    @IBOutlet weak var txtFldSavedAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonAction
    @IBAction func actionCancelOrder(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionShippingAddress(_ sender: Any) {
       if txtFldFirstLineOfAddress.text == ""{
            showSwiftyAlert("", "please enter your Address ", false)
        }else if txtFldStreetName.text == ""{
            showSwiftyAlert("", "please enter your streetName ", false)
        }else if txtFldPostCode.text == ""{
            showSwiftyAlert("", "please enter your PostCode ", false)
        }else if txtFldSelectShopping.text == ""{
            showSwiftyAlert("", "please enter Select Shipping ", false)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PayVC") as! PayVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func actionSelectShopping(_ sender: Any) {
    }
    @IBAction func actionSavedAddress(_ sender: UIButton) {
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
