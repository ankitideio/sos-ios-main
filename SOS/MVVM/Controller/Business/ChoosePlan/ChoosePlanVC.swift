//
//  ChoosePlanVCViewController.swift
//  SOS
//
//  Created by IDEIO SOFT on 11/04/23.
//

import UIKit

class ChoosePlanVC: UIViewController {
var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension ChoosePlanVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoosePlanProTVC", for: indexPath) as! ChoosePlanProTVC
        if indexPath.row == 0 {
            cell.lblProBase.text = "Pro"
            cell.btnSelectedChoose.addTarget(self, action: #selector(selectedAndChoose), for: .touchUpInside)
        }else{
            
            cell.type = indexPath.row
            cell.lblProBase.text = "Base"
            cell.lblProBase.textColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
            cell.btnSave.isHidden = true
            cell.btnSelectedChoose.setTitle("Choose", for: .normal)
            cell.vwBackground.backgroundColor = UIColor(red: 1, green: 0.972, blue: 0.925, alpha: 1)
            cell.contentView.backgroundColor = UIColor(red: 1, green: 0.972, blue: 0.925, alpha: 1)
            cell.lblMonth.textColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
            cell.lblRupees.textColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
            cell.btnSelectedChoose.backgroundColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
            cell.btnSelectedChoose.setTitleColor(.white, for: .normal)
            cell.btnSelectedChoose.tag = indexPath.row
            
        }
        return cell
    }
    @objc func selectedAndChoose(sender: UIButton){
        if isComing == true{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddServiceBusinessVC") as! AddServiceBusinessVC
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            isComing = false
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddProductVC") as! AddProductVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }
    
}
