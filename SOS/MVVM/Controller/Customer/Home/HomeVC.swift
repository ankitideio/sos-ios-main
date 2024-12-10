//
//  HomeVC.swift
//  SOS
//
//  Created by meet sharma on 17/03/23.
//

import UIKit

class HomeVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var scrollVw: UIScrollView!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var btnCart: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var vwNotification: UIView!
    @IBOutlet weak var vwCart: UIView!
    @IBOutlet weak var vwHome: UIView!
    @IBOutlet weak var lblNotification: UILabel!
    @IBOutlet weak var lblCart: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    //MARK: - Variables
    var isSelect = 1
    var isComing = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        self.vwHome.isHidden = false
        self.vwCart.isHidden = true
        self.vwNotification.isHidden = true
        setHideShowData(isSelect: 1)
    }
    func setHideShowData(isSelect:Int){
        if isSelect == 1{
            lblHome.isHidden = true
            lblCart.isHidden = false
            lblNotification.isHidden = false
            btnHome.isUserInteractionEnabled = false
            btnCart.isUserInteractionEnabled = true
            btnNotification.isUserInteractionEnabled = true
        }else if isSelect == 2{
            lblHome.isHidden = false
            lblCart.isHidden = true
            lblNotification.isHidden = false
            btnHome.isUserInteractionEnabled = true
            btnCart.isUserInteractionEnabled = false
            btnNotification.isUserInteractionEnabled = true
        }else{
            lblHome.isHidden = false
            lblCart.isHidden = false
            lblNotification.isHidden = true
            btnHome.isUserInteractionEnabled = true
            btnCart.isUserInteractionEnabled = true
            btnNotification.isUserInteractionEnabled = false
        }
    }
    //MARK: - ButtonAction
    @IBAction func actionTabSlider(_ sender: UIButton) {
        if sender.tag == 0{
            scrollVw.setContentOffset(.zero, animated: true)
            self.setHideShowData(isSelect: 1)
                self.vwHome.isHidden = false
                self.vwCart.isHidden = true
                self.vwNotification.isHidden = true
            vwHome.viewSlideInFromRightToLeft(views: self.vwHome)
            self.isSelect = 1
        }else if sender.tag == 1{
            NotificationCenter.default.post(name: Notification.Name("NotificationCartDetail"), object: nil)
                self.setHideShowData(isSelect: 2)
                self.vwHome.isHidden = true
                self.vwCart.isHidden = false
                self.vwNotification.isHidden = true
            if isSelect == 1{
                vwCart.viewSlideInFromLeftToRight(views: self.vwCart)
                self.isSelect = 2
            }else{
                vwCart.viewSlideInFromRightToLeft(views: self.vwCart)
                self.isSelect = 2
            }
            scrollVw.setContentOffset(.zero, animated: true)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*1, y: 0), animated: true)
        }else{
            self.setHideShowData(isSelect: 3)
                self.vwHome.isHidden = true
                self.vwCart.isHidden = true
                self.vwNotification.isHidden = false
                vwNotification.viewSlideInFromLeftToRight(views: self.vwNotification)
                self.isSelect = 3
            scrollVw.setContentOffset(.zero, animated: true)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*2, y: 0), animated: true)
        }
    }
    
    @IBAction func actionSideMenu(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSideMenuVC") as! ProfileSideMenuVC
        vc.isComing = true
        vc.callback = { (type,index) in
            if type == true{
                if index == 0{
                 
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyAccountVC") as! MyAccountVC
                    self.navigationController?.pushViewController(vc, animated: true)
                } else if index == 1{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyAppointmentsVC") as! MyAppointmentsVC
                
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 2 {
                   
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MyOrderVC") as! MyOrderVC
                    vc.isComing = true
                    
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 3{
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "YourOfferVC") as! YourOfferVC
                    vc.isSelect = 0
                    self.navigationController?.pushViewController(vc, animated: true)
                }else if index == 4{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "SavedCardVC") as! SavedCardVC
                  
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "FavouriteItemVC") as! FavouriteItemVC
                  
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
        vc.modalPresentationStyle = .overFullScreen
            self.navigationController?.present(vc, animated: false)
            }
    @IBAction func actionProfile(_ sender: UIButton) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
//
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
