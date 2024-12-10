//
//  SavedCardVC.swift
//  SOS
//
//  Created by meet sharma on 20/03/23.
//

import UIKit

class SavedCardVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    @IBOutlet weak var txtFldSelectShipping: UITextField!
    @IBOutlet weak var txtFldExpiryDate: UITextField!
    @IBOutlet weak var txtFldCVV: UITextField!
    @IBOutlet weak var txtFldCardNumber: UITextField!
    @IBOutlet weak var tblVwSavedCard: UITableView!
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()

       uiSet()
    }
    func uiSet(){
        heightTblVw.constant = CGFloat(185*2)
    }
    //MARK: - ButtonAction
    @IBAction func actionAddNewCard(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewCardVC") as! AddNewCardVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func actionAddCard(_ sender: UIButton) {
    }
    
    @IBAction func actionSelectDate(_ sender: UIButton) {
    }
    
    @IBAction func actionSelectYear(_ sender: UIButton) {
    }
}


extension SavedCardVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 185
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SavedCardTVC", for: indexPath) as! SavedCardTVC
        if indexPath.row == 1{
            cell.vwBackground.backgroundColor = UIColor(red: 0.984, green: 0.961, blue: 0.937, alpha: 1)
            cell.lblName.textColor = .black
            cell.lblCardNumber.textColor = .black
            cell.lblExpiryDate.textColor = .black
            cell.lblExpiry.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
            cell.lblCardHolder.textColor = UIColor(red: 0.708, green: 0.708, blue: 0.708, alpha: 1)
            cell.btnDelete.setImage(UIImage(named: "yellowDelete"), for: .normal)
            cell.imgVwCard.image = UIImage(named: "card")
            cell.imgVwBackground.image = UIImage(named: "cardBg")
        }
        return cell
    }
    
    
}
