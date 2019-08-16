/// View state structure for MapView.
struct MapViewViewState: Equatable {
    static var initial: MapViewViewState {
        return MapViewViewState()
    }
}

/// Operation status enum for MapView.
enum MapViewStatus {
    case someStatus
}

/// View effect enum for MapView.
enum MapViewViewEffect {
    case someEffect
}

/// View action enum for MapView.
enum MapViewViewAction {
    case someAction
}
