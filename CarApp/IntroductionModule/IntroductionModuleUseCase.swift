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
    func getListOfLocations() -> Observable<IntroductionModuleStatus> {
        interactor.getListOfLocations()
            .map { (result: Async<Any>) -> IntroductionModuleStatus in
                switch result {
                case .loading:
                    return .loading
                case .success(let data):
                    guard let listOfArray = data as? Array<Dictionary<String, Any>> else {
                        return .error
                    }
                    let listOfObjects = listOfArray.compactMap({ dict -> IntroductionLocationModel? in
                        let model = IntroductionLocationModel.parse(from: dict)
                        return model
                    })
                    guard let nonEmptyArray = listOfObjects.convertToNonEmptyArray() else {
                        return .error
                    }
                    return .success(nonEmptyArray)
                case .error:
                    return .error
                }
        }
    }
}
