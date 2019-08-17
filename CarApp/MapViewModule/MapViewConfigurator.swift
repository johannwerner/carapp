import RxCocoa
import RxSwift

final class MapViewConfigurator {
    
    // MARK: Dependencies
    
    let mapViewInteractor: MapViewInteractor
    init(mapViewInteractor: MapViewInteractor) {
        self.mapViewInteractor = mapViewInteractor
    }
}
