//
//  CircleView.swift
//  CarApp
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import UIKit

final class CircleView: UIView {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorTheme.circleDotBackground
        makeViewRound(size: frame.size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = ColorTheme.circleDotBackground
        makeViewRound(size: frame.size)
    }

    @discardableResult
    override func autoSetDimensions(to size: CGSize) -> [NSLayoutConstraint] {
        makeViewRound(size: size)
        return super.autoSetDimensions(to: size)
    }
}

private extension CircleView {
    func makeViewRound(size: CGSize) {
        layer.cornerRadius = frame.size.height / 2
    }
}
