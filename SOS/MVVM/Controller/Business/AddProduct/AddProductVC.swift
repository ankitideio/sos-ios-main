//
//  AddProductVC.swift
//  SOS
//
//  Created by meet sharma on 23/03/23.
//

import UIKit

class AddProductVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var txtVwDescription: UITextView!
    @IBOutlet weak var txtFldTitle: UITextField!
    @IBOutlet weak var imgVwAddPhoto: UIImageView!
    @IBOutlet weak var clsnVwAddPhoto: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

      uiSet()
    }
    func uiSet(){
        txtVwDescription.contentInset = UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25)
    }
    //MARK: - ButtonAction
    @IBAction func actionBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionAddPhotoBtn(_ sender: UIButton) {
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductCategoryVC") as! ProductCategoryVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
//MARK: - UICollectionViewDelegate
extension AddProductVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddPhotoCVC", for: indexPath) as! AddPhotoCVC
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: clsnVwAddPhoto.frame.size.width/4-7 , height: 60)
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 19
//    }

}
