//
//  MoreInfoBusinessprofileVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 12/04/23.
//

import UIKit

class MoreInfoBusinessprofileVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    // MARK: - Outlets
    @IBOutlet weak var imgVwProfile: UIImageView!
    @IBOutlet weak var txtFldLastName: UITextField!
    @IBOutlet weak var txtFldFirstName: UITextField!
    @IBOutlet weak var txtFldBUsinessName: UITextField!
    // MARK: - Variables
    var moreInfoViewModel = BsignUpVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        
        txtFldFirstName.text = Store.businessUserDetails?.user.name ?? ""
        txtFldLastName.text = Store.businessUserDetails?.user.lastname ?? ""
      
    }
    // MARK: - ButtonActions
    @IBAction func acionUploadPhoto(_ sender: UIButton) {
        (ImagePicker().pickImage(self){ image in
            self.imgVwProfile.image = image
        })
    }
   
    @IBAction func actionSaveContinue(_ sender: UIButton) {
        if txtFldFirstName.text == ""{
            showSwiftyAlert("", "Please enter your firstName", false)
        }else if txtFldLastName.text == ""{
            showSwiftyAlert("", "Please enter your lastName", false)
        }else if txtFldBUsinessName.text == ""{
            showSwiftyAlert("", "Please enter your businessName", false)
        }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LocationBusinessVC") as! LocationBusinessVC
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func actionSignup(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpBusinessVC") as! SignUpBusinessVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
