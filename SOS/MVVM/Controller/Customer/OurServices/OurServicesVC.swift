//
//  OurServicesVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 13/04/23.
//

import UIKit

class OurServicesVC: UIViewController {
    // MARK: - VAriables
    var arrImg = ["Rectangle 11","Rectangle 30","Rectangle 11","Rectangle 30","Rectangle 11","Rectangle 30","Rectangle 11","Rectangle 30","Rectangle 11","Rectangle 30",]
    var arrName = ["Braids","Natural Hair","Braids","Natural Hair","Braids","Natural Hair","Braids","Natural Hair","Braids","Natural Hair",]
    @IBOutlet weak var collVwOurServices: UICollectionView!
    
    var arrServ = [OurService]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - ActionButton
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
// MARK: - UICollectionViewDelegate
extension OurServicesVC:
    UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrServ.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellService = collectionView.dequeueReusableCell(withReuseIdentifier: "OurServicesCVC", for: indexPath) as! OurServicesCVC
        if arrServ[indexPath.row].serviceImages.count > 0{
            cellService.imgVwService.imageLoad(imageUrl: arrServ[indexPath.row].serviceImages[0])
        }
        cellService.lblServiceName.text = arrServ[indexPath.row].serviceName
        cellService.lblDescription.text = arrServ[indexPath.row].description
        return cellService
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceDetailVC") as! ServiceDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwOurServices.frame.width/2-5, height: 230)
    }
}
