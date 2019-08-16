import RxSwift
import RxAlamofire

struct LocationsListConstants {
    static let locationsUrl = "https://car2go.now.sh/locations"
}

/// Retrieve list of Locations from outside source
/// - Requires: `RxSwift`, `Async`, `RxAlamofire`, `NetworkLayer`

final class LocationsListInteractorApi: LocationsListInteractor {
    
    // MARK: Dependencies
    private let client: NetworkLayer
    
    // MARK: - Life cycle
    
    init(client: NetworkLayer) {
        self.client = client
    }
}

extension LocationsListInteractorApi {
    // MARK: - Internal
    
    func getListOfLocations() -> Observable<Async<Any>> {
        let url = String(format: LocationsListConstants.locationsUrl)
        
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

