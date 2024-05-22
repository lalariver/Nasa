//
//  CollectionViewCell.swift
//  Nasa
//
//  Created by user on 2024/5/9.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var imageURLString: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
    }
    
    public func updateWithModel(nasaDatum: NasaDatum) {
        self.titleLabel.text = nasaDatum.title
        self.imageURLString = nasaDatum.url
        
        FetchImageManager.shared.fetchImage(url: imageURLString) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard nasaDatum.url == self.imageURLString else { return }
                self.imageView.image = image
            }
        }
    }
}
