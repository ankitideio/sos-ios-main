//
//  MyAccountVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import UIKit

class MyAccountVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwMyAccount: UITableView!
    var arrAccount = [MyAccountDataModel]()
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
       
    func uiSet(){
        arrAccount.append(MyAccountDataModel(headerTitle: "",accountData: [MyAccountData(lblTitle: "Offers",imgIcon: "account1"), MyAccountData(lblTitle: "Payment Method",imgIcon: "account2"),MyAccountData(lblTitle: "Change Password",imgIcon: "password25"),MyAccountData(lblTitle: "Connect Facebook Account",imgIcon: "facebook_icon 225")]))
        arrAccount.append(MyAccountDataModel(headerTitle: "Support",accountData: [MyAccountData(lblTitle: "Help Center",imgIcon: "Isolation_Mode25"), MyAccountData(lblTitle: "Delete Account",imgIcon: "Isolation_Mode25 1")]))
        arrAccount.append(MyAccountDataModel(headerTitle: "Support",accountData: [MyAccountData(lblTitle: "Privacy Policy",imgIcon: "Isolation_Mode25"), MyAccountData(lblTitle: "Terms Of Service ",imgIcon: "Isolation_Mode25 1")]))
    }
    @IBAction func actionBAck(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension MyAccountVC: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrAccount.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrAccount[section].accountData?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMyAccount = tableView.dequeueReusableCell(withIdentifier: "MyAccountTVC", for: indexPath) as! MyAccountTVC
        cellMyAccount.lblTitle.text = arrAccount[indexPath.section].accountData?[indexPath.row].lblTitle
        cellMyAccount.imgVwIcons.image = UIImage(named: arrAccount[indexPath.section].accountData?[indexPath.row].imgIcon ?? "")
        cellMyAccount.type = indexPath.row
        return cellMyAccount
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "MyAccountHeaderVwTVC") as!  MyAccountHeaderVwTVC
        header.lblHeader.text = arrAccount[section].headerTitle ?? ""
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 30
        }
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            if indexPath.row == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourOfferVC") as! YourOfferVC
                vc.isSelect = 1
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.row == 1{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PaymentMethodVC") as! PaymentMethodVC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else if indexPath.row == 2{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else{
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
//                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        } else if indexPath.section == 1{
            if indexPath.row == 0{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HelpCenterVC") as! HelpCenterVC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeleteAccountVC") as! DeleteAccountVC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }else{
            if indexPath.row == 0{ let vc = self.storyboard?.instantiateViewController(withIdentifier: "PrivacyPOlicyVC") as! PrivacyPOlicyVC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TermOfServiceVC") as! TermOfServiceVC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    }
}
