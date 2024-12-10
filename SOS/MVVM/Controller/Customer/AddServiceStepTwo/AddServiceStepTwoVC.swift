//
//  AddServiceStepTwoVC.swift
//  SOS
//
//  Created by meet sharma on 24/03/23.
//

import UIKit

class AddServiceStepTwoVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    @IBOutlet weak var tblVwChooseData: UITableView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    //MARK: - Variables
    var arrTitle = ["I am a","and ! specialize in","Woking From"]
    override func viewDidLoad() {
        super.viewDidLoad()
      uiSet()
    }
    func uiSet(){
        lblTitle.text = "Build your\nservice menu in seconds"
        lblDescription.text = "Choose a template inspired by top\n professionals on ShopOneStop."
        heightTblVw.constant = CGFloat(60*arrTitle.count)
    }
    //MARK: - ButtonAction
    @IBAction func actionCancel(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionSeeTemplates(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddServiceStepThirdVC") as! AddServiceStepThirdVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func actionAddService(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddServiceStepThirdVC") as! AddServiceStepThirdVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    

}
//MARK: - TableViewDelegate
extension AddServiceStepTwoVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseDataTVC", for: indexPath) as! ChooseDataTVC
        cell.lblTitle.text = arrTitle[indexPath.row]
        return cell
    }
    
    
}
