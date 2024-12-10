//
//  MyProductsVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 28/03/23.
//

import UIKit

class MyProductsVC: UIViewController {

    @IBOutlet weak var collVwMyProducts: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
uiSet()
    }
    func uiSet(){
        let nib = UINib(nibName: "MyProductCVC", bundle: nil)
        collVwMyProducts?.register(nib, forCellWithReuseIdentifier: "MyProductCVC")
    }
}
// MARK: - UICollectionViewDelegate
extension MyProductsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyProductCVC", for: indexPath) as! MyProductCVC
        cell.borderWidth = 1
        cell.borderColor = UIColor(red: 0.896, green: 0.896, blue: 0.896, alpha: 1)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwMyProducts.frame.size.width/2-10, height: 200)
    }
}

