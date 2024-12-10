//
//  LocationInfoVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 23/03/23.
//

import UIKit

class LocationInfoVC: UIViewController,UITextFieldDelegate{
   
    // MARK: - Outles
    @IBOutlet weak var txtFldLocation: UITextField!
    @IBOutlet weak var txtFldCountry: UITextField!
    @IBOutlet weak var txtFldCity: UITextField!
    @IBOutlet weak var txtFldState: UITextField!
    @IBOutlet weak var txtFldPostCode: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       uiSet()
    }
    func uiSet(){
        
    }
    // MARK: - ButtonAction
    @IBAction func actionState(_ sender: UIButton) {
    }
    @IBAction func actionCity(_ sender: UIButton) {
    }
    @IBAction func actionSubmit(_ sender: UIButton) {
    }
    @IBAction func actionCountry(_ sender: UIButton) {
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
