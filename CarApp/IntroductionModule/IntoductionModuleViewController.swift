import RxSwift
import RxCocoa

/// <#Brief description of the purpose of the view controller#>
/// - Requires: `RxSwift`
class IntoductionModuleViewController: UIViewController {
    
    // MARK: Dependencies
    private let viewModel: IntoductionModuleViewModel
    
    // MARK: Rx
    private let viewAction = PublishRelay<IntoductionModuleViewAction>()
    
    // MARK: View components
    private let someButton: UIButton
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(viewModel: IntoductionModuleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBinding()
        
        observeViewState()
        observeViewEffect()
    }
}

// MARK: - Setup

private extension IntoductionModuleViewController {

    /// Initializes and configures components in controller.
    func setUpViews() {
        <#Initialize and configure components here#>
    }
    
    /// Binds controller user events to view model.
    func setUpBinding() {
        viewModel.bind(to: IntoductionModuleViewAction)
    }
}

// MARK: - Rx

private extension IntoductionModuleViewController {

    /// Starts observing view state changes of all components in controller to upadte them accordingly.
    func observeViewState() {
        viewModel
            .stateOf { $0.isSomeButtonHidden }
            .bind { [unowned self] isHidden in
                self.someButton.isHidden = isHidden
            }
            .disposed(by: disposeBag)
    }
    
    /// Starts observing view effects to react accordingly.
    func observeViewEffect() {
        viewModel
            .viewEffect
            .subscribe(onNext: { [unowned self] effect in
                switch effect {
                case .someEffect:
                    <#Do something#>
                }
            })
            .disposed(by: disposeBag)
    }
}
