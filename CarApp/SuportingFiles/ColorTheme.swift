//
//  ColorTheme.swift
//  CarApp
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//
import UIKit

struct ColorTheme {}

// MARK: - Public Methods

extension ColorTheme {

    static var licensePlateBackground: UIColor {
        return ColorTheme.colorWith(red: 242, green: 242, blue: 242)
    }
    
    static var circleDotBackground: UIColor {
        return ColorTheme.colorWith(red: 175, green: 175, blue: 175)
    }
}

private extension ColorTheme {
    
    /**
       Red/Blue /Green from 0 to 255 to what color. Do not use divide by /255 because this is being done here.
     */
    static func colorWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
}
