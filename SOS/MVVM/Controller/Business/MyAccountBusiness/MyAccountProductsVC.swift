//
//  MyAccountProductsVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 12/04/23.
//

import UIKit

class MyAccountProductsVC: UIViewController {

    @IBOutlet weak var collVwProduct: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "MyProductCVC", bundle: nil)
        collVwProduct?.register(nib, forCellWithReuseIdentifier: "MyProductCVC")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - UICollectionViewDelegate
extension MyAccountProductsVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyProductCVC", for: indexPath) as! MyProductCVC
        cell.borderWidth = 1
        cell.borderColor = UIColor(red: 0.896, green: 0.896, blue: 0.896, alpha: 1)
        cell.btnEdit.setImage(nil, for: .normal)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
                self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwProduct.frame.size.width/2-10, height: 215)
    }
}

