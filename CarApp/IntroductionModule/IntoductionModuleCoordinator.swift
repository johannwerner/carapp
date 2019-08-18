import UIKit
import RxCocoa
import RxSwift

/// Entry point into app to introduce the app
/// - Requires: `RxSwift`
class  IntroductionModuleCoordinator {

    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator:  IntroductionModuleConfigurator
    
    // MARK: Tooling

    // MARK: - Life cycle
    
    init(navigationController: UINavigationController, configurator:  IntroductionModuleConfigurator) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension  IntroductionModuleCoordinator {
    
    func showIntroduction(animated: Bool) {
        let viewModel =  IntroductionModuleViewModel(coordinator: self, configurator: configurator)
        let viewController =  IntroductionModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }
}

// MARK: - Navigation OUT

extension  IntroductionModuleCoordinator {

    func showLocationList(animated: Bool) {
        let configurator = LocationsListConfigurator(locationsListInteractor: LocationsListInteractorApi(client: NetworkLayer()))
        let coordinator = LocationsListCoordinator(navigationController: navigationController, configurator: configurator)
        coordinator.showLocationList(animated: true)
    }
}
