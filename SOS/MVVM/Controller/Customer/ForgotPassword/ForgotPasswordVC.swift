//
//  ForgotPasswordVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/03/23.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldEmail: UITextField!
    // MARK: - Variables
    var forgotPasswdViewModel = ForgotPasswordVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        txtFldEmail.keyboardType = .emailAddress
    }
    // MARK: - ButtonAction
    @IBAction func actionSendLink(_ sender: UIButton) {
        if txtFldEmail.text == ""{
            showSwiftyAlert("", "Please enter your email", false)
        }else if txtFldEmail.isValidEmail(txtFldEmail.text ?? "") == false{
            showSwiftyAlert("", "Please enter valid email", false)
        }else{
            forgotPasswdViewModel.ForgotPasswordApi(email: txtFldEmail.text ?? ""){ data in
                Store.authKey = data?.token ?? ""
            }
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    }

