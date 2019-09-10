//
//  CircleView.swift
//  CarApp
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import UIKit

final class CircleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorTheme.circleDotBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = ColorTheme.circleDotBackground
    }

    override func setNeedsLayout() {
        super.setNeedsLayout()
        layer.cornerRadius = frame.size.height / 2
    }
}
