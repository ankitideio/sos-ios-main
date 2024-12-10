//
//  CartVC.swift
//  SOS
//
//  Created by meet sharma on 20/03/23.
//

import UIKit

class CartVC: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var heightTblVw: NSLayoutConstraint!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblShipping: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblSubTotal: UILabel!
    @IBOutlet weak var txtVwAddNote: UITextView!
    @IBOutlet weak var tblVwCart: UITableView!
    //MARK: - Variables
    var getCartViewModel = AddToCartVM()
    var arrGetCart = [Cart]()
    var subTotal = Int()
    var totalPP = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationCartDetail"), object: nil)
        txtVwAddNote.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        getCartApi()
    }
    func getCartApi(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
            self.getCartViewModel.getCartApi{ data in
                self.arrGetCart = data.cart
                self.tblVwCart.reloadData()
                for i in data.cart {
                    self.totalPP += i.productID.price*i.quantity
                    self.lblTotal.text = "$\(self.totalPP/2+10)"
                    self.subTotal += i.productID.price*i.quantity
                    self.lblSubTotal.text = "£\(self.subTotal/2)"
                    print("Quantity: \(i.productID.price)")
                    print("Total Price: \(i.quantity)")
                }
            }
        }
    }
    @objc func methodOfReceivedNotification(notification: Notification) {
        getCartApi()
    }
    //MARK: - ButtonAction
    @IBAction func actionApplyCoupn(_ sender: UIButton) {
    }
    @IBAction func btnSelectUnselect(_ sender: UIButton) {
    }
    @IBAction func actionAddShipingAddress(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShippingAddressVC") as! ShippingAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - UITableViewDelegate
extension CartVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGetCart.count
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        return  self.heightTblVw.constant = self.tblVwCart.contentSize.height
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTVC", for: indexPath) as! CartTVC
        cell.lblProductName.text = arrGetCart[indexPath.row].productID.productName
        cell.lblPrice.text = "$\(arrGetCart[indexPath.row].productID.price)"
        cell.imgVwProduct.imageLoad(imageUrl: arrGetCart[indexPath.row].productID.productThumbnail)
        cell.btnDelete.tag = indexPath.row
        cell.btnDelete.addTarget(self, action: #selector(removeCart), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    @objc func removeCart(sender: UIButton){
        getCartViewModel.addToCartApi(productId: arrGetCart[sender.tag].productID.id,type: "remove", quantity: arrGetCart[sender.tag].quantity){
            self.getCartApi()
        }
    }
}
