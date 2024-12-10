//
//  SeeTimesVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 07/04/23.
//

import UIKit

class SeeTimesVC: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var tblVwSeeTimes: UITableView!
    
    var arrTiming = ["Morning","Afternoon"]
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    // MARK: - BttonActions
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionNotify(_ sender: UIButton) {
    }
    @IBAction func actionBookNow(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PaymentVC") as! PaymentVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

 
}
// MARK: - UITableViewDelegate
extension SeeTimesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTiming.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimingTVC", for: indexPath) as! TimingTVC
        cell.lblTiming.text = arrTiming[indexPath.row]
        cell.type = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
}
