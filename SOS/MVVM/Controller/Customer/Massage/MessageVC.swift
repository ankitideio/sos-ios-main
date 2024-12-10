//
//  MessageVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 30/03/23.
//

import UIKit

class MessageVC: UIViewController, CAAnimationDelegate {
    // MARK: - Outlets
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var txtFldName: UITextField!
    @IBOutlet weak var txtVwMessage: UITextView!
    @IBOutlet weak var txtFldPhone: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    // MARK: - Variables
    var isComing = false
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        
    }
    // MARK: - ButtonActions
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionSend(_ sender: UIButton) {
        if sender.tag == 0{
            self.btnSend.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
            self.btnCancel.backgroundColor = .clear
            self.btnCancel.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
            self.btnSend.setTitleColor(.white, for: .normal)
            if txtFldName.text == ""{
                showSwiftyAlert("", "Please enter your name", true)
            }else if txtFldEmail.text == ""{
                showSwiftyAlert("", "Please enter your email", true)
            }else if txtFldEmail.isValidEmail(txtFldEmail.text ?? "") == false{
                showSwiftyAlert("", "Please enter valid email", true)
            }else if txtFldPhone.text == ""{
                showSwiftyAlert("", "Please enter your mobile number", true)
            }else{
                showSwiftyAlert("", "Please enter your message", true)
            }
        }else{
        self.btnCancel.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
            self.btnSend.backgroundColor = .clear
        self.btnSend.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
        self.btnCancel.setTitleColor(.white, for: .normal)
           
        }
    }
//
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InboxVC") as! InboxVC
//        vc.isComing = true
//             vc.modalPresentationStyle = .popover
//             vc.preferredContentSize = CGSize(width: 225, height: 145)
//             let popOver : UIPopoverPresentationController = vc.popoverPresentationController!
//             popOver.sourceView = sender
//             popOver.delegate = self
//             popOver.permittedArrowDirections = .up
//             self.navigationController?.present(vc, animated: false, completion: nil)
    
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InboxVC") as! InboxVC
//        vc.isComing = false
//             vc.modalPresentationStyle = .popover
//             vc.preferredContentSize = CGSize(width: 225, height: 120)
//             let popOver : UIPopoverPresentationController = vc.popoverPresentationController!
//             popOver.sourceView = sender
//             popOver.delegate = self
//        popOver.permittedArrowDirections = .up
//             self.navigationController?.present(vc, animated: false, completion: nil)
    }
//extension MessageVC : UIPopoverPresentationControllerDelegate {
//  func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//    return .none
//  }
//  //UIPopoverPresentationControllerDelegate
//  func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
//  }
//}
