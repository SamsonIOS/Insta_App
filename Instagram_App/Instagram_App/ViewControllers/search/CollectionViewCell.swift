//
//  CollectionViewCell.swift
//  Instagram_App
//
//  Created by coder on 23.10.2022.
//

import UIKit

/// ячейка collection view
final class PostCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlet
    @IBOutlet private weak var postImageView: UIImageView!
    
    // MARK: Public Methods
    func configCell(_ name: Post) {
        postImageView.image = UIImage(named: name.nameImage)
    }
    
}
