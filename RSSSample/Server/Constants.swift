//
//  Constants.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/7/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import Foundation
import UIKit

struct URLConstants {
    static let baseURL = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
}

struct TableViewConstants {
    static let TABLE_CELL_HEIGHT: CGFloat = 120.00
    static let TABLE_VIEW_CELL_ID = "TABLE_VIEW_CELL_ID"
    static let TABLE_CELL_ARTIRST_NAME_FONT_SIZE: CGFloat = 13.0
    static let TABLE_CELL_ALBUM_NAME_FONT_SIZE: CGFloat = 16.0
    static let TABLE_CELL_ARTIST_LABEL_HEIGHT: CGFloat = 40.0
    static let TABLE_CELL_ALBUM_NAME_HEIGHT: CGFloat = 30.0
    static let TABLE_CELL_DEFAUL_SPACING: CGFloat = 10.0
    
    static let TABLE_VIEW_ACCESSIBILITY_ID = "tableViewAccessibilityIdentifier"
    static func accessibilityIDForTableRow(_ row: Int) -> String {
        return "rowAccessibilityIdentifier " + String(row)
    }
    static let TABLE_VIEW_CELL_ACESSIBILITY_ID_ALBUM_NAME = "TABLE_VIEW_CELL_ACESSIBILITY_ID_ALBUM_NAME"
    static let TABLE_VIEW_CELL_ACESSIBILITY_ID_ARTIST_NAME = "TABLE_VIEW_CELL_ACESSIBILITY_ID_ARTIST_NAME"
    static let TABLE_VIEW_CELL_ACESSIBILITY_ID_ALBUM_IMAGE = "TABLE_VIEW_CELL_ACESSIBILITY_ID_ALBUM_IMAGE"
}

struct DetailViewConstants {
    static let DEFAULT_SPACING: CGFloat = 20
    static let DEFAULT_LABEL_HEIGHT: CGFloat = 40
    static let ITUNE_BUTTON_HEIGHT: CGFloat = 50
    
    enum AcessibilityID: String {
        case albumName = "albumName"
        case artistname = "artistname"
        case genres = "genres"
        case releasedDate = "releasedDate"
        case copyright = "copyright"
        case albumImage = "albumImage"
        case ituneButton = "ituneButton"
    }
}
