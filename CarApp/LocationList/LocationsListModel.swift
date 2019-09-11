
/// Operation status enum for LocationsList.
enum LocationsListStatus {
    case loading
    case error
    case success(NonEmptyArray<LocationCarModel>)
}


/// View effect enum for LocationsList.
enum LocationsListViewEffect {
    case success
    case loading
    case error
}

/// View action enum for LocationsList.
enum LocationsListViewAction {
    case selectedIndex(atIndex: Int)
}

struct LocationListConstants {
    static let carListUrl = "https://car2go.now.sh/vehicles/%@"
}
