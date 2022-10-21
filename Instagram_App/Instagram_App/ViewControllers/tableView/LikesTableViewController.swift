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
        static let firstLike = "comment"
        static let secondLike = "follow"
        static let thirdLike = "followed"
    }
    
    private enum Sections {
        case today
        case yearstoday
        case lastWeak
    }

    // MARK: Private properties
    private let sections: [Sections] = [.today, .yearstoday, .lastWeak]
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    
// MARK: Extension + LikesTableViewController
extension LikesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .today:
            return 3
        case .yearstoday:
            return 4
        case .lastWeak:
            return 5
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        
        case .today:
            switch indexPath.row % 3 {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.firstLike,
                                                         for: indexPath)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.secondLike,
                                                         for: indexPath)
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.thirdLike,
                                                         for: indexPath)
                return cell
            default:
                break
            }

        case .yearstoday:
            switch indexPath.row % 3 {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.firstLike, for: indexPath)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.firstLike,
                                                         for: indexPath)
                return cell
            case 2, 3, 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.thirdLike,
                                                         for: indexPath)
                return cell
            default:
                break
            }
            
        case .lastWeak:
            switch indexPath.row % 3 {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.firstLike, for: indexPath)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.secondLike,
                                                         for: indexPath)
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: Constants.thirdLike,
                                                         for: indexPath)
                return cell
            default:
                break
            }
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .today, .yearstoday, .lastWeak:
            return 40
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)

        switch sections[section] {
        case .today:
            label.text = "сегодня"
        case .yearstoday:
            label.text = "вчера"
        case .lastWeak:
            label.text = "на прошлой недели"
        }
        return label
    }
}
