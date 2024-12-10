//
//  FilterVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 05/04/23.
//

import UIKit

class FilterVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var vwDown: UIView!
    @IBOutlet weak var tblVwFilter: UITableView!
    @IBOutlet weak var vwHeight: NSLayoutConstraint!
    var arrImgs = ["searchIcon","filerMarker","Vector25 28","Vector25 28"]
    var arrNames = ["Natural Hair","Atlanta, GA","Atlanta, GA","Best Match"]
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    
    }
    func uiSet(){
     
        vwDown.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        vwDown.layer.shadowOpacity = 1
        vwDown.layer.shadowRadius = 75
        vwDown.layer.shadowOffset = CGSize(width: 0, height: 38)
    }
    // MARK: - ButtonAction
    @IBAction func actionSearch(_ sender: UIButton) {
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
   
}
extension FilterVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  arrNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellFilter = tableView.dequeueReusableCell(withIdentifier: "FilterTVC", for: indexPath) as! FilterTVC
        cellFilter.lblNames.text = arrNames[indexPath.row]
        cellFilter.imgVwFilter.image = UIImage(named: arrImgs[indexPath.row])
        return cellFilter
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
