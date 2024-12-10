//
//  ServiceProviderProfileVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 27/03/23.
//

import UIKit

class ServiceProviderProfileVC: UIViewController, CAAnimationDelegate {
    //MARK: - Outlets
    @IBOutlet weak var vwService: UIView!
    @IBOutlet weak var vwAbout: UIView!
    @IBOutlet weak var vwReview: UIView!
    var isSelect = 1
    override func viewDidLoad() {
        super.viewDidLoad()
  uiSet()
    }
    func uiSet(){
        vwReview.isHidden = true
        vwAbout.isHidden = true
    }
    //MARK: - ButonAction
    @IBAction func actionService(_ sender: UIButton) {
        isSelect = 1
        viewSlideInFromRightToLeft(views: vwService)
        vwService.isHidden = false
        vwReview.isHidden = true
        vwAbout.isHidden = true
    }
    @IBAction func actionSideMenu(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileSideMenuVC") as! ProfileSideMenuVC
        self.navigationController?.present(vc, animated: false)
    }
    @IBAction func actionReview(_ sender: UIButton) {
        vwReview.isHidden = false
        vwService.isHidden = true
        vwAbout.isHidden = true
        if isSelect == 1{
            viewSlideInFromLeftToRight(views: vwReview)
            isSelect = 2
        }else{
            viewSlideInFromRightToLeft(views: vwReview)
            isSelect = 2
        }
    }
    
    @IBAction func actionSetup(_ sender: UIButton) {
        
    }
    @IBAction func actionAbout(_ sender: UIButton) {
        isSelect = 3
        viewSlideInFromLeftToRight(views: vwAbout)
        vwAbout.isHidden = false
        vwService.isHidden = true
        vwReview.isHidden = true
    }
    func viewSlideInFromLeftToRight(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.3
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromLeft
        transition!.delegate = self
        views.layer.add(transition!, forKey: nil)
      }
      func viewSlideInFromRightToLeft(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.3
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromRight
        transition!.delegate = self
        views.layer.add(transition!, forKey: nil)
      }
}
