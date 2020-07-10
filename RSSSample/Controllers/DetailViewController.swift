//
//  DetailViewController.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/8/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import UIKit

class DetailViewController: BaseController {

    var detailView: DetailView? {return view as? DetailView}
    var albumViewModel: AlbumViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = albumViewModel?.name
        self.view = DetailView(frame: UIScreen.main.bounds)
        detailView?.parseAlbumViewModel(albumViewModel)
        setActionForItunesButton()
    }

    func setActionForItunesButton() {
        #if targetEnvironment(simulator)
        print("Could not open Itunes in Simulator")
        #else
            detailView?.ituneAction = { [weak self] in
                guard let albumUrl = self?.albumViewModel?.url else { return }
                if let url = URL(string: albumUrl) {
                    UIApplication.shared.open(url)
                }
            }
        #endif
    }
}
