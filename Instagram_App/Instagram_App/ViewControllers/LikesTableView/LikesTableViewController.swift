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
    
    private enum FirstUser {
        static let nickname = "kot_Bali"
        static let comment = "понравился ваш комментарий: классные очки"
        static let nameForUserImage = "ava"
        static let contentNameImage = "kot1"
        static let time = "5ч."
    }
    
    private enum SecondUser {
        static let nickname = "kot_Kokos"
        static let comment = "понравился ваш комментарий: чилишь)"
        static let nameForUserImage = "kot4"
        static let contentNameImage = "kot1"
        static let time = "6ч."
    }
    
    private enum ThirdUser {
        static let nickname = "kot_Varvar"
        static let comment = "подписался(-ась) на ваши обновления."
        static let nameForUserImage = "kot5"
        static let emptyString = ""
        static let time = "1нед."
    }
    
    private enum HeaderSections {
        static let today = "Сегодня"
        static let yearstoday = "Вчера"
        static let lastWeak = "На прошлой недели"
    }
    
    // MARK: IBOutlet
    @IBOutlet private var likesTableView: UITableView!
    
    // MARK: Private properties
    private let sections: [Sections] = [.zapros, .today, .yearstoday, .lastWeak]
    private let infoCell: [Info] = [
        Info(
            nickname: FirstUser.nickname,
            comment: FirstUser.comment,
            userImageName: FirstUser.nameForUserImage,
            contentImageName: FirstUser.contentNameImage,
            isFollow: nil,
            time: FirstUser.time),
        Info(
            nickname: SecondUser.nickname,
            comment: SecondUser.comment,
            userImageName: SecondUser.nameForUserImage,
            contentImageName: SecondUser.contentNameImage,
            isFollow: nil,
            time: SecondUser.time),
        Info(
            nickname: SecondUser.nickname,
            comment: SecondUser.comment,
            userImageName: SecondUser.nameForUserImage,
            contentImageName: SecondUser.contentNameImage,
            isFollow: true,
            time: SecondUser.time),
        Info(
            nickname: ThirdUser.nickname,
            comment: ThirdUser.comment,
            userImageName: ThirdUser.nameForUserImage,
            contentImageName: ThirdUser.emptyString,
            isFollow: false,
            time: ThirdUser.time)
    ]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createRefresh()
    }
    
    // MARK: Private Methods
    @objc private func refreshControlAction(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.likesTableView.refreshControl?.endRefreshing()
        }
    }
    
    private func createRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        likesTableView.refreshControl = refreshControl
        refreshControl.addTarget(self,
                                 action: #selector(refreshControlAction),
                                 for: .valueChanged)
    }
}

// MARK: TableViewDelegate, TableViewDataSource
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
            label.text = HeaderSections.today
        case .yearstoday:
            label.text = HeaderSections.yearstoday
        case .lastWeak:
            label.text = HeaderSections.lastWeak
        default:
            break
        }
        return label
    }
}
