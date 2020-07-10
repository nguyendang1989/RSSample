//
//  Feed.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/7/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import Foundation

struct Feed: Codable {
    let title: String
    let results: [Album]
}
