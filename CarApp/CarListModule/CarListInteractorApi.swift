import RxSwift
import RxAlamofire

/// Get a list of cars from outside source
/// - Requires: `RxSwift`, `Async`, `RxAlamofire`
final class CarListInteractorApi: CarListInteractor {
    
    // MARK: - Properties
    private var location: String
    
    // MARK: Dependencies
    
    // MARK: - Life cycle

    init(location: String) {
        self.location = location
    }
}

extension CarListInteractorApi {
    // MARK: - Internal
    
    func getListOfCarsForLocation() -> Observable<Async<Any>> {
        RxAlamofire
            .requestJSON(
                .get,
                 url,
                 parameters: nil
            )
            .flatMap { (response, json) -> Observable<Any> in
                return Observable.just(json)
            }.async()
    }
}

private extension CarListInteractorApi {
    var url: String {
        String(format: CarListConstants.carListUrl, location)
    }
}
