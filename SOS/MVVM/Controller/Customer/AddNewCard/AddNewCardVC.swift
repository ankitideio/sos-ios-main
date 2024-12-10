//
//  AddNewCardVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 11/04/23.
//

import UIKit

class AddNewCardVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldYear: UITextField!
    @IBOutlet weak var txtFldMOnth: UITextField!
    @IBOutlet weak var txtFldCVV: UITextField!
    @IBOutlet weak var txtFldCardNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func uiSet(){

    }
    // MARK: - BUttonActions
    @IBAction func actionAddCard(_ sender: UIButton) {
        if txtFldCardNumber.text == ""{
            showSwiftyAlert("", "Please enter your card number", false)
        }else if txtFldCVV.text == ""{
            showSwiftyAlert("", "Please enter your CVV  ", false)
        }else if txtFldMOnth.text == ""{
            showSwiftyAlert("", "Please enter your expiry date", false)
        }else if txtFldYear.text == ""{
            showSwiftyAlert("", "Please enter your select shipping", false)
        }else{
            
        }
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
