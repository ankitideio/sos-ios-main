//
//  EditServiceVC.swift
//  SOS
//
//  Created by meet sharma on 27/03/23.
//

import UIKit

class EditServiceVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tblVwEditService: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        
    }
    //MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
    }
    @IBAction func actionAddNewService(_ sender: UIButton) {
    }
    }
// MARK: - TableviewDelegates
extension EditServiceVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EditServiceTVC", for: indexPath) as! EditServiceTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
