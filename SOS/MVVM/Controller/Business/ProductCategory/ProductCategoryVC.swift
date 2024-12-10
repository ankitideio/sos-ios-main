//
//  ProductCategoryVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 23/03/23.
//

import UIKit

class ProductCategoryVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwProductCategory: UITableView!
    
    var ProductCategory = ["Automotive","Electronics","Fashion Style","Health Care","Job board","Education","Real Estate","Travel","Sports & Game","Magazines","Pet & Animal","Household"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButonAction
    @IBAction func actionNext(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PriceInfoVC") as! PriceInfoVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension ProductCategoryVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProductCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCategoryTVC", for: indexPath) as! ProductCategoryTVC
        cell.btnCheckBox.tag = indexPath.row
        cell.btnCheckBox.addTarget(self, action: #selector(btnCheckBox), for: .touchUpInside)
        cell.lblProductName.text = ProductCategory[indexPath.row]
        if indexPath.row == 0{
            cell.btnCheckBox.isSelected = true
        }else{
            cell.btnCheckBox.isSelected = false
        }
        return cell
    }
    @objc func btnCheckBox(sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
