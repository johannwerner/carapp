import RxSwift

/// <#Brief description of the purpose of the interactor#>
/// - Requires: `RxSwift`
protocol IntoductionModuleInteractor {
    func verifySomething(someInput: String) -> Observable<Async<Bool>>
}
