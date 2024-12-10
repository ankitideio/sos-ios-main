//
//  MoreInfoTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 03/04/23.
//

import UIKit
import AlignedCollectionViewFlowLayout

class MoreInfoServiceTVC: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var vwSeprator: UIView!
    @IBOutlet weak var collVwInsideTbl: UICollectionView!
    
    // MARK: - Variables
    var arrSection1 = ["CREATIVE", "LISTENS", "ON TIME", "PERSONABLE", "PROFESSIONAL","RESPONSIVE", "THOROUGH"]
    var arrSection2 = ["CREATIVE", "LISTENS", "ON TIME"]
    var arrHeader = ["About Shakita Byrd:", "Shakita Byrd's Location:"]
    override func awakeFromNib() {
        super.awakeFromNib()
       
         collVwInsideTbl.delegate = self
        collVwInsideTbl.dataSource = self
       
        let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left)
        let collectionView = UICollectionView(frame: bounds, collectionViewLayout: alignedFlowLayout)
        alignedFlowLayout.estimatedItemSize = CGSize(width: 60, height: 20)
        alignedFlowLayout.minimumInteritemSpacing = -20
        collVwInsideTbl.collectionViewLayout = alignedFlowLayout
        
//        collVwFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
// MARK: - CollectionViewDelegate
extension MoreInfoServiceTVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return arrSection1.count
        } else{
            return arrSection2.count
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collVwInsideTbl.frame.size.width, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSectionCVC", for: indexPath) as! HeaderSectionCVC
        headerView.lblHeader.text = arrHeader[indexPath.section]
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreInfoAboutLocationCVC", for: indexPath) as! MoreInfoAboutLocationCVC
        if indexPath.row == 3{
            
        }
        if indexPath.section == 0{
            cell.lblName.text = arrSection1[indexPath.row]
            return cell
        }else{
            cell.lblName.text = arrSection2[indexPath.row]
            return cell
        }
    }
    
}
