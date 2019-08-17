import RxCocoa
import RxSwift

class  IntroductionModuleConfigurator {
    
    // MARK: Dependencies
    
    let  introductionModuleInteractor:  IntroductionModuleInteractor
    init(introductionModuleInteractor:  IntroductionModuleInteractor) {
        self.introductionModuleInteractor = introductionModuleInteractor
    }
}
