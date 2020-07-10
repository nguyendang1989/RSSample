//
//  Album.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/7/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import Foundation

struct Album: Codable {
    let id: String
    let artistName: String
    let releaseDate: String
    let name: String
    let copyright: String
    let genres: [Genres]
    let artworkUrl100: String
    let url: String
}
