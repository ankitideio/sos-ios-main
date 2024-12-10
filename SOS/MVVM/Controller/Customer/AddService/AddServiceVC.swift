//
//  AddServiceVC.swift
//  SOS
//
//  Created by meet sharma on 24/03/23.
//

import UIKit

class AddServiceVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tblVwAddService: UITableView!
    @IBOutlet weak var txtFldSerach: UITextField!
    //MARK: - Variables
    var selectIndex = -1
    var arrService = ["Bang Trim","Women's Cut","Women's Trim","Women's Haircut"]
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    //MARK: - ButtonAction
    @IBAction func actionCancel(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func actionSave(_ sender: UIButton) {
    }
    

}
//MARK: - TableViewDelegate
extension AddServiceVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
     
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectIndex == section{
            return arrService.count
        }else{
            return 0
        }
     
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceHeaderTVC") as! ServiceHeaderTVC
        cell.btnDropDown.addTarget(self, action: #selector(dropDown), for: .touchUpInside)
        cell.btnDropDown.tag = section
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
            return 40
        
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectServiceListTVC", for: indexPath) as! SelectServiceListTVC
        cell.lblServiceName.text = arrService[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 40
    }
    @objc func dropDown(sender:UIButton){
        selectIndex = (sender.tag == selectIndex) ? -1 : sender.tag
        tblVwAddService.reloadData()
    }
}
