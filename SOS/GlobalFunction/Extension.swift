//
//  Extension.swift
//  SOS
//
//  Created by meet sharma on 17/03/23.
//

import Foundation
import UIKit

//MARK: - Switch
extension UISwitch {

    func set(width: CGFloat, height: CGFloat) {

        let standardHeight: CGFloat = 31
        let standardWidth: CGFloat = 51

        let heightRatio = height / standardHeight
        let widthRatio = width / standardWidth

        transform = CGAffineTransform(scaleX: widthRatio, y: heightRatio)
    }
}
//MARK: - Button
extension UIButton{
    @IBInspectable var cornerRadi: CGFloat {
       get {
         return layer.cornerRadius
       }
       set {
         layer.cornerRadius = newValue
         layer.masksToBounds = newValue > 0
       }
     }
    func removeBackgroundImage(for state: UIControl.State) {
           setBackgroundImage(nil, for: state)
       }
     @IBInspectable var borderWid: CGFloat {
       get {
         return layer.borderWidth
       }
       set {
         layer.borderWidth = newValue
       }
     }
     @IBInspectable var borderCol: UIColor? {
       get {
         return UIColor(cgColor: layer.borderColor!)
       }
       set {
         layer.borderColor = newValue?.cgColor
       }
     }
       func underline() {
         guard let text = self.titleLabel?.text else { return }
         let attributedString = NSMutableAttributedString(string: text)
         //NSAttributedStringKey.foregroundColor : UIColor.blue
         attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
         attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
         attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
         self.setAttributedTitle(attributedString, for: .normal)
       }
   }
//MARK: - UIView
extension UIView{
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable var cornerRadis: CGFloat {
       get {
         return layer.cornerRadius
       }
       set {
         layer.cornerRadius = newValue
         layer.masksToBounds = newValue > 0
       }
     }
    @IBInspectable var scornerRadibotton: CGFloat {
        get {
          return layer.cornerRadius
        }
        set {
          layer.cornerRadius = newValue
          // layer.masksToBounds = newValue > 0
          layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
      }
      @IBInspectable var sTopBottomcornerRadibotton: CGFloat {
        get {
          return layer.cornerRadius
        }
        set {
          layer.cornerRadius = newValue
          layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        }
      }
      @IBInspectable var sbothTopcornerRadibotton: CGFloat {
        get {
          return layer.cornerRadius
        }
        set {
          layer.cornerRadius = newValue
            layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
        }
      }
      @IBInspectable var sbothbottomcornerRadibotton: CGFloat {
        get {
          return layer.cornerRadius
        }
        set {
          layer.cornerRadius = newValue
          layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
      }
      @IBInspectable var sbothleftCornerRadibotton: CGFloat {
        get {
          return layer.cornerRadius
        }
        set {
          layer.cornerRadius = newValue
          layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
      }
    func dropShadow(){
        self.layer.shadowColor = UIColor(red: 0.376, green: 0.392, blue: 0.439, alpha: 0.1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 20
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    func viewSlideInFromLeftToRight(views: UIView) {
           var transition: CATransition? = nil
           transition = CATransition()
        transition!.duration = 0.3
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromLeft
//           transition!.delegate = self
        views.layer.add(transition!, forKey: nil)
       }
    func viewSlideInFromRightToLeft(views: UIView) {
            var transition: CATransition? = nil
            transition = CATransition()
        transition!.duration = 0.3
        transition!.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        transition!.type = CATransitionType.push
        transition!.subtype = CATransitionSubtype.fromRight
//            transition!.delegate = self
        views.layer.add(transition!, forKey: nil)
        }
}
//MARK: - Textfield
extension UITextField{
    //MARK: - Validations
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }
    @IBInspectable var cornerRadi: CGFloat {
       get {
         return layer.cornerRadius
       }
       set {
         layer.cornerRadius = newValue
         layer.masksToBounds = newValue > 0
       }
     }
     @IBInspectable var borderWid: CGFloat {
       get {
         return layer.borderWidth
       }
       set {
         layer.borderWidth = newValue
       }
     }
     @IBInspectable var borderCol: UIColor? {
       get {
         return UIColor(cgColor: layer.borderColor!)
       }
       set {
         layer.borderColor = newValue?.cgColor
       }
     }
    @IBInspectable var paddingLeftCustom: CGFloat {
         get {
             return leftView!.frame.size.width
         }
         set {
             let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
             leftView = paddingView
             leftViewMode = .always
         }
     }

     @IBInspectable var paddingRightCustom: CGFloat {
         get {
             return rightView!.frame.size.width
         }
         set {
             let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
             rightView = paddingView
             rightViewMode = .always
         }
     }
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    func setupRightImage(imageName:String){
      let imageView = UIImageView(frame: CGRect(x: 20, y: 12, width: 15, height: 15))
      imageView.image = UIImage(named: imageName)
      let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
      imageContainerView.addSubview(imageView)
      rightView = imageContainerView
      rightViewMode = .always
      self.tintColor = .lightGray
  }
}
extension UIView {

    func addDashedBorder() {
        //Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 2
        // passing an array with the values [2,3] sets a dash pattern that alternates between a 2-user-space-unit-long painted segment and a 3-user-space-unit-long unpainted segment
        shapeLayer.lineDashPattern = [2,90]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 0, y: 0),
                                CGPoint(x: self.frame.width, y: 0)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
extension UIView{
    func dropShadow2(scale: Bool = true,cornerRadius: Float) {
           self.layer.masksToBounds = false
           self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.09).cgColor
           self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 4
       }
}
// MARK: - UISegmentedControl
extension UISegmentedControl {
    func removeBorder(){
        let backgroundImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: self.bounds.size)
        self.setBackgroundImage(backgroundImage, for: .normal, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .selected, barMetrics: .default)
        self.setBackgroundImage(backgroundImage, for: .highlighted, barMetrics: .default)
        let deviderImage = UIImage.getColoredRectImageWith(color: UIColor.white.cgColor, andSize: CGSize(width: 1.0, height: self.bounds.size.height))
        self.setDividerImage(deviderImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
       
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)], for: .selected)
    }
        func font(name:String?, size:CGFloat?) {
            let attributedSegmentFont = NSDictionary(object: UIFont(name: name!, size: size!)!, forKey: NSAttributedString.Key.font as NSCopying)
            setTitleTextAttributes(attributedSegmentFont as [NSObject : AnyObject] as [NSObject : AnyObject] as? [NSAttributedString.Key : Any], for: .normal)
        }
    func addUnderlineForSelectedSegment(){
        removeBorder()
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = self.bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor(red: 0.929, green: 0.675, blue: 0.243, alpha: 1)
        underline.tag = 1
        self.addSubview(underline)
    }

    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(selectedSegmentIndex)
        UIView.animate(withDuration: 0.1, animations: {
            underline.frame.origin.x = underlineFinalXPosition
        })
    }
}

extension UIImage {

    class func getColoredRectImageWith(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let graphicsContext = UIGraphicsGetCurrentContext()
        graphicsContext?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        graphicsContext?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return rectangleImage!
    }
}

