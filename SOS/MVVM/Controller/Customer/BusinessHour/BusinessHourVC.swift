//
//  BusinessHourVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 12/04/23.
//

import UIKit

class BusinessHourVC: UIViewController {
    // MARK: - variables
var arrDays = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday",]
    var arrTiming = [" 9:00 AM to 9:00 PM"," 9:00 AM to 9:00 PM"," 9:00 AM to 9:00 PM"," 9:00 AM to 9:00 PM"," 9:00 AM to 9:00 PM"," 9:00 AM to 9:00 PM","Sunday Closed",]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func acctionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension BusinessHourVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDays.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinesHourTVC", for: indexPath) as! BusinesHourTVC
        cell.lblDays.text = arrDays[indexPath.row]
        cell.lblTiming.text = arrTiming[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
