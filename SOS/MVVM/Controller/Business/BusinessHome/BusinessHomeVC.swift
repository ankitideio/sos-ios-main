//
//  BusinessHomeVC.swift
//  SOS
//
//  Created by meet sharma on 22/03/23.
//

import UIKit

class BusinessHomeVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var clsnVwProduct: UICollectionView!
    @IBOutlet weak var tblVwMyServices: UITableView!
    //MARK: - VAriables
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
     uiSet()
    }
    func uiSet(){
        self.clsnVwProduct.register(UINib(nibName: "MyProductCVC", bundle: nil), forCellWithReuseIdentifier: "MyProductCVC")
        tblVwMyServices.register(UINib(nibName: "MyServiceTVC", bundle: nil), forCellReuseIdentifier: "MyServiceTVC")
       
    }
    //MARK: - ButtonAction
    @IBAction func actionSideMenu(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSideMenuVC") as! ProfileSideMenuVC
        vc.isComing = false
        vc.callback = { (type,index) in
            if type == true{
                if index == 0{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyAccountBusinessVC") as! MyAccountBusinessVC

                  self.navigationController?.pushViewController(vc, animated: true)
                } else if index == 1{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyAppoitmentBusinessVC") as! MyAppoitmentBusinessVC

                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 2 {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyOrderVC") as! MyOrderVC
                   
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 3{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceDetailVC") as! ServiceDetailVC
                  
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 4{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddBAnkAccountVC") as! AddBAnkAccountVC
                  
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 5{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyProductsBUsinessVc") as! MyProductsBUsinessVc
                  
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 6{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MessageListingVC") as! MessageListingVC
                  
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAvailabilityVC") as! AddAvailabilityVC
                  
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
            vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.present(vc, animated: false)
        }
    @IBAction func actionProfile(_ sender: UIButton) {
    }
    @IBAction func actionSeeAllProduct(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "allProductsVC") as! allProductsVC
        vc.isComing = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionSeeAllService(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "allProductsVC") as! allProductsVC
        vc.isComing = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionAddService(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChoosePlanVC") as! ChoosePlanVC
        vc.isComing = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionAddProduct(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChoosePlanVC") as! ChoosePlanVC
        vc.isComing = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - UICollectionViewDelegate
extension BusinessHomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyProductCVC", for: indexPath) as! MyProductCVC
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(deleteProduct), for: .touchUpInside)
            return cell
    }
    @objc func deleteProduct(sender: UIButton){
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: clsnVwProduct.frame.size.width/2.1-5, height: 215)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
//MARK: - UITableViewDelegate
extension BusinessHomeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ServiceDetailVC") as! ServiceDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyServiceTVC", for: indexPath) as! MyServiceTVC
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(deleteService), for: .touchUpInside)
        cell.btnEdit.tag = indexPath.row
        cell.btnEdit.addTarget(self, action: #selector(edit), for: .touchUpInside)
        return cell
    }
    @objc func edit(sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PowerBookingVC") as! PowerBookingVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func deleteService(sender: UIButton){
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
    
}
