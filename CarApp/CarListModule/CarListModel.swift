import RxCocoa
/// View state structure for CarList.
struct CarListViewState: Equatable {
    
    static var initial: CarListViewState {
        return CarListViewState()
    }
}

/// Operation status enum for CarList.
enum CarListStatus {
    case loading
    case error
    case success([CarModel])
}

/// View effect enum for CarList.
enum CarListViewEffect {
    case success
}

/// View action enum for CarList.
enum CarListViewAction {
    case selectedIndex(atIndex: Int)
}
