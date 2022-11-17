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
    
    func bindData(story: User?) {
        lblTitle.text = (story?.title) ?? "Title"
        lblDetail.text = "\(story?.id ?? 0)"
        lblDescription.text = "\(story?.completed ?? false)"
        imgNews.setImageFromURL(in: story?.title!)
    }
}
