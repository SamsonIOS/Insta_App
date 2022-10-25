//
//  SearchViewController.swift
//  Instagram_App
//
//  Created by coder on 17.10.2022.
//

import UIKit

/// Экран с поиском фото , видео постов
final class SearchViewController: UIViewController {
    
    // MARK: Constants
    private enum IdCell {
        static let userCell = "infoUser"
        static let infoMan = "infoMan"
        static let history = "historyCell"
        static let buttonCell = "buttonCell"
        static let historyCell = "ImageCollectionCell"
        static let post = "postCell"
        static let postImageCell = "imageCell"
    }
    
    private enum ImageViewName {
        static let first = "kot1"
        static let second = "kot2"
        static let third = "kot3"
        static let fourth = "kot4"
        static let five = "kot5"
        static let six = "kot10"
        static let seven = "kot7"
        static let eight = "kot8"
        static let nine = "kot9"
    }
    
    // MARK: Private propertis
    private let photos = [
        Post(nameImage: ImageViewName.first),
        Post(nameImage: ImageViewName.second),
        Post(nameImage: ImageViewName.third),
        Post(nameImage: ImageViewName.fourth),
        Post(nameImage: ImageViewName.five),
        Post(nameImage: ImageViewName.six),
        Post(nameImage: ImageViewName.seven),
        Post(nameImage: ImageViewName.eight),
        Post(nameImage: ImageViewName.nine)
    ]
}

// MARK: UITableViewDelegate, UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdCell.userCell, for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdCell.infoMan, for: indexPath)
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: IdCell.history,
                for: indexPath) as? HistoryTableViewCell
            else { return UITableViewCell() }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdCell.buttonCell, for: indexPath)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: IdCell.post, for: indexPath)
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension SearchViewController:
    UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: IdCell.postImageCell, for: indexPath) as? PostCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.configCell(photos[indexPath.row])
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let frame = collectionView.frame
        let widhtCell = frame.width / CGFloat(3)
        let heightCell = widhtCell
        
        return CGSize(width: widhtCell, height: heightCell)
    }
}
