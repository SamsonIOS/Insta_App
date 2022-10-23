//
//  FollowedTableViewCell.swift
//  Instagram_App
//
//  Created by coder on 23.10.2022.
//

import UIKit

/// ячейка с кнопкой подписаться/вы подписаны
final class FollowedTableViewCell: UITableViewCell {

    // MARK: IBOutlet
    @IBOutlet private weak var userImageView: UIImageView!
    @IBOutlet private weak var infoUser: UILabel!
    @IBOutlet private weak var followedButtons: UIButton!
    
    // MARK: Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Public Methods
    func createUser(_ model: Info) {
        userImageView.image = UIImage(named: model.userImageName)
        infoUser.text = model.nickname
        infoUser.text = model.comment
        infoUser.text = model.time
        infoUser.attributedText = setupDeliveryDateLabel(post: model)
        
        guard let follow = model.isFollow else { return }
        if follow {
            followedButtons.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
            followedButtons.backgroundColor = UIColor(named: "colorGray")
            followedButtons.setTitle("Вы подписаны", for: .normal)
        } else {
            followedButtons.backgroundColor = UIColor(named: "blueColor")
            followedButtons.setTitle("Подписаться", for: .normal)
            followedButtons.titleLabel?.font = .systemFont(ofSize: 13, weight: .semibold)
        }
    }

}

// MARK: Extension + FollowedTableViewCell
extension FollowedTableViewCell {
    private func setupDeliveryDateLabel(post: Info) -> NSMutableAttributedString {
        let myMutableString = NSMutableAttributedString(string: "\(post.nickname) \(post.comment) \(post.time)")
            myMutableString.addAttribute(
                NSAttributedString.Key.font,
                value: UIFont.systemFont(ofSize: 12, weight: .bold),
                range: NSRange(location: 0, length: post.nickname.count)
            )
            myMutableString.addAttribute(
                NSAttributedString.Key.font,
                value: UIFont.systemFont(ofSize: 12, weight: .regular),
                range: NSRange(location: post.nickname.count + 1, length: post.comment.count)
            )
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: UIColor(named: "colorGray") ?? "",
            range: NSRange(location: post.nickname.count + post.comment.count + 1, length: post.time.count + 1)
    )
            return myMutableString
        }
}
