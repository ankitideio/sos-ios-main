//
//  FindServiceVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 21/03/23.
//

import UIKit

class FindServiceVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwUserInfo: UITableView!
     
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        tblVwUserInfo.register(UINib(nibName: "UserInfoTVC", bundle: nil), forCellReuseIdentifier: "UserInfoTVC")
    }
    // MARK: - ButtonAction
    @IBAction func actionFilter(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FilterVC") as! FilterVC
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    @IBAction func actionBack(_ sender: UIButton) {
        SceneDelegate().setHomeRoot()
    }
}
//MARK: - TableViewDelegate
extension FindServiceVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTVC", for: indexPath) as! UserInfoTVC
        cell.btnLike.isHidden = true
        cell.btnBookNow.tag = indexPath.row
        cell.btnBookNow.addTarget(self, action: #selector(bookNow), for: .touchUpInside)
        cell.btnViewMore.tag = indexPath.row
        cell.btnViewMore.addTarget(self, action: #selector(viewMore), for: .touchUpInside)
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    // MARK: - ButtonActionInsideTableview
    @objc func bookNow(sender: UIButton){
        let cell = tblVwUserInfo.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! UserInfoTVC
        cell.btnBookNow.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        cell.btnViewMore.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        cell.btnViewMore.setTitleColor(UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1), for: .normal)
        cell.btnBookNow.setTitleColor(.white, for: .normal)
    
    }
    @objc func viewMore(sender: UIButton){
       
        let cell = tblVwUserInfo.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! UserInfoTVC
        cell.btnViewMore.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        cell.btnBookNow.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        cell.btnBookNow.setTitleColor(UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1), for: .normal)
        cell.btnViewMore.setTitleColor(.white, for: .normal)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceDetailVC") as! ServiceDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
   }
}

