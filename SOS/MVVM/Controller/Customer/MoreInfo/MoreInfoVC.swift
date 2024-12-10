//
//  MoreInfoVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 05/04/23.
//

import UIKit

class MoreInfoVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwMoreInfo: UITableView!
    
    // MARK: - Variables
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - BUttonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
}
// MARK: - UITableViewDelegate
extension MoreInfoVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMoreInfo = tableView.dequeueReusableCell(withIdentifier: "MoreInfo2TVC", for: indexPath) as! MoreInfo2TVC
        return cellMoreInfo
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
        
    }
    
}
