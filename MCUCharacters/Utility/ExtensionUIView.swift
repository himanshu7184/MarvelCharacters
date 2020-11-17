//
//  ExtensionUIView.swift
//  MCUCharacters
//
//  Created by Himanshu Sonker on 17/11/20.
//  Copyright © 2020 mcu. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(_ shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0, height: 10.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 5.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        
    }
    
}
