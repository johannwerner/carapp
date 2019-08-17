import UIKit
import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the coordinator#>
/// - Requires: `RxSwift`
class  IntroductionModuleCoordinator {

    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator:  IntroductionModuleConfigurator
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

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
