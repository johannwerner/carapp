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
        super.init(frame: .zero)
        backgroundColor = ColorTheme.circleDotBackground
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setNeedsLayout() {
        super.setNeedsLayout()
        layer.cornerRadius = frame.size.height / 2
    }
}
