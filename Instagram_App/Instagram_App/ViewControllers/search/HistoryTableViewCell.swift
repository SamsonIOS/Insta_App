//
//  HistoryTableViewCell.swift
//  Instagram_App
//
//  Created by coder on 23.10.2022.
//

import UIKit

/// Ячейка историй
final class HistoryTableViewCell: UITableViewCell {
    
    // MARK: Constants
    private enum Constants {
        static let idCell = "ImageCollectionCell"
    }
    
    private enum HistoryImageName {
        static let first = "kot1"
        static let seconds = "kot2"
        static let third = "kot3"
        static let fourth = "kot4"
        static let five = "kot5"
        static let six = "kot6"
        static let seven = "kot8"
        static let eight = "kot9"
    }
    
    private enum HistoryLabelText {
        static let first = "Море"
        static let seconds = "Бали"
        static let third = "Чил"
        static let fourth = "Очки"
        static let five = "Море"
        static let six = "Красивое"
        static let seven = "Бизнес"
        static let eigth = "Грива"
    }
    // MARK: IBOutlet
    @IBOutlet private weak var collectionHistory: UICollectionView!
    
    // MARK: Private Methods
    private let historyInfo = [
        Collection(nameImage: HistoryImageName.first, nameHistory: HistoryLabelText.first),
        Collection(nameImage: HistoryImageName.seconds, nameHistory: HistoryLabelText.seconds),
        Collection(nameImage: HistoryImageName.third, nameHistory: HistoryLabelText.third),
        Collection(nameImage: HistoryImageName.fourth, nameHistory: HistoryLabelText.fourth),
        Collection(nameImage: HistoryImageName.five, nameHistory: HistoryLabelText.five),
        Collection(nameImage: HistoryImageName.six, nameHistory: HistoryLabelText.six),
        Collection(nameImage: HistoryImageName.seven, nameHistory: HistoryLabelText.seven),
        Collection(nameImage: HistoryImageName.eight, nameHistory: HistoryLabelText.eigth),
    ]
    
    // MARK: Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
    }
    
    // MARK: Private Methods
    private func setDelegate() {
        collectionHistory.delegate = self
        collectionHistory.dataSource = self
    }
}

// MARK: UICollectionViewDataSource, UICollectionViewDelegate
extension HistoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return historyInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.idCell, for: indexPath) as? HistoriCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configHistory(historyInfo[indexPath.row])
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HistoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = collectionView.frame
        let widhtCell = frame.width / CGFloat(5.2)
        let heightCell = widhtCell + 10
        return CGSize(width: widhtCell, height: heightCell)
    }
}
