//
//  allProductsVC.swift
//  SOS
//
//  Created by meet sharma on 22/03/23.
//

import UIKit

class allProductsVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var clsnVwServices: UICollectionView!
    @IBOutlet weak var lblHeader: UILabel!
    //MARK: - Variables
    var isComing = false
    var arrProdu  = [OurProduct]()
    override func viewDidLoad() {
        super.viewDidLoad()
       uiSet()
    }
    func uiSet(){
            self.clsnVwServices.register(UINib(nibName: "MyProductCVC", bundle: nil), forCellWithReuseIdentifier: "MyProductCVC")
            self.lblHeader.text = "Our Products"
    }
    //MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - UICollectionViewDelegate
extension allProductsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return arrProdu.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyProductCVC", for: indexPath) as! MyProductCVC
        if arrProdu[indexPath.row].productImages.count > 0{
            cell.imgVwProduct.imageLoad(imageUrl: arrProdu[indexPath.row].productImages[0])
            
        }
        cell.lblProductName.text = arrProdu[indexPath.row].productName
        cell.lblPrice.text = "$\(arrProdu[indexPath.row].price)"
        cell.lblDiscount.text = "-\(arrProdu[indexPath.row].discountPrice)%"
        cell.lblDecription.text = arrProdu[indexPath.row].description
        cell.btnEdit.setTitle("Add To Cart", for: .normal)
        cell.btnEdit.setImage(UIImage(named: "addToCart"), for: .normal)
        cell.btnEdit.setTitleColor(.white, for: .normal)
        cell.btnEdit.backgroundColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
        cell.imgVwBtn.image = UIImage(named: "likeButton")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: clsnVwServices.frame.width/2 - 5, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
