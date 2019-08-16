import UIKit
import RxSwift

/// Show the available locations 
/// - Requires: `RxSwift`
final class LocationsListCoordinator {
    
    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator: LocationsListConfigurator
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()
    
    // MARK: - Life cycle
    
    init(navigationController: UINavigationController, configurator: LocationsListConfigurator) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension LocationsListCoordinator {
    
    func showLocationList(animated: Bool) {
        let viewModel = LocationsListViewModel(coordinator: self, configurator: configurator)
        let viewController = LocationsListViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }
}

// MARK: - Navigation OUT

extension LocationsListCoordinator {
    
    func showCarList(locationModel: LocationModel, animated: Bool) {
        let configurator = CarListConfigurator(carListInteractor: CarListInteractorApi(client: NetworkLayer()))
        let coordinator = CarListCoordinator(
            navigationController: navigationController,
            configurator: configurator
        )
        coordinator.showCarList( locationName: locationModel.name, animated: animated)
    }
}
