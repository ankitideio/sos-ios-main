//
//  AddDiscountVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 29/03/23.
//

import UIKit

class AddDiscountVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var imgVwAdd: UIImageView!
    @IBOutlet weak var txtVwDecription: UITextView!
    @IBOutlet weak var txtFldDiscount: UITextField!
    @IBOutlet weak var txtFldServiceName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - ButtonAction

    @IBAction func actionAddImg(_ sender: UIButton) {
    }
    @IBAction func actionSelectServiceType(_ sender: UIButton) {
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func actionAddproduct(_ sender: UIButton) {
    }
    
}
