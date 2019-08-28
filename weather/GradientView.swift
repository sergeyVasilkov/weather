import UIKit
@IBDesignable
class GradientView: UIView {
    @IBInspectable var firstColor =  UIColor (red: 47/255, green: 128/255 , blue: 237/255, alpha: 1.0).cgColor
    @IBInspectable var secondColor = UIColor (red: 86/255, green: 204/255 , blue: 242/255, alpha: 1.0).cgColor

    var  gradientLayer = CAGradientLayer()
    

}
