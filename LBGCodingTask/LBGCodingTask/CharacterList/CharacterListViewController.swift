//
//  CharacterListViewController.swift
//  LBGCodingTask
//
//  Created by Navi on 09/06/22.
//

import UIKit
import SkeletonView

class CharacterListViewController: UIViewController {

    // MARK: Properties
    @IBOutlet private var tableView: UITableView!
    var characters = Characters()
    var viewModel: CharacterListViewModelData = CharacterListViewModel(characterAPI: CharactersAPI())
    private let notificationCenter = NotificationCenter.default

    // MARK: Life cycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.appTitle
        notificationCenter.addObserver(self,
                                       selector: #selector(listeningNetworkConnection),
                                       name: NSNotification.Name(NotificationNames.connectivityIdentifier.rawValue),
                                       object: nil)
        checkConnectivityAndUpdateUI()
        setupTableView()
        setupSkeletonView()
    }

    deinit {
        notificationCenter.removeObserver(self)
    }

    // MARK: Private methods

    /// Notification method to observe network connection
    @objc private func listeningNetworkConnection() {
        checkConnectivityAndUpdateUI()
    }

    /// Find device network connectivity
    private func checkConnectivityAndUpdateUI() {
        if viewModel.isReachable {
            updateUI()
        } else {
            AlertHandler.shared.show(over: self, type: .basic)
        }
    }

    /// Setup the table view with basic stuffs
    private func setupTableView() {
        tableView.register(CharacterCell.nib(), forCellReuseIdentifier: CharacterCell.identifier)
        tableView.rowHeight = Constants.rowHeight
        tableView.estimatedRowHeight = Constants.rowHeight
        tableView.delegate = self
        tableView.dataSource = self
    }

    /// Setup Skeleton view to show loading
    private func setupSkeletonView() {
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }

    /// API response handling
    private func updateUI() {
        Task {
            do {
                let result = try await viewModel.getCharacterList(for: APIEndPoints.characters.rawValue)
                characters = result ?? []
                refreshTableData()
            } catch let error as APIError {
                AlertHandler.shared.show(over: self, type: error)
            }
        }
    }

    /// Table data handling
    private func refreshTableData() {
        guard !characters.isEmpty else {
            AlertHandler.shared.show(over: self, type: .invalidData)
            return
        }
        tableView.stopSkeletonAnimation()
        tableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.1))
        tableView.reloadData()
    }
}
