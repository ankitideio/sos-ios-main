//
//  MoreInfoServiceVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 03/04/23.
//

import UIKit

class MoreInfoServiceVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwMoreInfo: UITableView!
    @IBOutlet weak var collVwReview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
}
// MARK: - CollectionViewDelegate
extension MoreInfoServiceVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellMoreInfoReview = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreInfoReviewCVC", for: indexPath) as! MoreInfoReviewCVC
        return cellMoreInfoReview
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwReview.frame.size.width/2, height: 65)
    }
    
}
// MARK: - TableViewDelegate
extension MoreInfoServiceVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoreInfoTVC", for: indexPath) as! MoreInfoServiceTVC
        if indexPath.row == 2{
            cell.vwSeprator.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
}
