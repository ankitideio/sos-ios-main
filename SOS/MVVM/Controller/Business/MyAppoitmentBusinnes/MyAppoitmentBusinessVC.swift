//
//  MyAppoitmentBusinessVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 10/04/23.
//

import UIKit

class MyAppoitmentBusinessVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var btnCompleteAppopintment: UIButton!
    @IBOutlet weak var btnMyAppoitment: UIButton!
    @IBOutlet weak var tblVwAppoitmentBusiness: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        tblVwAppoitmentBusiness.register(UINib(nibName: "AppoitmentTVC", bundle: nil), forCellReuseIdentifier: "AppoitmentTVC")
    }
    // MARK: - BUttonAction
    @IBAction func actionCompleteAppointment(_ sender: UIButton) {
        self.btnCompleteAppopintment.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        self.btnMyAppoitment.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        self.btnMyAppoitment.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
        self.btnCompleteAppopintment.setTitleColor(.white, for: .normal)
    self.btnMyAppoitment.setTitleColor(#colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1), for: .normal)
    self.btnMyAppoitment.borderWid = 1
    self.btnMyAppoitment.borderColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        btnMyAppoitment.isSelected = false
        btnCompleteAppopintment.isSelected = true
        btnMyAppoitment.backgroundColor = .clear
        tblVwAppoitmentBusiness.reloadData()
        
    }
    @IBAction func actionAppointment(_ sender: UIButton) {
        self.btnMyAppoitment.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        self.btnCompleteAppopintment.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        self.btnCompleteAppopintment.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
        self.btnMyAppoitment.setTitleColor(.white, for: .normal)
   self.btnCompleteAppopintment.setTitleColor(#colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1), for: .normal)
   self.btnCompleteAppopintment.borderWid = 1
   self.btnCompleteAppopintment.borderColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        btnCompleteAppopintment.backgroundColor = .clear
        btnMyAppoitment.isSelected = true
        btnCompleteAppopintment.isSelected = false
        tblVwAppoitmentBusiness.reloadData()
       
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension MyAppoitmentBusinessVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppoitmentTVC", for: indexPath) as! AppoitmentTVC
        cell.btnReject.tag = indexPath.row
        cell.btnAccept.tag = indexPath.row
        cell.btnReject.setTitle("Reject", for: .normal)
        cell.btnAccept.setTitle("Accept", for: .normal)
        if btnCompleteAppopintment.isSelected == true{
            cell.btnAccept.isHidden = true
            cell.widthStackVw.constant = 160
            cell.btnReject.setTitle("View Rating", for: .normal)
            cell.btnReject.addTarget(self, action: #selector(ViewServiceRating), for: .touchUpInside)
            cell.btnReject.backgroundColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
            cell.btnReject.setTitleColor(.white, for: .normal)
            cell.btnReject.borderColor = .clear
            cell.btnReject.translatesAutoresizingMaskIntoConstraints = false
            cell.btnReject.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
            cell.btnReject.heightAnchor.constraint(equalToConstant: 23.0).isActive = true
            
        } else{
            cell.btnAccept.isHidden = false
            cell.widthStackVw.constant = CGFloat(self.view.frame.width-40)
            cell.btnAccept.setTitle("Accept", for: .normal)
            cell.btnReject.borderWid = 1
            cell.btnReject.borderColor = UIColor(red: 0.954, green: 0.282, blue: 0.282, alpha: 1)
            cell.btnReject.backgroundColor = .white
            cell.btnReject.setTitleColor(UIColor(red: 0.954, green: 0.282, blue: 0.282, alpha: 1), for: .normal)
        }
        return cell
    }
    @objc func ViewServiceRating(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewServiceRatingVC") as! ViewServiceRatingVC
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
}
