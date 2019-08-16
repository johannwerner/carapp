import RxSwift
@testable import CarApp

final class CarListTestInteractor: CarListInteractor {
    
    // MARK: Dependencies
    
    
    // MARK: - Life cycle
    
    
    // MARK: - Internal
    
}

extension CarListTestInteractor {
    func getListOfCarsForLocation(location: String) -> Observable<Async<Any>> {
        let dictionary: [String : Any] = [
            "numberPlate": "HDE537EC",
            "vin": "test",
            "model": "Golf",
            "fuel": 0.9
        ]
        return Observable.just([dictionary]).async()
    }
}
