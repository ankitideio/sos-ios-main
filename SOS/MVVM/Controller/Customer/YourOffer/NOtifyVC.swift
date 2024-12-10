//
//  NOtifyVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 07/04/23.
//

import UIKit

class NOtifyVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldPhonNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonActions
    @IBAction func actionApply(_ sender: UIButton) {
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
