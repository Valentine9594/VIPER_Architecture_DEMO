//
//  HomeTableViewCell.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    //MARK: IBOutlets
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func bindData(story: DataStory?) {
        lblTitle.text = story?.title ?? "Title"
        lblDetail.text = story?.updatedOn ?? "12/10/2022"
        lblDescription.text = story?.storyDescription ?? "Description"
        imgNews.setImageFromURL(in: story?.promoLarge)
    }
}
