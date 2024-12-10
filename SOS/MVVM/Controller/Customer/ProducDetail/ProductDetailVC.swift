//
//  ProductDetailVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 20/03/23.
//

import UIKit
import FloatRatingView


class ProductDetailVC: UIViewController, FloatRatingViewDelegate {
    // MARK: - Outlets
    @IBOutlet weak var lblDiscount: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgVwProducts: UIImageView!
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var btnBuyNow: UIButton!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var collVwBuyProduct: UICollectionView!
    @IBOutlet weak var collVwQuantity: UICollectionView!
    @IBOutlet weak var collVwProducDetail: UICollectionView!
    
    // MARK: - Variables
    var count = 0
    let limit = 10
    var isSelect = 0
    var productId = ""
    var viewModel = ProductDetailVM()
    var arrProductImages: Products?
    var arrProductListImg = [ProductList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        let nib = UINib(nibName: "BuyProductCVC", bundle: nil)
           collVwBuyProduct?.register(nib, forCellWithReuseIdentifier: "BuyProductCVC")
        productDetailApi()
    }
    func productDetailApi(){
        viewModel.productDetailApi(productid: productId) { data in
            self.arrProductImages = data?.products
            self.arrProductListImg = data?.productList ?? []
            self.imgVwProducts.imageLoad(imageUrl: (data?.products.productImages[0] ?? ""))
            self.lblProductName.text = data?.products.productName
            self.lblDetail.text = data?.products.description
            self.lblPrice.text = "$\(data?.products.price ?? 0)"
            self.lblDiscount.text = "$\(data?.products.discountPrice ?? 0)"
            self.collVwProducDetail.reloadData()
            self.collVwBuyProduct.reloadData()
            
        }
    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionMinus(_ sender: UIButton) {
        if count > 0 {
                count -= 1
                lblCount.text = "\(count)"
            }
    }
        @IBAction func actionPlus(_ sender: UIButton) {
            if count < limit {
                count += 1
                lblCount.text = "\(count)"
            }
        }
    @IBAction func actionBuyNow(_ sender: UIButton) {
       
        btnBuyNow.setTitleColor(.white, for: .normal)
        btnBuyNow.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        btnAddToCart.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
        btnAddToCart.borderWid = 1
        btnAddToCart.backgroundColor = .white
        btnAddToCart.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        btnBuyNow.isSelected = true
        btnAddToCart.isSelected = false
    }
    
    @IBAction func actionAddToCart(_ sender: UIButton) {
        btnAddToCart.setTitleColor(.white, for: .normal)
        btnAddToCart.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        btnBuyNow.setTitleColor(UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0), for: .normal)
        btnBuyNow.backgroundColor = .white
        btnBuyNow.isSelected = false
        btnAddToCart.isSelected = true
        btnBuyNow.borderWid = 1
        btnBuyNow.borderCol = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        
        
    }
}
// MARK: - CollectionViewDelegate
extension ProductDetailVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collVwProducDetail{
            return arrProductImages?.productImages.count ?? 0
        }else if collectionView == collVwBuyProduct{
            return arrProductListImg.count
        } else{
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collVwProducDetail{
            let cellProducDetail = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCVC", for: indexPath) as! ProductDetailCVC
            cellProducDetail.layer.borderColor = UIColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1).cgColor
            cellProducDetail.layer.borderWidth = 1
            cellProducDetail.imgVwProduct.imageLoad(imageUrl: arrProductImages?.productImages[indexPath.row] ?? "")
            return cellProducDetail
        }else if collectionView == collVwBuyProduct{
            let cellBuyProduct = collectionView.dequeueReusableCell(withReuseIdentifier: "BuyProductCVC", for: indexPath) as! BuyProductCVC
            cellBuyProduct.imgVwProduct.imageLoad(imageUrl: arrProductListImg[indexPath.row].productImages[0])
            cellBuyProduct.lblDiscount.text = "\(arrProductListImg[indexPath.row].discountPrice)"
            cellBuyProduct.lblPrice.text = "\(arrProductListImg[indexPath.row].price)"
            cellBuyProduct.lblProductName.text = arrProductListImg[indexPath.row].productName
            cellBuyProduct.layer.shadowColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 0.33).cgColor
            cellBuyProduct.layer.shadowOffset = CGSize(width: 0, height: 4.2)
            cellBuyProduct.layer.shadowRadius = 11.2
            cellBuyProduct.layer.shadowOpacity = 1
            cellBuyProduct.layer.masksToBounds = false
            return cellBuyProduct
        } else{
            let cellQuantity = collectionView.dequeueReusableCell(withReuseIdentifier: "QuantityCVC", for: indexPath) as! QuantityCVC
            if indexPath.row == 0{
                cellQuantity.layer.borderColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1).cgColor
                cellQuantity.layer.borderWidth = 0.52
                cellQuantity.lblQuantity.textColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
                
            } else{
                cellQuantity.lblQuantity.textColor = UIColor(red: 0.435, green: 0.435, blue: 0.435, alpha: 1)
                cellQuantity.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
                cellQuantity.layer.borderWidth = 0
                
            }
                return cellQuantity
          
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collVwProducDetail{
            let cell = collVwProducDetail.cellForItem(at: indexPath) as! ProductDetailCVC
            imgVwProducts.image = cell.imgVwProduct.image
        }else if collectionView == collVwBuyProduct{
        }else{
            let cellSelect = collectionView.cellForItem(at: indexPath)! as! QuantityCVC
            cellSelect.lblQuantity.textColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
            cellSelect.layer.borderWidth = 0.52
            cellSelect.layer.borderColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1).cgColor
        }
    
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == collVwQuantity{
            let cellDeSelect = collectionView.cellForItem(at: indexPath)! as! QuantityCVC
            cellDeSelect.lblQuantity.textColor = UIColor(red: 0.435, green: 0.435, blue: 0.435, alpha: 1)
            cellDeSelect.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collVwProducDetail{
            return CGSize(width: 110, height: 70)
        }else if collectionView == collVwBuyProduct{
            return CGSize(width: 160, height: 210)
        } else{
            return CGSize(width: 103, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == collVwProducDetail{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        } else if collectionView == collVwBuyProduct{
            return UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        } else{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
    }
}
