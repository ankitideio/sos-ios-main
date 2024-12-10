//
//  ChangePasswordVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import UIKit

class ChangePasswordVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldOldPassword: UITextField!
    @IBOutlet weak var txtFldNewPassword: UITextField!
    @IBOutlet weak var txtFldRetypeNewPassword: UITextField!
    // MARK: - Variables
    var changePasswdViewModel = ChangePasswordVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        
    }
    // MARK: - ButtonActions
    @IBAction func actionSubmit(_ sender: UIButton) {
        if txtFldOldPassword.text == ""{
            showSwiftyAlert("", "Please enter your old password", false)
        }else if txtFldNewPassword.text == ""{
            showSwiftyAlert("", "Please enter your new password", false)
        }else if txtFldRetypeNewPassword.text == ""{
            showSwiftyAlert("", "Please enter your confirm password", false)
        }else if txtFldNewPassword.text != txtFldRetypeNewPassword.text{
            showSwiftyAlert("", "Please enter same password", false)
        }else{
            changePassswordApi()
            self.navigationController?.popViewController(animated: true)
        }
    }
    func changePassswordApi(){
        changePasswdViewModel.chnagePasswordAPI(oldPassword: txtFldOldPassword.text ?? "", newPassword: txtFldNewPassword.text ?? "", confirmPAssword: txtFldRetypeNewPassword.text ?? ""){
            
        }
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
