//
//  PayVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/03/23.
//

import UIKit

class PayVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldCCV: UITextField!
    @IBOutlet weak var txtFldYear: UITextField!
    @IBOutlet weak var txtFllldMonth: UITextField!
    @IBOutlet weak var txtFldCardNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionVisaPaypal(_ sender: UIButton) {
    }
    @IBAction func actionUPI(_ sender: UIButton) {
    }
    @IBAction func actionNetBanking(_ sender: UIButton) {
    }
    @IBAction func actionCreditCard(_ sender: UIButton) {
    }
    @IBAction func actionPayNow(_ sender: UIButton) {

    }
    
    @IBAction func actionCancelOrder(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
