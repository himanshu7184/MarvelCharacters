//
//  ExtensionsUIViewController.swift
//  MCUCharacters
//
//  Created by Himanshu Sonker on 17/11/20.
//  Copyright © 2020 mcu. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
    //Alert
    func alert(message: String, title: String? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
