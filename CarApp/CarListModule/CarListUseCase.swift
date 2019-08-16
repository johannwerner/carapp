import RxSwift

/// Retrieve a list of cars from outside source
/// - Requires: `RxSwift`, `Async`
final class CarListUseCase {
    
    // MARK: - Properties
    var locationName: String
    // MARK: Dependencies
    private let interactor: CarListInteractor
    
    // MARK: - Life cycle
    
    init(
        interactor: CarListInteractor,
        locationName: String
        ) {
        self.interactor = interactor
        self.locationName = locationName
    }
}

// MARK: - Public functions

extension CarListUseCase {
    
    func getCarListForLocation() -> Observable<CarListStatus> {
        return self.interactor.getListOfCarsForLocation(location: locationName)
            .map { (result: Async<Any>) -> CarListStatus in
                switch result {
                case .loading:
                    return .loading
                case .success(let data):
                    let listOfArray = data as! Array<Dictionary<String, Any>> //Should probably return error here rather than force cast
                    let listOfCarModels = listOfArray.compactMap({ dict -> CarModel? in
                        let carModel = CarModel.parse(from: dict)
                        return carModel
                    })
                    return .success(listOfCarModels)
                case .error:
                    return .error
                }
        }
    }
}
