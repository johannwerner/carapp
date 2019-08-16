import UIKit
import RxCocoa
import RxSwift

/// Show a map view with pinned locations
/// - Requires: `RxSwift`, `RxCocoa`
class MapViewCoordinator {

    // MARK: Dependencies
    private let navigationController: UINavigationController
    private let configurator: MapViewConfigurator
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(navigationController: UINavigationController, configurator: MapViewConfigurator) {
        self.navigationController = navigationController
        self.configurator = configurator
    }
}

// MARK: - Navigation IN

extension MapViewCoordinator {
    
    func showMapView(
        position: Position,
        animated: Bool
        ) {
        let viewModel = MapViewViewModel(
            coordinator: self,
            configurator: configurator,
            position: position
        )
        let viewController = MapViewViewController(viewModel: viewModel)
        navigationController.pushViewController(
            viewController,
         animated: animated
        )
    }
}

// MARK: - Navigation OUT

extension MapViewCoordinator {}
