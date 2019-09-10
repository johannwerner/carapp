import RxSwift
/// An introduction to the app
/// - Requires:
final class IntroductionModuleUseCase {
    
    // MARK: Dependencies
    private let interactor:  IntroductionModuleInteractor
    
    // MARK: - Life cycle
    
    init(interactor:  IntroductionModuleInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension IntroductionModuleUseCase {    
    func getListOfLocations() -> Observable<LocationsListStatus> {
        interactor.getListOfLocations()
            .map { (result: Async<Any>) -> LocationsListStatus in
                switch result {
                case .loading:
                    return .loading
                case .success(let data):
                    guard let listOfArray = data as? Array<Dictionary<String, Any>> else {
                        return .error
                    }
                    var listOfObjects = listOfArray.compactMap({ dict -> LocationModel? in
                        let model = LocationModel.parse(from: dict)
                        return model
                    })
                    guard let firstObject = listOfObjects.first else {
                        return .error
                    }
                    listOfObjects.remove(at: 0)
                    let nonEmptyArray = NonEmptyArray(firstObject, listOfObjects)
                    return .success(nonEmptyArray)
                case .error:
                    return .error
                }
        }
    }
}
