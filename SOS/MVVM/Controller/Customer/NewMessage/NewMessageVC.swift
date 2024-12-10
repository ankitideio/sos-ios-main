//
//  NewMessageVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 30/03/23.
//

import UIKit

class NewMessageVC: UIViewController{
    // MARK: - Outlets
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var txtVwMessage: UITextView!
    @IBOutlet weak var txtFldSubject: UITextField!
    @IBOutlet weak var txtFldRecipient: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        // MARK: - Navigation

    @IBAction func actionCancel(_ sender: UIButton) {
        btnCancel.backgroundColor =  UIColor(red: 0.675, green: 0.596, blue: 0.49, alpha: 1)
        btnSend.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
        btnSend.setTitleColor(.black, for: .normal)
    }
    @IBAction func actionSend(_ sender: UIButton) {
     
        btnSend.backgroundColor =  UIColor(red: 0.675, green: 0.596, blue: 0.49, alpha: 1)
        btnCancel.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
        btnSend.setTitleColor(.white, for: .normal)
    }
}

