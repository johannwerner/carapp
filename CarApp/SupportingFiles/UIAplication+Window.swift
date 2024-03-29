//
//  UIAplication+Window.swift
//  CarApp
//
//  Created by Johann Werner on 11.09.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    static var mainWindow: UIWindow {
        keyWindowNullable ?? UIWindow()
    }
}

private extension UIApplication {
    static var keyWindowNullable: UIWindow? {
         UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
}

extension UIViewController {
    var mainWindow: UIWindow? {
        UIApplication.keyWindowNullable
    }
}
