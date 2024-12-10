//
//  MyAccountBusinessVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 10/04/23.
//

import UIKit
import FloatRatingView

class MyAccountBusinessVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var stackVwAccount: UIStackView!
    @IBOutlet weak var scrollVwAccount: UIScrollView!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var segmentBtn: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        segmentBtn.removeBorder()
        segmentBtn.addUnderlineForSelectedSegment()
        segmentBtn.font(name: "Rufina-Bold", size: 15)
        
    }
    @IBAction func actionEdit(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditProfileBusinessVC") as! EditProfileBusinessVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionTellYourSelf(_ sender: UIButton) {
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSegments(_ sender: UISegmentedControl) {
        segmentBtn.changeUnderlinePosition()
        if sender.selectedSegmentIndex == 0{
            scrollVwAccount.setContentOffset(.zero, animated: true)
            scrollVwAccount.setContentOffset(CGPoint(x: scrollVwAccount.frame.size.width*0, y: 0), animated: true)
            
        }else if sender.selectedSegmentIndex == 1{
            scrollVwAccount.setContentOffset(.zero, animated: true)
            scrollVwAccount.setContentOffset(CGPoint(x: scrollVwAccount.frame.size.width*1, y: 0), animated: true)
            
        }else if sender.selectedSegmentIndex == 2{
            scrollVwAccount.setContentOffset(.zero, animated: true)
            scrollVwAccount.setContentOffset(CGPoint(x: scrollVwAccount.frame.size.width*2, y: 0), animated: true)
            
        }else{
            scrollVwAccount.setContentOffset(.zero, animated: true)
            scrollVwAccount.setContentOffset(CGPoint(x: scrollVwAccount.frame.size.width*3, y: 0), animated: true)
        }
    }
}
