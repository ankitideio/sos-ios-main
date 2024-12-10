//
//  SeeTemplatesVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 08/04/23.
//

import UIKit

class SeeTemplatesVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var btnAddOwnService: UIButton!
    @IBOutlet weak var btnService: UIButton!
    @IBOutlet weak var tblVwServicePrice: UITableView!
    
    var arrService = ["Consultation","Men's Cut","All Over Color"," Kid's Cut","Bang Trim","Beard Trim"," Deep Conditioning Treatment"," Women's Cut","Line Up","Toner"]
    var arrPrice = ["$10.00"," $35.00","$80.00","$25.00","$10.00","$15.00","$30.00","$40.00","$15.00"," $35.00",]
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionServices(_ sender: UIButton) {
        btnService.setTitleColor(.white, for: .normal)
        btnService.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        btnAddOwnService.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
        btnAddOwnService.borderWid = 1
        btnAddOwnService.backgroundColor = .white
        btnAddOwnService.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
           
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PowerBookingVC") as! PowerBookingVC
       
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func actionAddService(_ sender: UIButton) {
        btnAddOwnService.setTitleColor(.white, for: .normal)
        btnAddOwnService.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        btnService.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
        btnService.backgroundColor = .white
        btnService.borderWid = 1
        btnService.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddOwnServicesVC") as! AddOwnServicesVC
      
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionProfession(_ sender: UIButton) {
    }
    @IBAction func actionSpecility(_ sender: UIButton) {
    }
    
}
// MARK: - UITableViewDelegate
extension SeeTemplatesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicePriceTVC", for: indexPath) as! ServicePriceTVC
        cell.lblPrice.text = arrPrice[indexPath.row]
        cell.lblService.text = arrService[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
}
