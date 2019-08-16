/// View state structure for LocationsList.
struct LocationsListViewState: Equatable {
    
    static var initial: LocationsListViewState {
        return LocationsListViewState()
    }
}

/// Operation status enum for LocationsList.
enum LocationsListStatus {
    case loading
    case error
    case success([LocationModel])
}

/// View effect enum for LocationsList.
enum LocationsListViewEffect {
    case success
}

/// View action enum for LocationsList.
enum LocationsListViewAction {
    case selectedIndex(atIndex: Int)
}
