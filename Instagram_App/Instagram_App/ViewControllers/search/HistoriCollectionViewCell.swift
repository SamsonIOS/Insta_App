//
//  HistoriCollectionViewCell.swift
//  Instagram_App
//
//  Created by coder on 24.10.2022.
//

import UIKit

/// ячейка с нашими историями 
final class HistoriCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlet
    @IBOutlet private weak var historyImageView: UIImageView!
    @IBOutlet private weak var historyLabel: UILabel!
    
    // MARK: Public MEthods
    func configHistory(_ model: CollectionCell, index: Int) {
        historyImageView.image = UIImage(named: model.nameImage[index])
        historyLabel.text = model.nameHistory[index]
    }
}
