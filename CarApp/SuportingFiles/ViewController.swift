//
//  ViewController.swift
//  CarApp
//
//  Created by Johann Werner on 02.09.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: NavigationController
    ///Non nullable reference to the navigation controller
    ///
    ///App achitecture makes sure every viewcontroller will have a nivagtion controller.
    ///Therefore navigationController cannot be nil.
    /// If navigationController is nil there are mistakes in the app achitecture which should be fixed.
    ///in production it will not crash but instead have the same behaviour as navigationController?.
    ///For example: viewNavigationController.isNavigationBarHidden = true will not do anything.
    /// However the implmentation is slightly different as a navigationController will be created in memory.
    var viewNavigationController: UINavigationController {
        guard let navigationController = self.navigationController else {
            assertionFailure("View requires navigation controller")
            return UINavigationController()
        }
        return navigationController
    }
}
