//
//  CarTableViewCell.swift
//  CarApp
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import UIKit

final class CarTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    private var model: CarModel?
    var vehicleTitleLabel = UILabel()
    var licensePlateView = UIView()
    var licensePlateLabel = UILabel()
    var fuelLabel = UILabel()
    var modelLabel = UILabel()

    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public
extension CarTableViewCell {
    func fill(with model: CarModel) {
        self.model = model
        licensePlateLabel.text = model.numberPlate
        
        fuelLabel.text = model.fuelString
        modelLabel.text = model.model
        accessoryType = hasPosition ? .disclosureIndicator: .none
        selectionStyle = hasPosition ? .gray: .none
    }
}

// MARK: - Private
private extension CarTableViewCell {
    var hasPosition: Bool {
        guard let model = model else {
            assertionFailure("do not use model before fill with model is called")
            return false
        }
        return model.position != nil
    }
    
    func setUpViews() {
        contentView.addSubview(vehicleTitleLabel)
        vehicleTitleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        vehicleTitleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        vehicleTitleLabel.text = "car_list_item_title".localizedString()
        vehicleTitleLabel.font = UIFont.systemFont(ofSize: 24)
        
        contentView.addSubview(licensePlateView)
        licensePlateView.autoPinEdge(.top, to: .bottom, of: vehicleTitleLabel, withOffset: 10)
        licensePlateView.autoAlignAxis(toSuperviewAxis: .vertical)
        
        licensePlateView.addSubview(licensePlateLabel)
        let licensePlateLabelEdgeInsents = UIEdgeInsets(
            top: 0,
            left: 7,
            bottom: 0,
            right: 7
        )
        licensePlateLabel.autoPinEdgesToSuperviewEdges(with: licensePlateLabelEdgeInsents)
        licensePlateView.backgroundColor = ColorTheme.licensePlateBackground
        licensePlateView.layer.cornerRadius = 4
        createCircleViews()
        
        contentView.addSubview(fuelLabel)
        fuelLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        fuelLabel.autoPinEdge(.top, to: .bottom, of: licensePlateView, withOffset: 10)
        
        contentView.addSubview(modelLabel)
        modelLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        modelLabel.autoPinEdge(.top, to: .bottom, of: fuelLabel, withOffset: 10)
        modelLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
    }
    
    func createCircleViews() {
        for index in 0...3 {
            let firstCircleView = CircleView()
            licensePlateView.addSubview(firstCircleView)
            firstCircleView.autoSetDimensions(to: CGSize(width: 2, height: 2))
            
            switch index {
            case 0, 1:
                firstCircleView.autoPinEdge(toSuperviewEdge: .top, withInset: 3)
            default:
                firstCircleView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 3)
            }
            
            switch index {
            case 0, 2:
                firstCircleView.autoPinEdge(toSuperviewEdge: .leading, withInset: 3)
            default:
                firstCircleView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 3)
            }
        }
    }
}
