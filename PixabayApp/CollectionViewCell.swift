//
//  CollectionViewCell.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: CustomImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }
    
    func configureCell(photoViewModel: PhotoViewModel) {
        self.imageView.loadImageWithUrlString(url: photoViewModel.previewURL)
    }

}

