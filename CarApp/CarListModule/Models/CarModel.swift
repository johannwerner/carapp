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
        return lhs.vin == rhs.vin
    }
    
    var numberPlate: String
    var vin: String
    var model: String
    var fuel: Double
    var position: Position?
    var nullPosition: Position?
    
    var fuelString: String {
        if fuel == 0.0 {
            return "car_list_item_tank_empty".localizedString()
        }
        let fuelDouble = fuel*100
        let finalString = String(format: "car_list_item_tank_status".localizedString(), fuelDouble)
        return finalString
    }
}
