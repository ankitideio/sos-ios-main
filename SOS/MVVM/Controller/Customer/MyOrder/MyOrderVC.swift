//
//  MyOrderVC.swift
//  SOS
//
//  Created by meet sharma on 21/03/23.
//

import UIKit

class MyOrderVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var btnOngoing: UIButton!
    @IBOutlet weak var btnComplete: UIButton!
    @IBOutlet weak var clsnVwMyOrder: UICollectionView!
    
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()

       uiSet()
    }
    func uiSet(){
        let nib = UINib(nibName: "MyOrderCVC", bundle: nil)
        clsnVwMyOrder.register(nib, forCellWithReuseIdentifier: "MyOrderCVC")
       
    }
    //MARK: - ButtonAction
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionOngoingComplete(_ sender: UIButton) {
        if sender.tag == 0{
            btnOngoing.setTitleColor(.white, for: .normal)
            btnOngoing.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            btnComplete.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
            btnComplete.borderWid = 1
            btnComplete.backgroundColor = .white
            btnComplete.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            btnOngoing.isSelected = true
            btnComplete.isSelected = false
            btnComplete.backgroundColor = .clear
            clsnVwMyOrder.reloadData()
        }else{
            btnComplete.setTitleColor(.white, for: .normal)
            btnComplete.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            btnOngoing.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
            btnOngoing.backgroundColor = .white
            btnOngoing.isSelected = false
            btnComplete.isSelected = true
            btnOngoing.backgroundColor = .clear
            btnOngoing.borderWid = 1
            btnOngoing.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            clsnVwMyOrder.reloadData()
        }
    }
}
//MARK: - UICollectionViewDelegate
extension MyOrderVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyOrderCVC", for: indexPath) as! MyOrderCVC
        
        if isComing == true{
            if btnOngoing.isSelected == true{
                isComing = true
                cell.tralingTrackBtn.constant = 40
                cell.btnTrackOrder.setTitle("Track Order", for: .normal)
            }else{
                cell.tralingTrackBtn.constant = 10
                cell.btnTrackOrder.setTitle("Add Rating And Review", for: .normal)
            }}else{
                if btnOngoing.isSelected == true{
                    cell.tralingTrackBtn.constant = 40
                    cell.btnTrackOrder.setTitle("update status", for: .normal)
                
                }else{
                    cell.tralingTrackBtn.constant = 10
                    cell.btnTrackOrder.setTitle("View rating", for: .normal)
                    cell.tralingTrackBtn.constant = 7
                }
            }
        cell.btnTrackOrder.tag = indexPath.row
        cell.btnTrackOrder.addTarget(self, action: #selector(trackOrderAndProductRating), for: .touchUpInside)

        return cell
    }
    @objc func trackOrderAndProductRating(sender:UIButton){
        if isComing == true{
            if btnOngoing.isSelected == true{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TrackOrderVC") as! TrackOrderVC
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddProductRAtingVC") as! AddProductRAtingVC
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: false)
            }
        }else{
            if btnOngoing.isSelected == true{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "TrackOrderVC") as! TrackOrderVC
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewProductRatingVC") as! ViewProductRatingVC
                vc.modalPresentationStyle = .overFullScreen
                self.present(vc, animated: false)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: clsnVwMyOrder.frame.width/2-5, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
