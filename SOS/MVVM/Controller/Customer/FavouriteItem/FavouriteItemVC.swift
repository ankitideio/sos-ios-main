//
//  FavouriteItemVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/03/23.
//

import UIKit

class FavouriteItemVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var tblVwFav: UITableView!
    @IBOutlet weak var collVwFavourite: UICollectionView!
    @IBOutlet weak var btnProduct: UIButton!
    @IBOutlet weak var btnService: UIButton!
    // MARK: - Vaiables
    var getFavouriteViewModel = FavouriteProductsVM()
    var arrGetFavProducts = [GetFavouriteModel]()
    var arrFavourite = [Favourite]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet(isSelect: 0)
    }
    func uiSet(isSelect:Int){
        
        if isSelect == 0 {
            collVwFavourite.isHidden = true
            tblVwFav.isHidden = false
            let nib = UINib(nibName: "UserInfoTVC", bundle: nil)
            tblVwFav?.register(nib, forCellReuseIdentifier: "UserInfoTVC")
            tblVwFav.reloadData()
        }else{
            collVwFavourite.isHidden = false
            tblVwFav.isHidden = true
            let nib = UINib(nibName: "FavouriteProductsCVC", bundle: nil)
            collVwFavourite?.register(nib, forCellWithReuseIdentifier: "FavouriteProductsCVC")
        }
    }
    func getfavApi(){
        getFavouriteViewModel.getFavouriteApi{ data in
            self.arrFavourite = data.favourite
            self.collVwFavourite.reloadData()
            self.uiSet(isSelect: 1)
        }
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionService(_ sender: UIButton) {
        if sender.tag == 0{
            btnService.setTitleColor(.white, for: .normal)
            btnService.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            btnProduct.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
            btnProduct.borderWid = 1
            btnProduct.backgroundColor = .white
            btnProduct.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            btnService.isSelected = true
            btnProduct.isSelected = false
            collVwFavourite.isHidden = true
            tblVwFav.isHidden = false
            uiSet(isSelect: 0)
        }else{
            btnProduct.setTitleColor(.white, for: .normal)
            btnProduct.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            btnService.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
            btnService.backgroundColor = .white
            btnService.isSelected = false
            btnProduct.isSelected = true
            btnService.borderWid = 1
            collVwFavourite.isHidden = false
            tblVwFav.isHidden = true
            btnService.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
            getfavApi()
           
        }
    }
}
// MARK: - CollectionViewDelegate
extension FavouriteItemVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if arrFavourite.count > 0{
            return arrFavourite.count
        }else{
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteProductsCVC", for: indexPath) as! FavouriteProductsCVC
        cell.lblProductName.text = arrFavourite[indexPath.row].productID.productName
        cell.lblPrice.text = "$\(arrFavourite[indexPath.row].productID.price)"
        cell.lblDiscount.text =  "-\(arrFavourite[indexPath.row].productID.discountPrice)%"
        cell.imgVwProduct.imageLoad(imageUrl: arrFavourite[indexPath.row].productID.productThumbnail)
        cell.contentView.borderWidth = 1
        cell.contentView.borderColor = UIColor(red: 0.896, green: 0.896, blue: 0.896, alpha: 1)
        cell.btnFavourite.isSelected = true
        cell.btnFavourite.tag = indexPath.row
        cell.btnFavourite.addTarget(self, action: #selector(removeFavourite), for: .touchUpInside)
        cell.layer.shadowColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 0.33).cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 4.2)
        cell.layer.shadowRadius = 11.2
        cell.layer.shadowOpacity = 1
        cell.layer.masksToBounds = false
       
        return cell
    }
    @objc func removeFavourite(sender: UIButton){
        sender.isSelected = !sender.isSelected
            getFavouriteViewModel.deletefavouriteByProducttIdApi(productid: arrFavourite[sender.tag].productID.id){
                self.collVwFavourite.reloadData()
                self.getfavApi()
                self.uiSet(isSelect: 1)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collVwFavourite.frame.size.width/2.1-0, height: 220)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
            return UIEdgeInsets(top: 15, left: 2, bottom: 15, right: 2)
        }
}
// MARK: - UITableViewDelegate
extension FavouriteItemVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTVC", for: indexPath) as! UserInfoTVC
        cell.btnViewMore.tag = indexPath.row
        cell.btnViewMore.addTarget(self, action: #selector(viewMore), for: .touchUpInside)
        cell.btnBookNow.tag = indexPath.row
        cell.btnBookNow.addTarget(self, action: #selector(BookNow), for: .touchUpInside)
        return cell
    }
    @objc func viewMore(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceDetailVC") as! ServiceDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func BookNow(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FindServiceVC") as! FindServiceVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
