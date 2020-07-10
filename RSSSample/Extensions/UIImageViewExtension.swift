//
//  UIImageViewExtension.swift
//  RSSSample
//
//  Created by Nguyen Hai Dang on 7/7/20.
//  Copyright © 2020 Hai Dang Nguyen. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(_ url: String?) {
        if let url = url {
            guard let url = URL(string: url) else { return }
            DispatchQueue.global().async { [weak self] in
                if let imgData = try? Data(contentsOf: url) {
                    if let image = UIImage(data: imgData) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        } else {
            let homeSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 65, weight: .black)
            self.image = UIImage(systemName: "album", withConfiguration: homeSymbolConfiguration)
        }
    }
}
