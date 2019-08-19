import RxCocoa
import RxSwift

/// - Requires: `RxSwift`, , `RxCocoa`
/// - Note: A view model can refer to one or more use cases.
final class LocationsListViewModel {
    
    // MARK: - Properties
    
    // MARK: MvRx
    let viewEffect = PublishRelay<LocationsListViewEffect>()
    
    // MARK: Dependencies
    private let coordinator: LocationsListCoordinator
    private let useCase: LocationsListUseCase
    private var listOfLocations: [LocationModel] = []
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()
    
    // MARK: - Life cycle
    
    init(coordinator: LocationsListCoordinator,
         configurator: LocationsListConfigurator) {
        self.coordinator = coordinator
        self.useCase = LocationsListUseCase(interactor: configurator.locationsListInteractor)
        
        observeViewEffect()
        getListOfLocations()
    }
}

// MARK: - Public functions

extension LocationsListViewModel {
    
    var numberOfRows: Int {
        return listOfLocations.count
    }
    
    func modelForIndex(index: Int) -> LocationModel? {
        return listOfLocations[safe: index]
    }
    
    func bind(to viewAction: PublishRelay<LocationsListViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .selectedIndex(atIndex: let index):
                    guard let locationModel = self.modelForIndex(index: index) else {
                        return
                    }
                    self.showCarList(locationModel: locationModel)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension LocationsListViewModel {
    
    func showCarList(locationModel: LocationModel) {
        coordinator.showCarList(locationModel: locationModel, animated: true)
    }
    
    func getListOfLocations() {
        self.useCase.getListOfLocations()
            .subscribe(onNext: { [unowned self] status in
                switch status {
                case .loading:
                    break
                case .error:
                    break
                case .success(let listOfLocations):
                    self.listOfLocations = listOfLocations
                    self.viewEffect.accept(.success)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Rx

private extension LocationsListViewModel {
    
    /// - Note: Privately observing view effects in the view model is meant to make the association between a specific effect and certain view states easier.
    func observeViewEffect() {
        viewEffect
            .asObservable()
            .subscribe(onNext: { effect in
                switch effect {
                case .success:
                    break
                }
            })
            .disposed(by: disposeBag)
    }
}
