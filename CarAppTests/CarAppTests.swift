//
//  CarAppTests.swift
//  CarAppTests
//
//  Created by Johann Werner on 16.08.19.
//  Copyright © 2019 Johann Werner. All rights reserved.
//

import XCTest
@testable import CarApp

class CarAppTests: XCTestCase {
    
    // MARK: - Properties
    var useCase: CarListUseCase!
    
    // MARK: - Life Cycle
    override func setUp() {
        let interactor = CarListTestInteractor()
        let useCase = CarListUseCase(
            interactor: interactor,
            locationName: "Hamburg"
        )
        self.useCase = useCase
    }
    
    override func tearDown() {
        useCase = nil
    }
}

extension CarAppTests {
    func test_parsingOfCars_licensePlate() {
        //Given
        let result = self.useCase.getCarListForLocation()
            .subscribe(onNext: { status in
                switch status {
                case .loading:
                    break
                case .error:
                    break
                case .success(let carListStatus):
        //When
                    let carModel = carListStatus.first!
        //Then
                    XCTAssertEqual(carModel.numberPlate, "HDE537EC")
                }
                
            })
        print(result)
    }
}
