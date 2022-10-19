//
//  ViewController.swift
//  Instagram_App
//
//  Created by coder on 17.10.2022.
//

import UIKit

/// Экран ленты инстаграма с историями, постами и рекомендациями
final class HomeViewController: UIViewController {

    // MARK: Private visual properties
    private enum Identfier {
        static let history = "history"
        static let post = "post"
        static let recomendation = "recomendation"
    }
    
    // MARK: @IBOutlet
    @IBOutlet weak var instagramTableView: UITableView!
    
    // MARK: Private properties
    private let identifierHistory = Identfier.history
    private let identifierPost = Identfier.post
    private let identifierRec = Identfier.recomendation
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        createRefresh()
    }
    
    // MARK: @Objc private action
    @objc private func refreshControlAction(sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.instagramTableView.refreshControl?.endRefreshing()
        }
    }
    
    // MARK: Private Methods
    private func setView() {
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    private func createRefresh() {
          let refreshControl = UIRefreshControl()
          refreshControl.tintColor = .white
          instagramTableView.refreshControl = refreshControl
          refreshControl.addTarget(self,
                                   action: #selector(refreshControlAction),
                                   for: .valueChanged)
      }
}

 // MARK: HomeViewController + UITableViewDelegate, UITableViewDataSource
 extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierHistory, for: indexPath)
            return cell
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: identifierPost, for: indexPath)
            return cell2
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: identifierRec, for: indexPath)
            return cell
            
        case 3, 4, 5, 6, 7:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: identifierPost, for: indexPath)
            return cell2
        default:
            break
        }
        return UITableViewCell()
    }
     
 }
