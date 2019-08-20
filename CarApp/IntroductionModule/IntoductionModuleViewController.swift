import RxSwift
import RxCocoa

/// An introduction to my coding challenge
/// - Requires: `RxSwift`, `RxCocoa`
final class IntroductionModuleViewController: UIViewController {
    
    // MARK: Dependencies
    private let viewModel:  IntroductionModuleViewModel
    
    // MARK: Rx
    private let viewAction = PublishRelay<IntroductionModuleViewAction>()
    
    // MARK: View components
    private let primaryButton = UIButton()
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()

    // MARK: - Life cycle
    
    init(viewModel:  IntroductionModuleViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
        setUpBinding()
        
        observeViewEffect()
    }
}

// MARK: - Setup

private extension  IntroductionModuleViewController {

    /// Initializes and configures components in controller.
    func setUpViews() {
        setUpNextButton()
        setUpTitleLable()
        setUpSubtitleLable()
    }
    
    func setUpNextButton() {
        view.addSubview(primaryButton)
        primaryButton.autoAlignAxis(toSuperviewAxis: .vertical)
        primaryButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 50)
        primaryButton.autoSetDimension(.height, toSize: 50)
        primaryButton.autoSetDimension(.width, toSize: 200, relation: .greaterThanOrEqual)
        primaryButton.layer.cornerRadius = 4.0
        
        primaryButton.backgroundColor = ColorTheme.primaryAppColor
        primaryButton.setTitle(
            "introduction_primary_button".localizedString(),
            for: .normal
        )
        primaryButton.rx.tap.subscribe(onNext: { [unowned self] _ in
            self.viewAction.accept(.primaryButtonPressed)
        })
        .disposed(by: disposeBag)
    }
    
    func setUpTitleLable() {
        view.addSubview(titleLabel)
        titleLabel.autoCenterInSuperview()
        titleLabel.font = UIFont.systemFont(ofSize: 21)
        titleLabel.text = IntroductionConstants.titleLabelText
    }
    
    /// - Requires: setUpTitleLable to be called first
    func setUpSubtitleLable() {
        view.addSubview(subtitleLabel)
        subtitleLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        subtitleLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 17)
        subtitleLabel.font = UIFont.systemFont(ofSize: 17)
        subtitleLabel.text = "introduction_sub_title".localizedString()
    }
    
    /// Binds controller user events to view model.
    func setUpBinding() {
        viewModel.bind(to: viewAction)
    }
}

// MARK: - Rx

private extension  IntroductionModuleViewController {
    
    /// Starts observing view effects to react accordingly.
    func observeViewEffect() {
        viewModel
        .viewEffect
        .subscribe(onNext: { effect in
            switch effect {
            case .success:break
            }
        })
        .disposed(by: disposeBag)}
}
