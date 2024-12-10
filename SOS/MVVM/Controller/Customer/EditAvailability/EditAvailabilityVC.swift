//
//  EditAvailabilityVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 27/03/23.
//

import UIKit

class EditAvailabilityVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var txtFldTimeAM: UITextField!
    @IBOutlet weak var txtFldTimePM: UITextField!
    @IBOutlet weak var txtFldTimeZone: UITextField!
    @IBOutlet weak var tblVwEditAvailability: UITableView!
    
    var daysName = ["Tuesday","Wednesday","Thursday","Friday","Saturday"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // MARK: - ButtonAction
    @IBAction func actionTimePM(_ sender: UIButton) {
    }
    @IBAction func actionTimeAM(_ sender: UIButton) {
    }
    @IBAction func actionTimezone(_ sender: UIButton) {
    }
    @IBAction func actionSave(_ sender: UIButton) {
    }
    @IBAction func actionCancel(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
// MARK: - TableViewDelegate
extension EditAvailabilityVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditAvailabilityTVC", for: indexPath) as! EditAvailabilityTVC
        cell.lblDays.text = daysName[indexPath.row]
        cell.switchDays.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
}
