//
//  ChoosePlanProTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 11/04/23.
//

import UIKit

class ChoosePlanProTVC: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblRupees: UILabel!
    @IBOutlet weak var lblProBase: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnSelectedChoose: UIButton!
    @IBOutlet weak var vwBackground: UIView!
    @IBOutlet weak var tblVwPlanList: UITableView!
    // MARK: - VAriables
    var arrList = ["Upload Video with HD Resolution","Attachment & Post Scheduling","Set your rates","Exclusive Deals","Advanced Statistics"]
    var type = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        tblVwPlanList.delegate = self
        tblVwPlanList.dataSource = self
        tblVwPlanList.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
// MARK: - UITableViewDelegate
extension ChoosePlanProTVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChoosePlanListTVC", for: indexPath) as! ChoosePlanListTVC
        if type == 0{
            cell.lblList.text = arrList[indexPath.row]
            cell.contentView.backgroundColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
        }else{
            cell.lblList.text = arrList[indexPath.row]
            cell.imgVWTick.image = UIImage(named: "yellowTick")
            cell.contentView.backgroundColor = UIColor(red: 1, green: 0.972, blue: 0.925, alpha: 1)
            cell.lblList.textColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
}
