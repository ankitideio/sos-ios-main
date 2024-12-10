//
//  DateBookingVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 04/04/23.
//

import UIKit



class DateBookingVC: UIViewController{
    // MARK: - Outlets

    @IBOutlet weak var tblBooking: UITableView!
        var arrTiming = ["Morning","Afternoon","Evening"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension DateBookingVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDateBooking = tableView.dequeueReusableCell(withIdentifier: "BookingTVC", for: indexPath) as! BookingTVC
        cellDateBooking.lblHeader.text = arrTiming[indexPath.row]
        cellDateBooking.type = indexPath.row
        cellDateBooking.uiSet()
        return cellDateBooking
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
}
