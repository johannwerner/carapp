import RxCocoa
import RxSwift

class MapViewConfigurator {
    
    // MARK: Dependencies
    
    let mapViewInteractor: MapViewInteractor
    init(mapViewInteractor: MapViewInteractor) {
        self.mapViewInteractor = mapViewInteractor
    }
}
