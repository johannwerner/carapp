import RxSwift

/// Retrieve list of locations from outside source
/// - Requires: `RxSwift`, `Async`
final class LocationsListUseCase {
    
    // MARK: Dependencies
    private let interactor: LocationsListInteractor
    
    // MARK: - Life cycle
    
    init(interactor: LocationsListInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension LocationsListUseCase {

    
    func getListOfLocations() -> Observable<LocationsListStatus> {
        return self.interactor.getListOfLocations()
            .map { (result: Async<Any>) -> LocationsListStatus in
                switch result {
                case .loading:
                    return .loading
                case .success(let data):
                    guard let listOfArray = data as? Array<Dictionary<String, Any>> else {
                        return .error
                    }
                    let listOfObjects = listOfArray.compactMap({ dict -> LocationModel? in
                        let model = LocationModel.parse(from: dict)
                        return model
                    })
                    return .success(listOfObjects)
                case .error:
                    return .error
                }
        }
    }
}
