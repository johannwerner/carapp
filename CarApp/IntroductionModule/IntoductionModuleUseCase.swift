import RxSwift

/// <#Brief description of the purpose of the use case#>
/// - Requires: `RxSwift`, `Async`
class IntoductionModuleUseCase {
    
    // MARK: Dependencies
    private let interactor: IntoductionModuleInteractor
    
    // MARK: - Life cycle
    
    init(interactor: IntoductionModuleInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension IntoductionModuleUseCase {
    
    func verifySomething(_ someInput: String) -> Observable<IntoductionModuleStatus> {
        return self.interactor.verifySomething(someInput: someInput)
            .map { (result: Async<Void>) -> IntoductionModuleStatus in
                switch result {
                case .loading:
                    <#Return some status#>
                case .success:
                    return .someStatus
                case let .error(error):
                    <#Return some status#>
                }
        }
    }
}
