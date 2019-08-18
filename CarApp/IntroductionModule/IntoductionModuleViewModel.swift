import RxCocoa
import RxSwift

///
/// - Requires: `RxSwift`, `RxCocoa`
/// - Note: A view model can refer to one or more use cases.
final class  IntroductionModuleViewModel {

    // MARK: MvRx
    let viewEffect = PublishRelay< IntroductionModuleViewEffect>()
    
    // MARK: Dependencies
    private let coordinator:  IntroductionModuleCoordinator
    private let useCase:  IntroductionModuleUseCase
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(coordinator:  IntroductionModuleCoordinator,
         configurator:  IntroductionModuleConfigurator) {
        self.coordinator = coordinator
        self.useCase =  IntroductionModuleUseCase(interactor:  configurator.introductionModuleInteractor)
        
        observeViewEffect()
    }
}

// MARK: - Public functions

extension  IntroductionModuleViewModel {
    
    func bind(to viewAction: PublishRelay< IntroductionModuleViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .primaryButtonPressed:
                    self.showLocationView()
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension  IntroductionModuleViewModel {
    
    func showLocationView() {
        coordinator.showLocationList(animated: true)
    }
}

// MARK: - Rx

private extension  IntroductionModuleViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    func observeViewEffect() {
        viewEffect
            .asObservable()
            .subscribe(onNext: { effect in
                switch effect {
                case .success: break
                }
            })
            .disposed(by: disposeBag)
    }
}
