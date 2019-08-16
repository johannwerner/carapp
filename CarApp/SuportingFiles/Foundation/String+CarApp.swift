//
//  String+CarApp.swift
//  CarApp
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

extension String {
    func localizedString() -> String {
        return NSLocalizedString(self, tableName: nil, value: self, comment: "")
    }
}
