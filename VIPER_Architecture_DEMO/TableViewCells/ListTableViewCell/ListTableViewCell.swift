//
//  ListTableViewCell.swift
//  ViperDemo
//
//  Created by Apple on 15/11/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgCollectionView: UICollectionView!
    
    private var images: [DataStory]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func setUpCollectionView() {
        ImgCollectionView.delegate = self
        ImgCollectionView.dataSource = self
        ImgCollectionView.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionViewCell")
    }
    func getData(images: [DataStory]?) {
        self.images = images
        DispatchQueue.main.async {
            self.ImgCollectionView.reloadData()
        }
    }
}

extension ListTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.bindData(imgUrlString: images?[indexPath.row].promoLarge)
        return cell
    }
    
    
}

