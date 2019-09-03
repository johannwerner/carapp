import RxSwift
import RxAlamofire
///
/// - Requires:
final class IntroductionModuleInteractorApi: IntroductionModuleInteractor {}


extension IntroductionModuleInteractorApi {
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

