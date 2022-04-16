//
//  PhotoDetailViewController.swift
//  PixabayApp
//
//  Created by TelloTalk on 08/03/2022.
//

import UIKit

class PhotoDetailViewController: UIViewController, StoryBoarded {
    
    var photoDetailViewModel: PhotoDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
    }
    
    func setupImageView() {
        let imageView = CustomImageView()
        view.addSubview(imageView)
        imageView.loadImageWithUrlString(url: photoDetailViewModel.imageURL)
        let screenWidth = UIScreen.main.bounds.width
        imageView.frame = CGRect(x: 0, y: 0, width: photoDetailViewModel.imageDisplayWidth(screenWidth: screenWidth), height: photoDetailViewModel.imageDisplayHeight(screenWidth: screenWidth))
        imageView.center = view.center
    }

}
