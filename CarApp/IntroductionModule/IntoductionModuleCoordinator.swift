import UIKit
import RxCocoa
import RxSwift

/// <#Brief description of the purpose of the coordinator#>
/// - Requires: `RxSwift`
class IntoductionModuleCoordinator {

    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator: IntoductionModuleConfigurator
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(navigationController: UINavigationController, configurator: IntoductionModuleConfigurator) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension IntoductionModuleCoordinator {
    
    func showSomething(animated: Bool) {
        let viewModel = IntoductionModuleViewModel(coordinator: self, configurator: configurator)
        let viewController = IntoductionModuleViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: animated)
    }
}

// MARK: - Navigation OUT

extension IntoductionModuleCoordinator {

    func dismissSomething(animated: Bool) {
        <#Implement navigation to another module#>
    }
}
