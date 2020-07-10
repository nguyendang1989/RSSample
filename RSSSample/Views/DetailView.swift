//
//  DetailViewController.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/8/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    var ituneAction: (() -> Void)?
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.accessibilityIdentifier = DetailViewConstants.AcessibilityID.albumImage.rawValue
        return imageView
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkText
        label.accessibilityIdentifier = DetailViewConstants.AcessibilityID.artistname.rawValue
        return label
    }()
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkText
        label.accessibilityIdentifier = DetailViewConstants.AcessibilityID.albumName.rawValue
        return label
    }()
    
    let copyrightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkText
        label.accessibilityIdentifier = DetailViewConstants.AcessibilityID.copyright.rawValue
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkText
        label.accessibilityIdentifier = DetailViewConstants.AcessibilityID.genres.rawValue
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.italicSystemFont(ofSize: 13)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkText
        label.accessibilityIdentifier = DetailViewConstants.AcessibilityID.releasedDate.rawValue
        return label
    }()
    
    let ituneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Open in Itunes", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.accessibilityIdentifier = DetailViewConstants.AcessibilityID.ituneButton.rawValue
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        configureConstraints()
        ituneButton.addTarget(self, action: #selector(didTouchUpInsideItuneAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureConstraints() {
        addSubview(albumImageView)
        addSubview(albumNameLabel)
        addSubview(artistNameLabel)
        addSubview(copyrightLabel)
        addSubview(genreLabel)
        addSubview(releaseDateLabel)
        addSubview(ituneButton)
        setConstraintsForAlbumImageView()
        setConstraintsForAlbumNameLabel()
        setConstraintsForArtistNameLabel()
        setConstraintsForCopyrightLabel()
        setConstraintsForGenreLabel()
        setConstraintsForReleaseDateLabel()
        setConstraintsForItuneButton()
    }
    
    func parseAlbumViewModel(_ albumViewModel: AlbumViewModel?) {
        guard let albumVM = albumViewModel else {
            return
        }
        albumImageView.loadImage(albumVM.artworkUrl100)
        albumNameLabel.text = albumVM.name
        artistNameLabel.text = albumVM.artistName
        copyrightLabel.text = albumVM.copyright
        genreLabel.text = albumVM.genres.map{$0.name}.joined(separator: "/")
        releaseDateLabel.text = albumVM.releaseDate
    }
    
    //MARK: Constraints Setting
    
    func setConstraintsForAlbumImageView() {
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        albumImageView.contentMode = .scaleAspectFit
        albumImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        albumImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        albumImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        albumImageView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    func setConstraintsForAlbumNameLabel() {
        
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: -10).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: DetailViewConstants.DEFAULT_LABEL_HEIGHT).isActive = true
    }
    
    func setConstraintsForArtistNameLabel() {
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: -10).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: DetailViewConstants.DEFAULT_LABEL_HEIGHT).isActive = true
    }
    
    func setConstraintsForCopyrightLabel() {
        copyrightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyrightLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: -10).isActive = true
        copyrightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        copyrightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        copyrightLabel.heightAnchor.constraint(equalToConstant: DetailViewConstants.DEFAULT_LABEL_HEIGHT).isActive = true
    }
    
    func setConstraintsForGenreLabel() {
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.topAnchor.constraint(equalTo: copyrightLabel.bottomAnchor, constant: -10).isActive = true
        genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        genreLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        genreLabel.heightAnchor.constraint(equalToConstant: DetailViewConstants.DEFAULT_LABEL_HEIGHT).isActive = true
    }
    
    func setConstraintsForReleaseDateLabel() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: -10).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: DetailViewConstants.DEFAULT_LABEL_HEIGHT).isActive = true
    }
    
    func setConstraintsForItuneButton() {
        ituneButton.translatesAutoresizingMaskIntoConstraints = false
        ituneButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DetailViewConstants.DEFAULT_SPACING).isActive = true
        ituneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        ituneButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -DetailViewConstants.DEFAULT_SPACING).isActive = true
        ituneButton.heightAnchor.constraint(equalToConstant: DetailViewConstants.ITUNE_BUTTON_HEIGHT).isActive = true
    }
    
    @objc func didTouchUpInsideItuneAction() {
        ituneAction?()
    }
}
