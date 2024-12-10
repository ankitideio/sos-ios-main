//
//  EditProfileBusinessVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 10/04/23.
//

import UIKit

class EditProfileBusinessVC: UIViewController {

    @IBOutlet weak var txtVwAboutMe: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        
    }
    // MARK: - BUttonActions
    @IBAction func actionSaveChanges(_ sender: UIButton) {
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

