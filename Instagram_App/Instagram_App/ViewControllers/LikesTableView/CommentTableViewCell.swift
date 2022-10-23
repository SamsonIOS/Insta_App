//
//  CommentTableViewCell.swift
//  Instagram_App
//
//  Created by coder on 23.10.2022.
//

import UIKit

/// ячейка с комментариями
final class CommentTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentImageView: UIImageView!
    
    // MARK: Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Public Methods
    func createInfo(_ model: Info) {
        userImageView.image = UIImage(named: model.userImageName)
        commentLabel.text = model.nickname
        commentLabel.text = model.comment
        commentLabel.text = model.time
        commentLabel.attributedText = setupDeliveryDateLabel(post: model)
        commentImageView.image = UIImage(named: model.contentImageName)
    }
    
}

// MARK: Extension + CommentTableViewCell
extension CommentTableViewCell {
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
