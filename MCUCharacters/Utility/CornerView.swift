//
//  CornerView.swift
//  MCUCharacters
//
//  Created by Himanshu Sonker on 17/11/20.
//  Copyright © 2020 mcu. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundUIImageView: UIImageView {

    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

}
