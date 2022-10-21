//
//  LikesTableViewController.swift
//  Instagram_App
//
//  Created by coder on 20.10.2022.
//

import UIKit

/// Экран с лайками наших фото, подписками и рекомендациями
final class LikesTableViewController: UITableViewController {

    // MARK: Constants
    private enum Constants {
        static let firstLike = "comment"
        static let secondLike = "follow"
        static let thirdLike = "followed"
    }
    
    // MARK: IBOutlets
    @IBOutlet var likesView: UITableView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createRefresh()
    }
    
    // MARK: @Objc private action
    @objc private func refreshControlAction(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.likesView.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: Private Methods
    private func createRefresh() {
          let refreshControl = UIRefreshControl()
          refreshControl.tintColor = .white
        likesView.refreshControl = refreshControl
          refreshControl.addTarget(self,
                                   action: #selector(refreshControlAction),
                                   for: .valueChanged)
      }
}

// MARK: Extension + LikesTableViewController
extension LikesTableViewController {
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = .white
    }
}
