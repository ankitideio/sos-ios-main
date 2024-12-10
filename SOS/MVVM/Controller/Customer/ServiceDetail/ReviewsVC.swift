//
//  ReviewsVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 07/04/23.
//

import UIKit

class ReviewsVC: UIViewController {

    @IBOutlet weak var tblVwReviews: UITableView!
    @IBOutlet weak var progressVw1: UIProgressView!
    @IBOutlet weak var progressVw2: UIProgressView!
    @IBOutlet weak var progressVw3: UIProgressView!
    @IBOutlet weak var progressVw4: UIProgressView!
    @IBOutlet weak var progressVw5: UIProgressView!
    @IBOutlet weak var lblPercent1: UILabel!
    @IBOutlet weak var lblPercent2: UILabel!
    @IBOutlet weak var lblPercent3: UILabel!
    @IBOutlet weak var lblPercent5: UILabel!
    @IBOutlet weak var lblPercent4: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         uiSet()
    }
    func uiSet(){
        
        let nib = UINib(nibName: "ReviewsTVC", bundle: nil)
        tblVwReviews.register(nib, forCellReuseIdentifier: "ReviewsTVC")
    }
    // MARK: - BUttonActions
    @IBAction func actionReadMore(_ sender: UIButton) {
    }
    
    // MARK: - UITableViewDelegate
}
extension ReviewsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTVC", for: indexPath) as! ReviewsTVC
        if indexPath.row == 0{
            cell.vwHeight.constant = 295
        } else{
            cell.imgVwHideShow.isHidden =  true
            cell.vwHeight.constant = 240
            cell.contentView.frame = CGRect(x: 0, y: 0, width: cell.contentView.frame.width, height: 295)
              
               
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 280
        }else{
            return 200
        }
    }
}
