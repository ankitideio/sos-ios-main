//
//  LocationBusinessVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 12/04/23.
//

import UIKit

class LocationBusinessVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldAddress: UITextField!
    @IBOutlet weak var txtFldSuiteApt: UITextField!
    @IBOutlet weak var txtFldCity: UITextField!
    @IBOutlet weak var txtFldState: UITextField!
    @IBOutlet weak var txtFldZip: UITextField!
    // MARK: - Variables
    var profileImage: UIImage?
    var businessName: String?
    var MoreInfoViewModel = BsignUpVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        
    }
    // MARK: - ButtonActions
    @IBAction func actionCreateAccount(_ sender: UIButton) {
        if txtFldAddress.text == ""{
            showSwiftyAlert("", "please enter your address", false)
        } else if txtFldSuiteApt.text == ""{
            showSwiftyAlert("", "please enter your suite apt", false)
        } else if txtFldCity.text == ""{
            showSwiftyAlert("", "please enter your city", false)
        } else if txtFldState.text == ""{
            showSwiftyAlert("", "please enter your state", false)
        } else if txtFldZip.text == ""{
            showSwiftyAlert("", "please enter your zip", false)
        }else{
//            MoreInfoViewModel.businessSignUpMoreInfoApi(businessName: "", profileImage: , city: txtFldCity.text ?? "", address: txtFldAddress.text ?? "", zip: txtFldZip.text ?? "") { data in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "BusinessHomeVC") as! BusinessHomeVC
                self.navigationController?.pushViewController(vc, animated: true)
//            }
        }
    }
    @IBAction func actionLogin(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
