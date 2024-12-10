//
//  MessageListingVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 12/04/23.
//

import UIKit

class MessageListingVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwMsgListing: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ButtonActions
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UITableViewDelegate
extension MessageListingVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageListingTVC", for: indexPath) as! MessageListingTVC
        cell.btnReply.tag = indexPath.row
        cell.btnReply.addTarget(self, action: #selector(messageReply), for: .touchUpInside)
        return cell
    }
    @objc func messageReply(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MessageVC") as! MessageVC
      
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
