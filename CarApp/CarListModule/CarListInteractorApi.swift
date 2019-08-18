import RxSwift
import RxAlamofire

/// Get a list of cars from outside source
/// - Requires: `RxSwift`, `Async`, `RxAlamofire`
final class CarListInteractorApi: CarListInteractor {
    
    // MARK: Dependencies
    
    // MARK: - Life cycle
}

extension CarListInteractorApi {
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
