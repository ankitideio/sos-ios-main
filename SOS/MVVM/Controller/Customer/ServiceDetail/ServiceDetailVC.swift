//
//  ServiceDetailVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 22/03/23.
//

import UIKit
import MapKit
import CoreLocation

class ServiceDetailVC: UIViewController, CAAnimationDelegate {
    // MARK: - Outlets
    @IBOutlet weak var scrollVw: UIScrollView!
    @IBOutlet weak var mapVwService: MKMapView!
    @IBOutlet weak var vwService: UIView!
    @IBOutlet weak var lblService: UILabel!
    @IBOutlet weak var vwAbout: UIView!
    @IBOutlet weak var lblAbout: UILabel!
    @IBOutlet weak var vwReview: UIView!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var tblVwTiming: UITableView!
    @IBOutlet weak var tblVwServiceDetail: UITableView!
    @IBOutlet weak var collVwServiceDetail: UICollectionView!
    // MARK: - Variables
    var arrImg = ["img1","img2","img3","img4"]
    var arrDays = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    var arrTiming = ["9:00 AM to 9:00 PM ","9:00 AM to 9:00 PM", "9:00 AM to 9:00 PM","9:00 AM to 9:00 PM", "9:00 AM to 9:00 PM", "9:00 AM to 9:00 PM", "SundayClosed"]
    var isSelect = 0
    
    struct Location {
        let title: String
        let latitude: Double
        let longitude: Double
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
      
        
//        // Define the locations to be displayed on the map
//        let locations = [
//            ["title": "80 Sector", "latitude": 30.7287527, "longitude": 76.7137951],
//            ["title": "Ambala", "latitude": 30.3556547, "longitude": 76.7744736],
//            ["title": "Patiala", "latitude": 30.340000, "longitude": 76.379997,],["title": "Karnal", "latitude": 29.685629, "longitude": 76.990547],["title": "Panipat", "latitude": 29.398928, "longitude": 76.977081],
//        ]
//        // Add the annotations to the map view
//        for location in locations {
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
//            mapVwService.addAnnotation(annotation)
//        }
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 30.7287527, longitude: 76.7137951), span: MKCoordinateSpan(latitudeDelta: 4, longitudeDelta: 4))
//        mapVwService.setRegion(region, animated: true)
//
        tblVwServiceDetail.register(UINib(nibName: "UserInfoTVC", bundle: nil), forCellReuseIdentifier: "UserInfoTVC")
        
    }
    // MARK: - UIButtonAction
   
    @IBAction func actionMassage(_ sender: UIButton) {
    }
    @IBAction func actionBookNow(_ sender: UIButton) {
    }
    @IBAction func actionReview(_ sender: UIButton) {
//        viewSlideInFromRightToLeft(views: vwReview)
//        isSelect = 1
//            vwReview.isHidden = false
//            vwService.isHidden = true
//            vwAbout.isHidden = true
//            scrollVw.setContentOffset(.zero, animated: true)
            }
    @IBAction func actionAbout(_ sender: UIButton) {
       
//        vwAbout.isHidden = false
//        vwReview.isHidden = true
//        vwService.isHidden = true
//        scrollVw.setContentOffset(.zero, animated: true)
//        scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*1, y: 0), animated: true)
//        if  isSelect == 1{
//            self.viewSlideInFromLeftToRight(views: self.vwAbout)
//            DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
//                self.isSelect = 2
//            }
//
//                } else{
//               self.viewSlideInFromRightToLeft(views: self.vwAbout)
//                    DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
//                        self.isSelect = 3
//                    }
//                }
    }
    @IBAction func actionService(_ sender: UIButton) {
//        viewSlideInFromLeftToRight(views: vwService)
//        isSelect = 3
//        vwService.isHidden = false
//        vwReview.isHidden = true
//        vwAbout.isHidden = true
//        scrollVw.setContentOffset(.zero, animated: true)
//        scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*2, y: 0), animated: true)
    }
    
    func viewSlideInFromLeftToRight(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
        transition!.duration = 0.2
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromLeft
        transition!.delegate = self
        views.layer.add(transition!, forKey: nil)
      }
      func viewSlideInFromRightToLeft(views: UIView) {
        var transition: CATransition? = nil
        transition = CATransition()
          transition!.duration = 0.2
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
          transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromRight
        transition!.delegate = self
        views.layer.add(transition!, forKey: nil)
      }
}
// MARK: - MKMapViewDelegate
extension ServiceDetailVC: MKMapViewDelegate,CLLocationManagerDelegate{
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"

        if annotation is MKUserLocation {
            return nil
        }

        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "Marker")

            // if you want a disclosure button, you'd might do something like:
            //
            // let detailButton = UIButton(type: .detailDisclosure)
            // annotationView?.rightCalloutAccessoryView = detailButton
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }

}

// MARK: - UICollectionViewDelegate
extension ServiceDetailVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellServiceDetail = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceDetailCVC", for: indexPath) as! ServiceDetailCVC
        cellServiceDetail.imgVwServiceDetail.image = UIImage(named: arrImg[indexPath.row])
        return cellServiceDetail
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwServiceDetail.frame.size.width/2.1, height: 120)
    }
}
// MARK: - tableViewdelegate
//extension ServiceDetailVC: UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == tblVwServiceDetail{
//            return 1
//        } else {
//            return arrDays.count
//        }
//    }
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            if tableView == tblVwServiceDetail{
//                let cellUserInfo = tableView.dequeueReusableCell(withIdentifier: "UserInfoTVC", for: indexPath) as! UserInfoTVC
////                cellUserInfo.btnViewMore.isHidden = true
////                cellUserInfo.btnBookTrailing.constant = 56
////                cellUserInfo.btnBookWidth.constant = 60
//                return cellUserInfo
//            } else {
//                let cellBusinessHour = tableView.dequeueReusableCell(withIdentifier: "BusinessHourTVC", for: indexPath) as! BusinessHourTVC
//                cellBusinessHour.backgroundColor = UIColor(red: 0.996, green: 0.984, blue: 0.973, alpha: 1)
//                cellBusinessHour.lblDays.text = arrDays[indexPath.row]
//                cellBusinessHour.lblTiming.text = arrTiming[indexPath.row]
//                return cellBusinessHour
//            }
//        }
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            if tableView == tblVwServiceDetail{
//                return 240
//            } else {
//                return 35
//            }
//        }
//        
//    }
