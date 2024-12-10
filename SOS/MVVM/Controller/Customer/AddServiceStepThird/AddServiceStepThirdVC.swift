//
//  AddServiceStepThirdVC.swift
//  SOS
//
//  Created by meet sharma on 24/03/23.
//

import UIKit

class AddServiceStepThirdVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblVwService: UITableView!
    @IBOutlet weak var txtFldSpecialty: UITextField!
    @IBOutlet weak var txtFldProfession: UITextField!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    //MARK: - Variables
    var arrService = ["Consultation", "Men's Cut","All Over Color","Kid's Cut","Bang Trim","Beard Trim","Deep Conditioning Treatment","Women's Cut","Line Up","Toner"]
    var arrPrice = ["$10.00","$35.00","$80.00","$25.00","$10.00","$15.00","$30.00","$40.00","$15.00","$35.00"]
    override func viewDidLoad() {
        super.viewDidLoad()

     uiSet()
    }
    func uiSet(){
        heightTblVw.constant = CGFloat(arrService.count*35+55)
        lblTitle.text = "Templates inspired\nby top professionals on ShopOneStop"
        lblDescription.text = "Choose a template inspired by top\n professionals on ShopOneStop."
    }
    //MARK: - ButtonAction
    @IBAction func actionCancel(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func actionAddServiceProfile(_ sender: UIButton) {
    }
    
    @IBAction func actionAddService(_ sender: UIButton) {
    }
}
//MARK: - TableViewDelegate
extension AddServiceStepThirdVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddServiceListTVC", for: indexPath) as! AddServiceListTVC
        cell.lblName.text = arrService[indexPath.row]
        cell.lblPrice.text = arrPrice[indexPath.row]
        return cell
    }
    
    
}
