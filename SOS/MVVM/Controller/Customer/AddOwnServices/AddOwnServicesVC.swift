//
//  AddOwnServicesVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 08/04/23.
//

import UIKit

class AddOwnServicesVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwAddOwnService: UITableView!
    // MARK: - Variables
    var arrSection = ["Woman’s hair","Man’s hair cut","Kids","Hair color","Highlights"]
    var arrServiceTypes = ["Bang Trim","Women's Cut","Women's Trim","Women’s Dry Cut"]
   var isSelect = -1
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension AddOwnServicesVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSelect == section {
            return arrServiceTypes.count
        }else{
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddOwnServiceTVC", for: indexPath) as! AddOwnServiceTVC
        cell.contentView.backgroundColor = UIColor(red: 1, green: 0.961, blue: 0.925, alpha: 1)
        cell.lblService.text = arrServiceTypes[indexPath.row]
        if arrServiceTypes.count - 1 == indexPath.row{
            cell.contentView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
            cell.contentView.layer.cornerRadius = 7
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "AddOwnServiceHeaderTVC") as!  AddOwnServiceHeaderTVC
        header.vwHeader.layer.cornerRadius = 7
        header.lblHeaderTitle.text = arrSection[section]
        header.btnDropDown.tag = section
        header.btnDropDown.addTarget(self, action: #selector(DropDownUp), for: .touchUpInside)
        if isSelect == section {
            header.imgVwChange.image = UIImage(named: "upArrow")
            header.vwHeader.backgroundColor = UIColor(red: 1, green: 0.961, blue: 0.925, alpha: 1)
            header.vwHeader.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            
        }else{
            header.imgVwChange.image = UIImage(named: "downArrow")
            
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    @objc func DropDownUp(sender: UIButton){
        isSelect = (sender.tag == isSelect) ? -1 : sender.tag
        tblVwAddOwnService.reloadData()
    }
}
