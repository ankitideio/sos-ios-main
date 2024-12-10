//
//  MyServiceVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 28/03/23.
//

import UIKit

class MyServiceVC: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var collVwMyService: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        
    }
    func uiSet(){
        let nib = UINib(nibName: "MyServiceCVC", bundle: nil)
        collVwMyService?.register(nib, forCellWithReuseIdentifier: "MyServiceCVC")
    }
}
// MARK: - UICollectionViewDelegate
extension MyServiceVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyServiceCVC", for: indexPath) as! MyServiceCVC
        cell.borderWidth = 1
        cell.borderColor = UIColor(red: 0.896, green: 0.896, blue: 0.896, alpha: 1)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwMyService.frame.size.width/2-10, height: 215)
    }
}
