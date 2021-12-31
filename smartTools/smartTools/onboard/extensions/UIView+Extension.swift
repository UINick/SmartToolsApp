//
//  UIView+Extension.swift
//  smartTools
//
//  Created by Nicholas Forte on 30/12/21.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get{ return cornerRadius }
        set{ self.layer.cornerRadius = newValue }
    }
    
}
