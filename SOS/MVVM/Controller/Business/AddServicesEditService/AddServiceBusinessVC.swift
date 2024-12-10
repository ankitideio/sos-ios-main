//
//  AddServiceBusinessVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 08/04/23.
//

import UIKit

class AddServiceBusinessVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSeeTemplate(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SeeTemplatesVC") as! SeeTemplatesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionAddService(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddOwnServicesVC") as! AddOwnServicesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
