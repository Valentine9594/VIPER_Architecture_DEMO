//
//  ListCollectionViewCell.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import UIKit
import SDWebImage

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionCellImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func bindData(imgUrlString: String?) {
        let imgUrl = URL(string: imgUrlString ?? "")
        collectionCellImg.sd_setImage(with: imgUrl, placeholderImage: UIImage(systemName: "photo.artframe"))
    }
}
