import RxSwift
import RxAlamofire

struct CarListConstants {
    static let carListUrl = "https://car2go.now.sh/vehicles/%@"
}

/// Get a list of cars from outside source
/// - Requires: `RxSwift`, `Async`, `RxAlamofire`, `NetworkLayer`
final class CarListInteractorApi: CarListInteractor {
    
    // MARK: Dependencies
    private let client: NetworkLayer
    
    // MARK: - Life cycle
    
    init(client: NetworkLayer) {
        self.client = client
    }
    
    // MARK: - Internal
    
    func getListOfCarsForLocation(location: String) -> Observable<Async<Any>> {
        let url = String(format: CarListConstants.carListUrl, location)
        
        let result = RxAlamofire
            .requestJSON(.get,
                         url,
                         parameters: nil)
            .flatMap { (response, json) -> Observable<Any> in
                return Observable.just(json)
            }.async()
        return result
    }
}


