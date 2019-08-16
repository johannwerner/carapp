import RxCocoa
import RxSwift

/// - Requires: `RxSwift`, `MvRx`, `RxCocoa`
/// - Note: A view model can refer to one or more use cases.
final class CarListViewModel {
    // MARK: - Properties
    private var listOfCars: [CarModel] = []
    var locationName: String
    // MARK: MvRx
    let viewEffect = PublishRelay<CarListViewEffect>()
    
    // MARK: Dependencies
    private let coordinator: CarListCoordinator
    private let useCase: CarListUseCase
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(coordinator: CarListCoordinator,
         configurator: CarListConfigurator,
         locationName: String
        ) {
        self.coordinator = coordinator
        let interactor = CarListInteractorApi(client: NetworkLayer())
        self.useCase = CarListUseCase(
            interactor: interactor,
            locationName: locationName
        )

        self.locationName = locationName
        observeViewEffect()
        getListOfCarsForHamburg()
    }
}

// MARK: - Public functions

extension CarListViewModel {
    
    var numberOfRows: Int {
        return listOfCars.count
    }
    
    func modelForIndexPath(index: Int) -> CarModel? {
        return listOfCars[safe: index]
    }
    
    func bind(to viewAction: PublishRelay<CarListViewAction>) {
        viewAction
            .asObservable()
            .subscribe(onNext: { [unowned self] viewAction in
                switch viewAction {
                case .selectedIndex(let index):
                    guard let model = self.modelForIndexPath(index: index) else {
                        assertionFailure("model is nil")
                        return
                    }
                    guard let position = model.position else {
                        debugPrint("position is nil")
                        return
                    }
                    self.coordinator.showMapView(
                        position: position,
                        animated: true
                    )
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Private functions

private extension CarListViewModel {
    
    func getListOfCarsForHamburg() {
        self.useCase.getCarListForLocation()
            .subscribe(onNext: { [unowned self] status in
                switch status {
                case .loading:
                    break
                case .error:
                    break
                case .success(let carListStatus):
                  self.listOfCars = carListStatus
                    self.viewEffect.accept(.success)
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Rx

private extension CarListViewModel {

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
