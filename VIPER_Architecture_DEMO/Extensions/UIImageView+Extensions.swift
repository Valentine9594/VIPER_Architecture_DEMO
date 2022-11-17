//
//  UIImageView+Extensions.swift
//  VIPER_Architecture_DEMO
//
//  Created by Neosoft on 16/11/22.
//

import UIKit
import SDWebImage

extension UIImageView {
    @nonobjc func setImageFromURL(in urlString: String?) {
        self.sd_setImage(with: URL(string: urlString ?? ""), placeholderImage: UIImage(systemName: "photo.artframe"), completed: nil)
    }
}
