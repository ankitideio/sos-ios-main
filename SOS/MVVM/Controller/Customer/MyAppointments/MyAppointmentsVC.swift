//
//  MyAppointmentsVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import UIKit

class MyAppointmentsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwAppoitment: UITableView!
    @IBOutlet weak var btnAppoitments: UIButton!
    @IBOutlet weak var btnCompleteAppoitments: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAppoitments.isSelected = true
        btnCompleteAppoitments.isSelected = false
    }
    // MARK: - ButtonActions
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionCompleteAppointments(_ sender: UIButton) {
        
            self.btnCompleteAppoitments.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
            self.btnAppoitments.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            self.btnAppoitments.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
            self.btnCompleteAppoitments.setTitleColor(.white, for: .normal)
        self.btnAppoitments.setTitleColor(#colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1), for: .normal)
        self.btnAppoitments.borderWid = 1
        self.btnAppoitments.borderColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        btnAppoitments.isSelected = false
        btnCompleteAppoitments.isSelected = true
        tblVwAppoitment.reloadData()
    }
    @IBAction func actionMyAppointments(_ sender: UIButton) {
             self.btnAppoitments.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
             self.btnCompleteAppoitments.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
             self.btnCompleteAppoitments.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
             self.btnAppoitments.setTitleColor(.white, for: .normal)
        self.btnCompleteAppoitments.setTitleColor(#colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1), for: .normal)
        self.btnCompleteAppoitments.borderWid = 1
        self.btnCompleteAppoitments.borderColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        btnAppoitments.isSelected = true
        btnCompleteAppoitments.isSelected = false
        tblVwAppoitment.reloadData()
    }
}
// MARK: - UITableViewDelegate
extension MyAppointmentsVC: UITableViewDelegate,UITableViewDataSource{
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAppointment = tableView.dequeueReusableCell(withIdentifier: "MyAppoitmentTVC", for: indexPath) as! MyAppoitmentTVC
        cellAppointment.selectionStyle = .none
        cellAppointment.btnRating.tag = indexPath.row
        cellAppointment.btnRating.addTarget(self, action: #selector(GiveRating), for: .touchUpInside)
        if btnAppoitments.isSelected == true{
        
            cellAppointment.btnRating.isHidden = true
           
        } else{
            cellAppointment.btnRating.isHidden = false
            
        }
        return cellAppointment
    }
    @objc func GiveRating(sender: UIButton){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddRatingVC") as! AddRatingVC
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if btnAppoitments.isSelected == true{
            return 275
        }else{
            return 340
        }
       
    }
    
}
