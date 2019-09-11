import RxSwift
import RxCocoa
import PureLayout
/// Purpose is to show list of locations
/// - Requires: `RxSwift`, `RxCocoa`, `PureLayout`
final class LocationsListViewController: UIViewController {
    
    // MARK: Dependencies
    private let viewModel: LocationsListViewModel
    
    // MARK: Rx
    private let viewAction = PublishRelay<LocationsListViewAction>()
    
    // MARK: View components
    private let tableView = UITableView()
    private let activityView = ActivityView()
    
    // MARK: Tooling
    private let disposeBag = DisposeBag()
    // MARK: - Life cycle
    
    init(viewModel: LocationsListViewModel) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewNavigationController.isNavigationBarHidden = false
    }
}

// MARK: - Setup

private extension LocationsListViewController {
    
    /// Initializes and configures components in controller.
    func setUpViews() {
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewEdges()
        tableView.backgroundColor = ColorTheme.licensePlateBackground
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.className)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 70
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    /// Binds controller user events to view model.
    func setUpBinding() {
        viewModel.bind(to: viewAction)
    }
}

// MARK: - Rx

private extension LocationsListViewController {
    
    /// Starts observing view effects to react accordingly.
    func observeViewEffect() {
        viewModel
            .viewEffect
            .subscribe(onNext: { [unowned self] effect in
                switch effect {
                case .success:
                    self.activityView.hideView()
                case .loading:
                    self.activityView.showView()
                case .error:
                    self.activityView.hideView()
                }
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - TableView
extension LocationsListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.className, for: indexPath)
        guard let locationCell = cell as? LocationTableViewCell else {
            assertionFailure("cell is nil")
            return cell
        }
        let locationModel = viewModel.modelForIndex(index: indexPath.row)
        locationCell.fill(with: locationModel)
        return locationCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewAction.accept(.selectedIndex(atIndex: indexPath.row))
    }
}

// MARK: - Activity View
final private class ActivityView: UIView {
    // MARK: - Properties
    private var activityIndicator = UIActivityIndicatorView()
    private var activityView = UIView()
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ActivityView {
    func showView() {
        let currentWindow = UIApplication.mainWindow
        currentWindow?.endEditing(true)
        currentWindow?.addSubview(self)
        autoSetDimension(.height, toSize: UIScreen.main.bounds.size.height)
        autoSetDimension(.width, toSize: UIScreen.main.bounds.size.width)
        autoCenterInSuperview()
        layoutIfNeeded()

        self.backgroundColor = ColorTheme.alpha2
        
        activityIndicator.startAnimating()
    }
    
    func hideView() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseOut,
            animations: { [weak self] in
            self?.backgroundColor = .clear
        }, completion: { [weak self] _ in
            self?.activityIndicator.stopAnimating()
            self?.removeFromSuperview()
        })
    }
}

private extension ActivityView {
    private func setUpUI() {
        addSubview(activityView)
        activityView.autoCenterInSuperview()
        activityView.autoSetDimensions(to: CGSize(width: 80, height: 80))
        activityView.backgroundColor = ColorTheme.alpha6
        activityView.layer.cornerRadius = 8.0
        
        activityView.addSubview(activityIndicator)
        activityIndicator.autoCenterInSuperview()
        activityIndicator.style = .large
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }
}
