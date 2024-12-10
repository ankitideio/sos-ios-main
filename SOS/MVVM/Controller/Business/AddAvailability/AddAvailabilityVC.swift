//
//  AddAvailabilityVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 11/04/23.
//

import UIKit

class AddAvailabilityVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwAvailability: UITableView!
    // MARK: - Variables
    var arrSection = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday",]
    var isSelect = -1
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonAction
    @IBAction func acttionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension AddAvailabilityVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSelect == section {
            return 1
        }else{
            return 0
       }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAvailabilityTVC", for: indexPath) as! AddAvailabilityTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "AvailabilityHeaderTVC") as!  AvailabilityHeaderTVC
        header.lblDaysName.text = arrSection[section]
        header.btnSwitch.tag = section
        header.btnSwitch.addTarget(self, action: #selector(hideShowRow), for: .touchUpInside)
        if isSelect == section{
            header.btnSwitch.setImage(UIImage(named: "select"), for: .normal)
            header.vwHeader.backgroundColor = UIColor(red: 1, green: 0.961, blue: 0.925, alpha: 1)
            header.vwHeader.clipsToBounds = true
            header.vwHeader.layer.cornerRadius = 0
            
        }else{
            header.btnSwitch.setImage(UIImage(named: "deSelect"), for: .normal)
            header.vwHeader.layer.cornerRadius = 7
        }
        return header
    }
    @objc func hideShowRow(sender: UIButton){
        sender.isSelected = !sender.isSelected
        isSelect = (sender.tag == isSelect) ? -1 : sender.tag
        tblVwAvailability.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
}

