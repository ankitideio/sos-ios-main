//
//  ProductsVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 07/04/23.
//

import UIKit

class ProductsVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var collVwProducts: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - UICollectionViewDelegate
extension ProductsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProducts = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCVC", for: indexPath) as! ProductsCVC
        cellProducts.layer.masksToBounds = false
        cellProducts.clipsToBounds = false
        cellProducts.layer.shadowColor = UIColor(red: 0.854, green: 0.854, blue: 0.854, alpha: 0.33).cgColor
        cellProducts.layer.shadowOpacity = 1
        cellProducts.layer.shadowOffset = CGSize(width: 0, height: 9)
        cellProducts.layer.shadowRadius = 24
    return cellProducts
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwProducts.bounds.size.width, height: 380)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
