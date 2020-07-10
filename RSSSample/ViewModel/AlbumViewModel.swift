//
//  AlbumViewModel.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/7/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    let artistName: String
    let releaseDate: String
    let name: String
    let copyright: String
    let genres: [Genres]
    let artworkUrl100: String
    let url: String
    
    init(with album: Album) {
        self.artistName = album.artistName
        self.releaseDate = album.releaseDate
        self.name = album.name
        self.copyright = album.copyright
        self.genres = album.genres
        self.artworkUrl100 = album.artworkUrl100
        self.url = album.url
    }
}
