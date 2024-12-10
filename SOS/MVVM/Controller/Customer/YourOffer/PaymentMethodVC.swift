//
//  PaymentMethodVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 08/04/23.
//

import UIKit

class PaymentMethodVC: UIViewController {
 var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSubmit(_ sender: UIButton) {
    }
}
