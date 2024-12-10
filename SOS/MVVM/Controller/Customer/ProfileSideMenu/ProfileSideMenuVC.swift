//
//  ProfileVC.swift
//  SOS
//
//  Created by meet sharma on 20/03/23.
//

import UIKit
struct ProfileData{
    var img:String?
    var title:String?
    init(img: String? = nil, title: String? = nil) {
        self.img = img
        self.title = title
    }
}
class ProfileSideMenuVC: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    //MARK: - Outlets
    @IBOutlet weak var tblVwProfile: UITableView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgVwProfile: UIImageView!
    //MARK: - VAriables
    var callback: ((_ type:Bool,_ index:Int) -> ())?
    var arrProfile = [ProfileData]()
    var isComing = false
    var isSelect = 0
    var logOutViewModel = LogOutVM()
    var profileViewModel = ProfileVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSet()
    }
    func uiSet(){
        if isComing == true{
            arrProfile.append(ProfileData(img: "user people person users man25",title: "My Account"))
            arrProfile.append(ProfileData(img: "Group25 1",title: "My Appointments"))
            arrProfile.append(ProfileData(img: "Group 7925",title: "My Order"))
            arrProfile.append(ProfileData(img: "Vector25 2",title: "My Offers"))
            arrProfile.append(ProfileData(img: "Vector25 4",title: "Saved Cards"))
            arrProfile.append(ProfileData(img: "Vector25 3",title: "Favorite Items"))
        } else{
            arrProfile.append(ProfileData(img: "user people person users man25",title: "My Account"))
            arrProfile.append(ProfileData(img: "Group25 1",title: "My Appointments"))
            arrProfile.append(ProfileData(img: "Group 7925",title: "My Order"))
            arrProfile.append(ProfileData(img: "myService",title: "My Services"))
            arrProfile.append(ProfileData(img: "bank",title: "Add bank Account"))
            arrProfile.append(ProfileData(img: "products",title: "My Products"))
            arrProfile.append(ProfileData(img: "Msg",title: "Message"))
            arrProfile.append(ProfileData(img: "availabl",title: "Add  Availability"))
        }
        getProfileApi()
    }
    func getProfileApi(){
        profileViewModel.getProfileApi { data in
            self.lblName.text = data?.user?.name ?? ""
            self.lblEmail.text = data?.user?.email ?? ""

        }
    }
    //MARK: - ButtonAction
    @IBAction func actionEditProfile(_ sender: UIButton) {
        (ImagePicker().pickImage(self){ image in
        })
        
    }
    @IBAction func actionLogout(_ sender: UIButton) {
                    Store.authKey = ""
                    Store.autoLogin = false
                    SceneDelegate().setLogInRoot()
    }
    @IBAction func actionBack(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
}
//MARK: - UITableViewDelegate
extension ProfileSideMenuVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProfile.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTVC", for: indexPath) as! ProfileTVC
        cell.imgVwTitle.image = UIImage(named: arrProfile[indexPath.row].img ?? "")
        cell.lblTitle.text = arrProfile[indexPath.row].title ?? ""
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            callback?(true,indexPath.row)
            self.dismiss(animated: false)
            }
}
//MARK: - imagePickerController
extension ProfileSideMenuVC{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imgVwProfile.contentMode = .scaleToFill
                imgVwProfile.image = pickedImage
                profileViewModel.uploadProfilePicApi(profileImg: imgVwProfile) {
                    
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
}
