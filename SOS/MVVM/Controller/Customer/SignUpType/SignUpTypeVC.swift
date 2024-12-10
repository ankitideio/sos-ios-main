//
//  SignUpTypeVC.swift
//  SOS
//
//  Created by meet sharma on 17/03/23.
//

import UIKit

class SignUpTypeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    //MARK: - ButtonAction
    @IBAction func actionSignUpCustomer(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionSignUpBusiness(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpBusinessVC") as! SignUpBusinessVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
