//
//  LoginVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 17/03/23.
//

import UIKit

class LoginVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var btnPasword: UIButton!
    //MARK: - Variables
    var loginViewModel = LogInVM()
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        btnPasword.setTitle("", for: .normal)
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
    @IBAction func actionSignupHere(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpTypeVC") as! SignUpTypeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionFacebook(_ sender: UIButton) {
    }
    @IBAction func actionGoogle(_ sender: UIButton) {
    }
    @IBAction func actionLogin(_ sender: UIButton) {
        if txtFldEmail.text == ""{
            showSwiftyAlert("", "Please enter your email address", false)
        } else if txtFldEmail.isValidEmail(txtFldEmail.text ?? "") == false{
            showSwiftyAlert("", "Please enter valid email address", false)
        }else if txtFldPassword.text == ""{
            showSwiftyAlert("", "Please enter your password", false)
        }else{
            loginViewModel.userLoginApi(email: txtFldEmail.text ?? "", password: txtFldPassword.text ?? "", fcmToken: "user"){ data in
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
                    if data?.user.role ?? "" == "user"{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                        self.navigationController?.pushViewController(vc, animated: true)
                    }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreInfoBusinessprofileVC") as! MoreInfoBusinessprofileVC
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }
    @IBAction func actionForgotPasword(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
