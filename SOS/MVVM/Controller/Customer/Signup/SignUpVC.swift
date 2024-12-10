//
//  SignUpVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 17/03/23.
//

import UIKit

class SignUpVC: UIViewController {
    // MARK: - Outles
    @IBOutlet weak var btnPassword: UIButton!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    
    // MARK: - Variables
    var signUpViewModel = SignUpVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        txtFldEmail.keyboardType = .emailAddress
        txtFldPassword.isSecureTextEntry = true
        btnPassword.setTitle("", for: .normal)
    }
    //MARK: - ButtonActions
    @IBAction func actionPasswordHideShow(_ sender: UIButton) {
       sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            sender.setImage(UIImage(named: "openEye"), for: .normal)
            txtFldPassword.isSecureTextEntry = false
        }else{
            sender.setImage(UIImage(named: "closeEye"), for: .normal)
            txtFldPassword.isSecureTextEntry = true
        }
    }
    @IBAction func actionCreateAccount(_ sender: UIButton) {
        if txtFldName.text == ""{
            showSwiftyAlert("", "Please enter your full name", false)
        }else if txtFldEmail.text == ""{
            showSwiftyAlert("", "Please enter your email address", false)
        }else if txtFldEmail.isValidEmail(txtFldEmail.text ?? "") == false{
            showSwiftyAlert("", "Please enter valid email address", false)
        }else if txtFldPassword.text == ""{
            showSwiftyAlert("", "Please enter your password", false)
        }else{
            signUpViewModel.signupApi(name: txtFldName.text ?? "", email: txtFldEmail.text ?? "", password: txtFldPassword.text ?? "", fcmToken: "for ios,android and web", role: "user"){ data in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func acctionFacebook(_ sender: UIButton) {
    }
    @IBAction func actionGoogle(_ sender: UIButton) {
    }
}
