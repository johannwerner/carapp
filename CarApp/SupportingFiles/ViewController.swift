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
    /// Non-nullable reference to the viewController's navigation controller
    /// App architecture makes sure every ViewController will have a navigation controller.
    /// Therefore navigationController cannot be nil.
    /// If navigationController is nil there are mistakes in the app achitecture which should be fixed.
    /// in production it will not crash but instead will create a navigation bar.
    /// This will cause viewWill/DidAppear to be called twice if navigationController is nil in production
    var viewNavigationController: UINavigationController {
        navigationController ?? newNavigationController
    }
}

private extension UIViewController {
    var newNavigationController: UINavigationController {
        assertionFailure("View requires navigation controller")
        let newNavigationController = UINavigationController()
        newNavigationController.isNavigationBarHidden = true
        view.window?.rootViewController = newNavigationController
        newNavigationController.pushViewController(
            self,
            animated: false
        )
        return newNavigationController
    }
}
