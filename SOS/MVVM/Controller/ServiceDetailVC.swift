//
//  ServiceDetail2VC.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import UIKit
import FloatRatingView
import MapKit
import CoreLocation

class ServiceDetailVC: UIViewController{
    // MARK: - Outlets
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblExpertIn: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblRatingCount: UILabel!
    @IBOutlet weak var lblProfession: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgVwUser: UIImageView!
    @IBOutlet weak var mapVw: MKMapView!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var scrollVw: UIScrollView!
    @IBOutlet weak var collVwServiceDetailss: UICollectionView!
    @IBOutlet weak var segmentBtn: UISegmentedControl!
    // MARK: - Variables
    var serviceId = ""
    var serviceDetailViewModel = ServiceDetailVM()
    var arrServiceDetail = [Service]()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
        serviceDetialApi()
    }
    func uiSet(){
        segmentBtn.removeBorder()
        segmentBtn.addUnderlineForSelectedSegment()
        segmentBtn.font(name: "Rufina-Bold", size: 15)
        let location = CLLocation(latitude: 30.704649, longitude: 76.717873)
        let region = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: CLLocationDistance(100000), longitudinalMeters: CLLocationDistance(100000))
        mapVw.setRegion(region, animated: true)
        mapVw.delegate = self
        let london = MKPointAnnotation()
        london.coordinate = location.coordinate
        mapVw.addAnnotation(london)
    }
    func serviceDetialApi(){
        serviceDetailViewModel.ServiceDetailApi(serviceid: serviceId) { data in
            self.arrServiceDetail = data?.service ?? []
            self.lblUserName.text = data?.service[0].userID.name
            self.lblName.text = data?.service[0].serviceName
            self.lblAddress.text = data?.service[0].userID.address
            self.lblExpertIn.text = data?.service[0].specialize
            self.lblProfession.text = data?.service[0].profession ?? ""
            self.collVwServiceDetailss.reloadData()
        }
    }
    // MARK: - ButtonAction
    @IBAction func actionBussinessHour(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "BusinessHourVC") as! BusinessHourVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionMessage(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MessageVC") as! MessageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionShare(_ sender: UIButton) {
    }
    @IBAction func actionFavourite(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FavouriteItemVC") as! FavouriteItemVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func actionSegment(_ sender: UISegmentedControl) {
        segmentBtn.changeUnderlinePosition()
        if sender.selectedSegmentIndex == 0{
            scrollVw.setContentOffset(.zero, animated: true)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*0, y: 0), animated: true)
        }else if sender.selectedSegmentIndex == 1{
            scrollVw.setContentOffset(.zero, animated: true)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*1, y: 0), animated: true)
        }else if sender.selectedSegmentIndex == 2{
            scrollVw.setContentOffset(.zero, animated: true)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*2, y: 0), animated: true)
        }else{
            scrollVw.setContentOffset(.zero, animated: true)
            scrollVw.setContentOffset(CGPoint(x: scrollVw.frame.size.width*3, y: 0), animated: true)
        }
    }
}
// MARK: - UICollectionViewDelegate
extension ServiceDetailVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if arrServiceDetail.count > 0{
        return arrServiceDetail[0].serviceImages.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceDetailCVC", for: indexPath) as! ServiceDetailCVC
        cell.imgVwServices.imageLoad(imageUrl: arrServiceDetail[0].serviceImages[indexPath.row])
       if arrServiceDetail[0].serviceImages.count == 3{
            cell.vwOnImg.isHidden = false
            cell.btnViewAll.isHidden  = false
        }else{
            cell.vwOnImg.isHidden = true
            cell.btnViewAll.isHidden  = true
        }
    return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collVwServiceDetailss.frame.size.width/4.2-4, height: 75)
    }
}
// MARK: - MKMapViewDelegate
extension ServiceDetailVC: MKMapViewDelegate,CLLocationManagerDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else {
            return nil
        }
        let identifier = "annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "marker 1")
        
        return annotationView
    }
    
}
   
