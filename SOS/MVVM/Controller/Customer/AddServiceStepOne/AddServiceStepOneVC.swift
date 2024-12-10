//
//  AddServiceStepOneVC.swift
//  SOS
//
//  Created by meet sharma on 23/03/23.
//

import UIKit
struct ServiceData{
    var title:String?
    var btnTitle:String?
}
class AddServiceStepOneVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tblVwAddService: UITableView!
    //MARK: - Variables
    var arrService = [ServiceData]()
    override func viewDidLoad() {
        super.viewDidLoad()

      uiSet()
    }
    
    func uiSet(){
        tblVwAddService.estimatedRowHeight = 50
        tblVwAddService.rowHeight = UITableView.automaticDimension
        arrService.append(ServiceData(title: "New Service",btnTitle: "Add Service"))
        arrService.append(ServiceData(title: "New Combined Service",btnTitle: "Add Combined Service"))
        tblVwAddService.reloadData()
    }
    @IBAction func btnAddService(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddServiceStepTwoVC") as! AddServiceStepTwoVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    @IBAction func actionCancel(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
//MARK: - TableViewDelegate
extension AddServiceStepOneVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrService.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddServiceTVC", for: indexPath) as! AddServiceTVC
        cell.lblTitle.text = arrService[indexPath.row].title ?? ""
        cell.btnAddService.setTitle(arrService[indexPath.row].btnTitle ?? "", for: .normal)
        if indexPath.row == 0{
            cell.widthbtnService.constant = 100
        }else{
            cell.widthbtnService.constant = 140
        }
        return cell
    }
    
    
}
