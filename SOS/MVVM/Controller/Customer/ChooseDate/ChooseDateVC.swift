//
//  ChooseDateVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 08/04/23.
//

import UIKit
import FloatRatingView
import FSCalendar
class ChooseDateVC: UIViewController, FSCalendarDelegate,FSCalendarDelegateAppearance {
    @IBOutlet weak var calenderVw: FSCalendar!
    
    @IBOutlet weak var vwRating: FloatRatingView!
    override func viewDidLoad() {
        super.viewDidLoad()
        calenderVw.calendarHeaderView.backgroundColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        calenderVw.delegate = self
        calenderVw.appearance.todayColor = UIColor(red: 237/255, green: 172/255, blue: 62/255, alpha: 1.0)
        
    }
    // MARK: - ButtonActions
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionAddService(_ sender: UIButton) {
//        let vc = storyboard?.instantiateViewController(withIdentifier: "ChoosePlanVC") as! ChoosePlanVC
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionSeeTiming(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SeeTimesVC") as! SeeTimesVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
  
}
