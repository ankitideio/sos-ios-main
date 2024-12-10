//
//  DeleteAccountVC.swift
//  SOS
//
//  Created by IDEIO SOFT on 06/04/23.
//

import UIKit

class DeleteAccountVC: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var btnNeverMind: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
    }
    // MARK: - ButtonAction
    @IBAction func actionBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionDelete(_ sender: UIButton) {
            self.btnDelete.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
            self.btnNeverMind.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
            self.btnNeverMind.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
            self.btnDelete.setTitleColor(.white, for: .normal)
        self.btnNeverMind.setTitleColor(#colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1), for: .normal)
    }
    @IBAction func actionNeverMind(_ sender: UIButton) {
             self.btnNeverMind.backgroundColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
             self.btnDelete.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
             self.btnDelete.setTitleColor(UIColor(red: 0.179, green: 0.179, blue: 0.179, alpha: 1), for: .normal)
             self.btnNeverMind.setTitleColor(.white, for: .normal)
        self.btnDelete.setTitleColor(#colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1), for: .normal)
        self.btnDelete.borderWid = 1
        self.btnDelete.borderColor = #colorLiteral(red: 0.9294117647, green: 0.6745098039, blue: 0.2431372549, alpha: 1)
    }
    
}
