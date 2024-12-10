//
//  ServicesVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 07/04/23.
//

import UIKit

class ServicesVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwServices: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        let nib = UINib(nibName: "ServicesTVC", bundle: nil)
        tblVwServices.register(nib, forCellReuseIdentifier: "ServicesTVC")
    }
}
// MARK: - UITableViewDelegate
extension ServicesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTVC", for: indexPath) as! ServicesTVC
        cell.btnMoreInfo.tag = indexPath.row
        cell.btnSeeTimes.tag = indexPath.row
        cell.btnMoreInfo.addTarget(self, action: #selector(actionMoreInfo), for: .touchUpInside)
        cell.btnSeeTimes.addTarget(self, action: #selector(actionSeeTimes), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // MARK: - ButtonActions
    @objc func actionMoreInfo(sender: UIButton){
        let cellMoreInfo = tblVwServices.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! ServicesTVC
        cellMoreInfo.btnMoreInfo.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        cellMoreInfo.btnSeeTimes.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        cellMoreInfo.btnSeeTimes.setTitleColor(UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1), for: .normal)
        cellMoreInfo.btnMoreInfo.setTitleColor(.white, for: .normal)
        let vc = storyboard?.instantiateViewController(withIdentifier: "MoreInfoVC") as! MoreInfoVC
        self.navigationController?.pushViewController(vc, animated: true)
        }
    @objc func actionSeeTimes(sender: UIButton){
        let cellSeeTimes = tblVwServices.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! ServicesTVC
        cellSeeTimes.btnSeeTimes.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
        cellSeeTimes.btnMoreInfo.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        cellSeeTimes.btnMoreInfo.setTitleColor(UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1), for: .normal)
        cellSeeTimes.btnSeeTimes.setTitleColor(.white, for: .normal)
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChooseDateVC") as! ChooseDateVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
