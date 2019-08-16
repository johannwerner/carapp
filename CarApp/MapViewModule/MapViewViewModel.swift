import RxCocoa
import RxSwift

/// - Requires: `RxSwift`, `MvRx`, `RxCocoa`
/// - Note: A view model can refer to one or more use cases.
class MapViewViewModel {

    // MARK: - Properties
    var position: Position

    // MARK: MvRx
    let viewEffect = PublishRelay<MapViewViewEffect>()
    
    // MARK: Dependencies
    private let coordinator: MapViewCoordinator
    private let useCase: MapViewUseCase
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(coordinator: MapViewCoordinator,
         configurator: MapViewConfigurator,
         position: Position
        ) {
        self.coordinator = coordinator
        self.useCase = MapViewUseCase(interactor: MapViewInteractorApi())
        self.position = position
        
        observeViewEffect()
    }
}

// MARK: - Public functions

extension MapViewViewModel {
    
    func bind(to viewAction: PublishRelay<MapViewViewAction>) {}
}

// MARK: - Private functions

private extension MapViewViewModel {}

// MARK: - Rx

private extension MapViewViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    func observeViewEffect() {}
}
