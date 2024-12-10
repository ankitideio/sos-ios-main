//
//  MyAccountServicesVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 12/04/23.
//

import UIKit

class MyAccountServicesVC: UIViewController {
    @IBOutlet weak var tblVwServices: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVwServices.register(UINib(nibName: "MyServiceTVC", bundle: nil), forCellReuseIdentifier: "MyServiceTVC")
        
    }
        // MARK: - Navigation
}
extension MyAccountServicesVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyServiceTVC", for: indexPath) as! MyServiceTVC
        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(actionEdit), for: .touchUpInside)
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(actionDelete), for: .touchUpInside)
        return cell
    }
    @objc func actionEdit(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditServiceBusinessVC") as! EditServiceBusinessVC
                self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func actionDelete(sender: UIButton){
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceDetailVC") as! ServiceDetailVC
                self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
