//
//  LocationCarModel.swift
//  CarApp
//
//  Created by Johann Werner on 10.09.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

struct LocationCarModel: Codable, Equatable {
    var numberPlate: String
    var vin: String
    var model: String
    var fuel: Double
    var position: Position
}
