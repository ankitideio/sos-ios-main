//
//  PowerBookingVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 08/04/23.
//

import UIKit

class PowerBookingVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwDuration: UITableView!
    @IBOutlet weak var btnDeleteService: UIButton!
    @IBOutlet weak var btnSaveChanges: UIButton!
    @IBOutlet weak var vwTablevwHeight: NSLayoutConstraint!
    var arrTitle = ["Initial","Processing","Finishing","Clean Up"]
    var isSelect = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionDuration(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
            vwTablevwHeight.constant = 0
        }else{
            vwTablevwHeight.constant = 510
        }
    }
    @IBAction func actionSaveChanges(_ sender: UIButton) {
    }
    @IBAction func actionDelete(_ sender: UIButton) {
    }
}
extension PowerBookingVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DurationTVC", for: indexPath) as! DurationTVC
        cell.lblTitle.text = arrTitle[indexPath.row]
        cell.txtFldTitle.placeholder = arrTitle[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
}
