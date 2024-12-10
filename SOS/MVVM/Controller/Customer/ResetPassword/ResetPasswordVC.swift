//
//  ResetPasswordVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/03/23.
//

import UIKit

class ResetPasswordVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var btnNewPassword: UIButton!
    @IBOutlet weak var btnConfimPassword: UIButton!
    @IBOutlet weak var txtFldConfiPassword: UITextField!
    @IBOutlet weak var txtFldNewPassword: UITextField!
    
    var resetPasswdViewModel = ResetPasswordVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        txtFldNewPassword.isSecureTextEntry = true
        btnNewPassword.setTitle("", for: .normal)
        txtFldConfiPassword.isSecureTextEntry = true
        btnConfimPassword.setTitle("", for: .normal)
    }
    // MARK: - ButtonAction
    @IBAction func actionNewPasswordHideShow(_ sender: UIButton) {
       sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            sender.setImage(UIImage(named: "openEye"), for: .normal)
            txtFldNewPassword.isSecureTextEntry = false
        }else{
            sender.setImage(UIImage(named: "closeEye"), for: .normal)
            txtFldNewPassword.isSecureTextEntry = true
        }
    }
    @IBAction func actionConfirmPasswordHideShow(_ sender: UIButton) {
       sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            sender.setImage(UIImage(named: "openEye"), for: .normal)
            txtFldConfiPassword.isSecureTextEntry = false
        }else{
            sender.setImage(UIImage(named: "closeEye"), for: .normal)
            txtFldConfiPassword.isSecureTextEntry = true
        }
    }
    @IBAction func actionDone(_ sender: UIButton) {
        if txtFldNewPassword.text == ""{
            showSwiftyAlert("", "enter your new password", false)
        }else if txtFldConfiPassword.text == ""{
            showSwiftyAlert("", "enter your confirm password", false)
        }else{
            resetPasswdViewModel.ResetPasswordAPI(newPassword: txtFldNewPassword.text ?? "", confirmPAssword: txtFldConfiPassword.text ?? "") {
            }
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
}
