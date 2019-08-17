/// View state structure for IntoductionModule.
struct IntoductionModuleViewState: Equatable {
    
    var isSomeButtonHidden: Bool
    
    static var initial: IntoductionModuleViewState {
        return IntoductionModuleViewState(
            isSomeButtonHidden: true
        )
    }
}

/// Operation status enum for IntoductionModule.
enum IntoductionModuleStatus {
    case someStatus
}

/// View effect enum for IntoductionModule.
enum IntoductionModuleViewEffect {
    case someEffect
}

/// View action enum for IntoductionModule.
enum IntoductionModuleViewAction {
    case someAction
}
