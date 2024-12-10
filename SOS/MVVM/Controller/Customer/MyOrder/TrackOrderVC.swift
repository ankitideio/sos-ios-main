//
//  TrackOrderVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 10/04/23.
//

import UIKit

class TrackOrderVC: UIViewController {

    @IBOutlet weak var lblTTitle: UILabel!
    @IBOutlet weak var btnCompleteOrder: UIButton!
    @IBOutlet weak var btnOngoing: UIButton!
    
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        if isComing == true{
            lblTTitle.text = "TrackOrder"
        }else{
            lblTTitle.text = "Update Status"
        }
    }
    // MARK: - ButtonActions
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionOngoing(_ sender: UIButton) {
            btnOngoing.setTitleColor(.white, for: .normal)
            btnOngoing.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        btnCompleteOrder.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
        btnCompleteOrder.borderWid = 1
        btnCompleteOrder.backgroundColor = .white
        btnCompleteOrder.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            btnOngoing.isSelected = true
        btnCompleteOrder.isSelected = false
    }
    
    @IBAction func actionCompleteOrder(_ sender: UIButton) {
        btnCompleteOrder.setTitleColor(.white, for: .normal)
        btnCompleteOrder.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        btnOngoing.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
        btnOngoing.backgroundColor = .white
        btnOngoing.isSelected = false
        btnCompleteOrder.isSelected = true
        btnOngoing.borderWid = 1
        btnOngoing.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
 
    }
}
