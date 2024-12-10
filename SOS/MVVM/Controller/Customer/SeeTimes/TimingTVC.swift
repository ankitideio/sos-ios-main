//
//  TimingTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 07/04/23.
//

import UIKit

class TimingTVC: UITableViewCell {

    @IBOutlet weak var lblTiming: UILabel!
    @IBOutlet weak var collVwTiming: UICollectionView!
    
    var arrMorningTime = ["08:00 AM","09:00 AM","10:00 AM","11:00 AM",]
    var arrAfternoonTime = ["12:30 PM","1:30 PM","2:30 PM","3:00 PM",]
    var type = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        collVwTiming.delegate =  self
        collVwTiming.dataSource =  self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
extension TimingTVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimingCVC", for: indexPath) as! TimingCVC
        
        if type == 0{
            cell.lblTime.text = arrMorningTime[indexPath.row]
        }else{
            if indexPath.row == 0{
                cell.lblTime.text = arrAfternoonTime[indexPath.row]
                cell.lblTime.textColor = .white
                cell.vwTime.backgroundColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
              
            }else{
                cell.lblTime.text = arrAfternoonTime[indexPath.row]
                cell.vwTime.backgroundColor = .white
                cell.vwTime.borderWidth = 1
                cell.vwTime.borderColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
            }
            
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwTiming.frame.size.width/2-5, height: 75)
    }
}
