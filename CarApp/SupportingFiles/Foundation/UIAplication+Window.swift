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
    static var mainWindow: UIWindow? {
        UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }
}
