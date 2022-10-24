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
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: Public Methods
    func configCell(_ model: PostCell, index: Int) {
        postImageView.image = UIImage(named: model.nameImage[index])
    }
    
}
