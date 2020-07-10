//
//  AlbumTableViewController.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/6/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import UIKit

class AlbumTableViewController: BaseController {

    var rssTableView = RSSUITableView()
    var datasource: [AlbumViewModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Feed Results Preview"
        attachTableView()
        DispatchQueue.global().async {
            self.fetchAlbumsFromRSS()
        }
    }
    
    func fetchAlbumsFromRSS() {
        ServerAPI.defaultAPI.fetchAlbumFromRSS { (result) in
            switch result {
            case .success(let albums):
                for album in albums {
                    self.datasource.append(AlbumViewModel(with: album))
                }
                
                DispatchQueue.main.async {
                    self.rssTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func attachTableView() {
        view.addSubview(rssTableView)
        rssTableView.setConstraintsWithView(self.view)
        rssTableView.dataSource = self
        rssTableView.delegate = self
        rssTableView.rowHeight = TableViewConstants.TABLE_CELL_HEIGHT
        rssTableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: TableViewConstants.TABLE_VIEW_CELL_ID)
        rssTableView.accessibilityIdentifier = TableViewConstants.TABLE_VIEW_ACCESSIBILITY_ID
    }

}

extension AlbumTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewConstants.TABLE_VIEW_CELL_ID) as? AlbumTableViewCell else {
            return UITableViewCell()
        }
        let albumViewModel = datasource[indexPath.row]
        cell.albumViewModel = albumViewModel
        cell.accessibilityIdentifier = TableViewConstants.accessibilityIDForTableRow(indexPath.row)
        return cell
    }
    
    
}

extension AlbumTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAlbum = datasource[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.albumViewModel = selectedAlbum
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
