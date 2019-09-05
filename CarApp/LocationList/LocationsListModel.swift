
/// Operation status enum for LocationsList.
enum LocationsListStatus {
    case loading
    case error
    case success(NonEmptyArray<LocationModel>)
}

/// View effect enum for LocationsList.
enum LocationsListViewEffect {
    case success
}

/// View action enum for LocationsList.
enum LocationsListViewAction {
    case selectedIndex(atIndex: Int)
}
