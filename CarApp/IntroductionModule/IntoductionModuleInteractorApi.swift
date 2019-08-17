import Apollo
import RxSwift

/// <#Brief description of the purpose of the interactor implementation#>
/// - Requires: `RxSwift`, `Async`, `Apollo`, `ApolloClient`
class ApolloIntoductionModuleInteractor: IntoductionModuleInteractor {
    
    // MARK: Dependencies
    private let client: ApolloClient
    
    // MARK: - Life cycle
    
    init(client: ApolloClient) {
        self.client = client
    }
    
    // MARK: - Internal
    
    func verifySomething(someInput: String) -> Observable<Async<Bool>> {
        let operation = <#Initialize query or mutation#>
        return client.rx
            .fetch(query: operation)
            .asObservable()
            .async()
    }
}
