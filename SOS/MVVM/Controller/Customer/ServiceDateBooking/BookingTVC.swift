//
//  BookingTVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 04/04/23.
//

import UIKit

class BookingTVC: UITableViewCell {

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var collVwBooking: UICollectionView!
    
    var arrMorningTime = ["08:00 AM","09:00 AM","10:00 AM","11:00 AM"]
    var arrEveningTime = ["12:30PM","12:30PM","02:30PM","04:00PM"]
    var type = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        uiSet()
    }
    func uiSet(){
        collVwBooking.delegate = self
        collVwBooking.dataSource = self
        collVwBooking.reloadData()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension BookingTVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellBooking = collectionView.dequeueReusableCell(withReuseIdentifier: "BookingCVC", for: indexPath) as! BookingCVC
        if type == 0{
            cellBooking.lblTime.text = arrMorningTime[indexPath.row]
        }else{
            cellBooking.lblTime.text = arrEveningTime[indexPath.row]
        }
       
        return cellBooking
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwBooking.frame.size.width/2 - 10, height: 100)
    }
}
