//
//  MainHomeVC.swift
//  SOS
//
//  Created by meet sharma on 17/03/23.
//

import UIKit

class MainHomeVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var collVwProduct: UICollectionView!
    @IBOutlet weak var collVwService: UICollectionView!
    @IBOutlet weak var collVwBanner: UICollectionView!
    //MARK: - Variables
    var homeViewModel = HomeVM()
    var arrBanners = [GetBanner]()
    var arrProducts  = [OurProduct]()
    var arrServices = [OurService]()
    var favProductsViewModel = FavouriteProductsVM()
    var productDetailViewModel = ProductDetailVM()
    var addToCartViewModel = AddToCartVM()
   
    override func viewDidLoad() {
        super.viewDidLoad()
       uiSet()
        
    }
    func uiSet(){
        txtFldSearch.setupRightImage(imageName: "Vector25")
        homeViewModel.mainHomeApi{ data in
            self.arrBanners = data?.getBanner ?? []
            self.arrServices = data?.ourServices ?? []
            self.arrProducts = data?.ourProduct ?? []
            self.collVwBanner.reloadData()
            self.collVwProduct.reloadData()
            self.collVwService.reloadData()
        }
    }
   
    //MARK: - ButtonActions
    @IBAction func actionSeelAllProducts(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "allProductsVC") as! allProductsVC
        vc.arrProdu = arrProducts
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionSeeAllService(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OurServicesVC") as! OurServicesVC
        vc.arrServ = arrServices
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - UICollectionViewDelegate
extension MainHomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collVwBanner{
            return arrBanners.count
        }else if collectionView == collVwProduct{
            return arrProducts.count
        }else{
            return arrServices.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collVwBanner{
            let cellBanner = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCVC", for: indexPath) as! HomeBannerCVC
            cellBanner.imgVwBanner.imageLoad(imageUrl: arrBanners[indexPath.row].image)
            return cellBanner
        } else if collectionView == collVwService{
            let cellService = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCVC", for: indexPath) as! ServicesCVC
            cellService.lblServiceDetail.text = arrServices[indexPath.row].description
            cellService.lblServceName.text = arrServices[indexPath.row].serviceName
            if arrServices[indexPath.row].serviceImages.count > 0{
                cellService.imgVwService.imageLoad(imageUrl: arrServices[indexPath.row].serviceImages[0])
            }
            
            return cellService
        } else {
            let cellProduct = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCVC", for: indexPath) as! ProductCVC
            cellProduct.imgVwProduct.imageLoad(imageUrl: arrProducts[indexPath.row].productImages[0])
            cellProduct.lblProductName.text = arrProducts[indexPath.row].productName
            cellProduct.lblTitle.text = arrProducts[indexPath.row].description
            cellProduct.lblPrice.text = "$\(arrProducts[indexPath.row].price)"
            cellProduct.lblDiscount.text = "-\(arrProducts[indexPath.row].discountPrice )%"
            cellProduct.btnAddToCart.tag = indexPath.row
            cellProduct.btnAddToCart.addTarget(self, action: #selector(actionAddToCart), for: .touchUpInside)
            if arrProducts[indexPath.row].isCart == true{
                cellProduct.btnAddToCart.isSelected = true
            
            }
            cellProduct.btnFav.tag = indexPath.row
            cellProduct.btnFav.addTarget(self, action: #selector(actionFavouriteProducts), for: .touchUpInside)
            if arrProducts[indexPath.row].isFavourite == true{
                cellProduct.btnFav.isSelected = true
            }else{
                cellProduct.btnFav.isSelected = false
            }
            
            return cellProduct
        }
    }
    //MARK: - ButtonAction Inside Collectionviw
    @objc func actionFavouriteProducts(sender: UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected == true{
        favProductsViewModel.addToFavouriteApi(productid: arrProducts[sender.tag].id ){
            self.uiSet()
        }
        }else{
        favProductsViewModel.deletefavouriteByProducttIdApi(productid: arrProducts[sender.tag].id ) {
            self.uiSet()
            }
        }
     }
    @objc func actionAddToCart(sender: UIButton){
        sender.setTitle("Added to cart", for: .normal)
        sender.isEnabled = false
        addToCartViewModel.addToCartApi(productId: arrProducts[sender.tag].id, type: "add", quantity: 1) {
                
            }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collVwBanner{
            return CGSize(width: collVwBanner.frame.width/1.1-0, height: 120)
        }else if collectionView == collVwService{
  
            return CGSize(width: collVwService.frame.width/2.2-0, height: 230)
        }else {
          
            return CGSize(width: collVwProduct.frame.width/2.2-0, height: 220)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collVwProduct{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
            vc.productId = arrProducts[indexPath.row].id
            self.navigationController?.pushViewController(vc, animated: true)
        }else if collectionView == collVwService{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceDetailVC") as! ServiceDetailVC
            vc.serviceId = arrServices[indexPath.row].id
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
