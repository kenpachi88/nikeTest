//
//  ViewController.swift
//  nikeTest
//
//  Copyright © 2020 hireMeKennyChen. All rights reserved.
//

import UIKit

class AlbumListViewController: UIViewController {
    var albums: [Album]?
    var imgs: [UIImage]?
    var tasks = [URLSessionTask]()
    weak var delegate: AlbumListViewControllerDelegate?
    var safeArea: UILayoutGuide!
    let tableView = UITableView()
    
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemPink
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "albumListCell")
        self.view.addSubview(tableView)
        
        tableView.anchor(top: safeArea.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.size.width, height: view.frame.size.height, enableInsets: true)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension

    }
}



extension AlbumListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "albumListCell", for: indexPath) as? AlbumTableViewCell else {return UITableViewCell()}
        if var album = albums?[indexPath.row] {
            if let url = album.artworkUrl {
            URLSession.shared.dataTask(with: url ) { (data, response, error) in
                    album.imageData = data
                DispatchQueue.main.async{
                cell.configureWithAlbum(album)
                }
                }
            }

        }
        return cell
    }
}
extension AlbumListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Top 100 Albums"
    }
}
