//
//  WelcomeVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 17/03/23.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - ButtonAction
    @IBAction func actionGetStarted(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpTypeVC") as! SignUpTypeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
}
