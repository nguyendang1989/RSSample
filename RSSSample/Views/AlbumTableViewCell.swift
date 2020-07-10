//
//  AlbumTableViewCell.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/7/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    var artistNameLbl = UILabel()
    var albumNameLbl = UILabel()
    var albumImageView = UIImageView()
    var albumViewModel: AlbumViewModel? {
        didSet {
            albumNameLbl.text = albumViewModel?.name
            artistNameLbl.text = albumViewModel?.artistName
            albumImageView.loadImage(albumViewModel?.artworkUrl100)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(artistNameLbl)
        addSubview(albumNameLbl)
        addSubview(albumImageView)
        
        
        configAlbumImageView()
        configAlbumNameLabel()
        configArtistNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init is not implemented")
    }
    
    func configAlbumImageView() {
        albumImageView.layer.cornerRadius = 10
        albumImageView.clipsToBounds = true
        albumImageView.backgroundColor = .clear
        albumImageView.accessibilityIdentifier = TableViewConstants.TABLE_VIEW_CELL_ACESSIBILITY_ID_ALBUM_IMAGE
        setConstraintsForImageView()
    }
    
    func configAlbumNameLabel() {
        albumNameLbl.numberOfLines = 0
        albumNameLbl.font = UIFont.boldSystemFont(ofSize: TableViewConstants.TABLE_CELL_ALBUM_NAME_FONT_SIZE)
        albumNameLbl.adjustsFontSizeToFitWidth = true
        albumNameLbl.backgroundColor = .clear
        albumNameLbl.accessibilityIdentifier = TableViewConstants.TABLE_VIEW_CELL_ACESSIBILITY_ID_ALBUM_NAME
        setConstraintsForAlbumNameLabel()
    }

    func configArtistNameLabel() {
        artistNameLbl.numberOfLines = 0
        artistNameLbl.font = UIFont.italicSystemFont(ofSize: TableViewConstants.TABLE_CELL_ARTIRST_NAME_FONT_SIZE)
        artistNameLbl.adjustsFontSizeToFitWidth = true
        artistNameLbl.backgroundColor = .clear
        artistNameLbl.accessibilityIdentifier = TableViewConstants.TABLE_VIEW_CELL_ACESSIBILITY_ID_ARTIST_NAME
        setConstraintsForArtistNameLabel()
    }
    
    func setConstraintsForImageView() {
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: TableViewConstants.TABLE_CELL_DEFAUL_SPACING).isActive = true
        albumImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -TableViewConstants.TABLE_CELL_DEFAUL_SPACING).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: TableViewConstants.TABLE_CELL_DEFAUL_SPACING).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: TableViewConstants.TABLE_CELL_HEIGHT - 2*TableViewConstants.TABLE_CELL_DEFAUL_SPACING).isActive = true
        albumImageView.widthAnchor.constraint(equalTo: albumImageView.heightAnchor, multiplier: 1.0).isActive = true
    }
    
    func setConstraintsForAlbumNameLabel() {
        albumNameLbl.translatesAutoresizingMaskIntoConstraints = false
        albumNameLbl.leadingAnchor.constraint(equalTo: albumImageView.trailingAnchor, constant: TableViewConstants.TABLE_CELL_DEFAUL_SPACING).isActive = true
        albumNameLbl.topAnchor.constraint(equalTo: albumImageView.topAnchor).isActive = true
        albumNameLbl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -TableViewConstants.TABLE_CELL_DEFAUL_SPACING).isActive = true
        albumNameLbl.heightAnchor.constraint(equalToConstant: TableViewConstants.TABLE_CELL_ALBUM_NAME_HEIGHT).isActive = true
    }
    
    func setConstraintsForArtistNameLabel() {
        artistNameLbl.translatesAutoresizingMaskIntoConstraints = false
        artistNameLbl.topAnchor.constraint(equalTo: albumNameLbl.bottomAnchor, constant: -TableViewConstants.TABLE_CELL_DEFAUL_SPACING).isActive = true
        artistNameLbl.leadingAnchor.constraint(equalTo: albumNameLbl.leadingAnchor).isActive = true
        artistNameLbl.trailingAnchor.constraint(equalTo: albumNameLbl.trailingAnchor).isActive = true
        artistNameLbl.heightAnchor.constraint(equalToConstant: TableViewConstants.TABLE_CELL_ARTIST_LABEL_HEIGHT).isActive = true
    }
    
}
