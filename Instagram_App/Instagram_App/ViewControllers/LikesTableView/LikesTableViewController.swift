//
//  LikesTableViewController.swift
//  Instagram_App
//
//  Created by coder on 20.10.2022.
//

import UIKit

/// Экран с активностью, лайки, комментарии, рекомендации
final class LikesTableViewController: UITableViewController {
    
    // MARK: Constants
    private enum Constants {
        static let commentCell = "comment"
        static let followedCell = "followed"
        static let zapros = "zapros"
    }
    
    private enum Sections {
        case zapros
        case today
        case yearstoday
        case lastWeak
    }
    
    // MARK: IBOutlet
    @IBOutlet var likesTableView: UITableView!
    
    // MARK: Private properties
    private let sections: [Sections] = [.zapros, .today, .yearstoday, .lastWeak]
    private let infoCell: [Info] = [
        Info(
            nickname: "kot_Bali",
            comment: "понравился ваш комментарий: классные очки",
            userImageName: "ava",
            contentImageName: "kot1",
            isFollow: nil,
            time: "5ч."),
        Info(
            nickname: "kot_Kokos",
            comment: "понравился ваш комментарий: чилишь)",
            userImageName: "kot4",
            contentImageName: "kot1",
            isFollow: nil,
            time: "6ч."),
        Info(
            nickname: "kot_Varvar",
            comment: "подписался(-ась) на ваши обновления.",
            userImageName: "kot5",
            contentImageName: "",
            isFollow: true,
            time: "1нед."),
        Info(
            nickname: "kot_Persik",
            comment: "есть в Instagram, вы можете знать этого человека.",
            userImageName: "kot6",
            contentImageName: "",
            isFollow: false,
            time: "2нед.")
    ]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createRefresh()
    }
    
    // MARK: @Objc private action
    @objc private func refreshControlAction(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.likesTableView.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: Private Methods
    private func createRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        likesTableView.refreshControl = refreshControl
        refreshControl.addTarget(self,
                                 action: #selector(refreshControlAction),
                                 for: .valueChanged)
    }
}

// MARK: Extension - LikesTableViewController
extension LikesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .zapros:
            return 1
        case .today:
            return 3
        case .yearstoday:
            return infoCell.count
        case .lastWeak:
            return infoCell.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let commentCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.commentCell,
            for: indexPath) as? CommentTableViewCell
        else { return UITableViewCell() }
        
        guard let followCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.followedCell,
            for: indexPath) as? FollowedTableViewCell
        else { return UITableViewCell() }
        
        switch sections[indexPath.section] {
        case .zapros:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.zapros,
                for: indexPath)
            return cell
            
        case .today:
            if infoCell[indexPath.row].isFollow != nil {
                followCell.createUser(infoCell[indexPath.row])
                return followCell
            } else {
                commentCell.createInfo(infoCell[indexPath.row])
                return commentCell
            }
            
        case .yearstoday:
            if infoCell[indexPath.row].isFollow != nil {
                followCell.createUser(infoCell[indexPath.row])
                return followCell
            } else {
                commentCell.createInfo(infoCell[indexPath.row])
                return commentCell
            }
            
        case .lastWeak:
            if infoCell[indexPath.row].isFollow != nil {
                followCell.createUser(infoCell[indexPath.row])
                return followCell
            } else {
                commentCell.createInfo(infoCell[indexPath.row])
                return commentCell
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .today, .yearstoday, .lastWeak:
            return 40
        default:
            break
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        
        switch sections[section] {
        case .today:
            label.text = "Cегодня"
        case .yearstoday:
            label.text = "Вчера"
        case .lastWeak:
            label.text = "На прошлой недели"
        default:
            break
        }
        return label
    }
}
