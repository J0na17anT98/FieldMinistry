//import UIKit
//
//@IBDesignable
//class CustomTextView: UITextView {
//    
//    
//    // MARK: - IBInspectable
//    @IBInspectable var tintCol: UIColor = UIColor(netHex: 0x707070)
//    @IBInspectable var fontCol: UIColor = UIColor(netHex: 0x707070)
//    @IBInspectable var shadowCol: UIColor = UIColor(netHex: 0x707070)
//    
//    
//    // MARK: - Properties
//    var textFont = UIFont(name: "Helvetica Neue", size: 14.0)
//    
//    override func draw(_ rect: CGRect) {
//        self.layer.masksToBounds = true
//        self.backgroundColor = UIColor(red: 230, green: 230, blue: 230)
//        self.layer.cornerRadius = 3.0
//        self.tintColor = tintCol
//        self.textColor = fontCol
//        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor(red: 255, green: 255, blue: 255).cgColor
//        
////        if let phText = self.placeholder {
////            self.attributedPlaceholder = NSAttributedString(string: phText, attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0xB3B3B3)])
////        }
//        
//        if let fnt = textFont {
//            self.font = fnt
//        } else {
//            self.font = UIFont(name: "Helvetica Neue", size: 14.0)
//        }
//    }
//    
//    // Placeholder text
//    func textRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.insetBy(dx: 10, dy: 0)
//    }
//    
//    // Editable text
//    func editingRect(forBounds bounds: CGRect) -> CGRect {
//        return bounds.insetBy(dx: 10, dy: 0)
//    }
//    
//}
