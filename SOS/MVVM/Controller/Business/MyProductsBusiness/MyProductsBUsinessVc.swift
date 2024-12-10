//
//  MyProductsBUsinessVc.swift
//  SOS
//
//  Created by IDEIO SOFT on 10/04/23.
//

import UIKit

class MyProductsBUsinessVc: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwMyProductBusiness: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
uiSet()
    }
    func uiSet(){
        tblVwMyProductBusiness.register(UINib(nibName: "MyServiceTVC", bundle: nil),forCellReuseIdentifier: "MyServiceTVC")
    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
extension MyProductsBUsinessVc: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
      
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyServiceTVC", for: indexPath) as! MyServiceTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
