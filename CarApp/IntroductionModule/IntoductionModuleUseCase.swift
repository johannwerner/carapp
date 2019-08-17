import RxSwift

/// An introduction to the app
/// - Requires: `RxSwift`, `Async`
class  IntroductionModuleUseCase {
    
    // MARK: Dependencies
    private let interactor:  IntroductionModuleInteractor
    
    // MARK: - Life cycle
    
    init(interactor:  IntroductionModuleInteractor) {
        self.interactor = interactor
    }
}

// MARK: - Public functions

extension  IntroductionModuleUseCase {}
