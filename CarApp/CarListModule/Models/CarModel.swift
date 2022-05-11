//
//  CarModel.swift
//  CarApp
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import Foundation

struct CarModel: Codable, Equatable {
    //TODO: Not really neccesary can be removed
    static func == (lhs: CarModel, rhs: CarModel) -> Bool {
        lhs.vin == rhs.vin
    }
    
    var numberPlate: String
    var vin: String
    var model: String
    var fuel: Double
    var position: Position
}

// MARK: - Public
extension CarModel {
    var fuelString: String {
        fuelStringImplementation
    }
}

// MARK: - Private
private extension CarModel {
    var fuelStringImplementation: String {
        if fuel == 0.0 {
            return "car_list_item_tank_empty".localizedString()
        }
        let fuelDouble = fuel*100
        let finalString = String(format: "car_list_item_tank_status".localizedString(), fuelDouble)
        return finalString
    }
}
