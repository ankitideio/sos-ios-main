//
//  YourOfferVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 04/04/23.
//

import UIKit

class YourOfferVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtFldPromotionCode: UITextField!
    // MARK: - Variables
    var isSelect = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       uiSet()
    }
    func uiSet(){
        if isSelect == 0{
            lblTitle.text = "My Offer"
        }else{
            lblTitle.text = "Your Offer"
        }
    }
    // MARK: - ButtonAction
    @IBAction func actionSubmit(_ sender: Any) {
        
//        if isComing == false{
        if isSelect == 1{
            let vc = storyboard?.instantiateViewController(withIdentifier: "PaymentMethodVC") as! PaymentMethodVC
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else if isSelect == 0{
            let vc = storyboard?.instantiateViewController(withIdentifier: "SavedCardVC") as! SavedCardVC
            
                self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "NOtifyVC") as! NOtifyVC
            
                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
