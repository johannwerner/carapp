import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the view model#>
/// - Requires: `RxSwift`, `MvRx`
/// - Note: A view model can refer to one or more use cases.
class IntoductionModuleViewModel: MvRxViewModel {

    // MARK: MvRx
    let viewState = MvRxViewState<IntoductionModuleViewState>(initialState: IntoductionModuleViewState.initial)
    let viewEffect = PublishRelay<IntoductionModuleViewEffect>()
    
    // MARK: Dependencies
    private let coordinator: IntoductionModuleCoordinator
    private let useCase: IntoductionModuleUseCase
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(coordinator: IntoductionModuleCoordinator,
         configurator: IntoductionModuleConfigurator) {
        self.coordinator = coordinator
        self.useCase = IntoductionModuleUseCase(interactor: IntoductionModuleInteractor)
        
        observeViewEffect()
    }
}

// MARK: - Public functions

extension IntoductionModuleViewModel {
    
    func bind(to viewAction: PublishRelay<IntoductionModuleViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .someAction:
                    self.doSomething()
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension IntoductionModuleViewModel {
    
    func doSomething() {
        self.useCase.verifySomething(<#Pass some input value#>)
            .subscribe(onNext: { [unowned self] status in
                switch status {
                case .someStatus:
                    self.viewEffect.accept(.someEffect)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Rx

private extension IntoductionModuleViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    private func observeViewEffect() {
        viewEffect
            .asObservable()
            .subscribe(onNext: { [unowned self] effect in
                switch effect {
                case .someEffect:
                    self.viewState.set {
                        <#Perform view state changes#>
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}
