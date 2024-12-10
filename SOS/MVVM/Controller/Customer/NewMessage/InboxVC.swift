//
//  InboxVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 30/03/23.
//

import UIKit

class InboxVC: UIViewController{
    // MARK: - Outlets
    @IBOutlet weak var tblVwInbox: UITableView!
    
    // MARK: - Variables
    var isComing = false
    var arrInbox = ["Sent All","Offerings ","Unread","Spam","Recycling bin"]
    var arrRecycleBin = ["Mark Unread","Mark Read","Mark as SpamArchive","Label"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    }
// MARK: - UITableViewDelegate
extension InboxVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isComing == true{
            return arrInbox.count
        } else{
            return arrRecycleBin.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isComing == true{
            let cell = tableView.dequeueReusableCell(withIdentifier: "InboxTVC", for: indexPath) as! InboxTVC
            cell.lblInbox.text = arrInbox[indexPath.row]
            cell.btnCheckbox.addTarget(self, action: #selector(Checkbox), for: .touchUpInside)
            return cell
        }else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "InboxTVC", for: indexPath) as! InboxTVC
            cell2.lblInbox.text = arrRecycleBin[indexPath.row]
            cell2.btnCheckbox.addTarget(self, action: #selector(Checkbox), for: .touchUpInside)
            return cell2
        }
    }
    @objc func Checkbox(sender: UIButton){
        sender.isSelected = !sender.isSelected
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 25

    }
    
}
