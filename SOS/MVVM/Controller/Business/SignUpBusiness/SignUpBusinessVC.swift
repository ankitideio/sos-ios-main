//
//  SignUpBusinessVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 21/03/23.
//

import UIKit

class SignUpBusinessVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var btnPassword: UIButton!
    @IBOutlet weak var txtFldFirstName: UITextField!
    @IBOutlet weak var txtFldLastName: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldHearAboutUs: UITextField!
    @IBOutlet weak var txtFldPhoneNumber: UITextField!
    
    var BsignUpViewModel = BsignUpVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        txtFldEmail.keyboardType = .emailAddress
        txtFldPassword.isSecureTextEntry = true
    }
    // MARK: - ButtonAction
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
    @IBAction func actionHearAboutUs(_ sender: UIButton) {
    }
    @IBAction func actionFacebook(_ sender: UIButton) {
    }
    @IBAction func actionGoogle(_ sender: UIButton) {
    }
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionCreateAccount(_ sender: UIButton) {
        if txtFldFirstName.text == ""{
            showSwiftyAlert("", "Please enter your firstName", false)
        }else if txtFldLastName.text == ""{
            showSwiftyAlert("", "Please enter your lastName", false)
        } else if txtFldEmail.text == ""{
            showSwiftyAlert("", "Please enter your email", false)
        } else if txtFldEmail.isValidEmail(txtFldEmail.text ?? "") == false{
            showSwiftyAlert("", "Please enter valid email", false)
        }else if txtFldPassword.text == "" {
            showSwiftyAlert("", "Please enter your password", false)
        }else if txtFldPhoneNumber.text == ""{
            showSwiftyAlert("", "Please enter your phoneNumber", false)
        }else if txtFldPhoneNumber.isValidPhone(phone: txtFldPhoneNumber.text ?? "") == false{
            showSwiftyAlert("", "Please enter valid phoneNumber", false)
        }else if txtFldHearAboutUs.text == ""{
        }else{
            BsignUpViewModel.businessSignUpApi(firstName: txtFldFirstName.text ?? "", lastName: txtFldLastName.text ?? "", email: txtFldEmail.text ?? "", latitude: 30.704649, longitude: 76.717873, password: txtFldPassword.text ?? "", mobile: txtFldPhoneNumber.text ?? "", question: txtFldHearAboutUs.text ?? "", fcmToken: "for ios,android and web", role: "business") { data in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "MoreInfoBusinessprofileVC") as! MoreInfoBusinessprofileVC
                self.navigationController?.pushViewController(vc, animated: true)
            }
       
        }
    }
}

