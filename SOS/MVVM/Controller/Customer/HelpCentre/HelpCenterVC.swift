//
//  HelpCenterVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import UIKit

class HelpCenterVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldMessage: UITextField!
    @IBOutlet weak var txtFldSubject: UITextField!
    @IBOutlet weak var txtxFldName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSend(_ sender: UIButton) {
    }
}
