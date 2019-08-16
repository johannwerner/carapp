//
//  NSObject+CarApp.swift
//  CarApp
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

extension NSObject {

    @nonobjc var className: String {
        return String(describing: type(of: self))
    }
    
    @nonobjc class var className: String {
        return String(describing: self)
    }
}
