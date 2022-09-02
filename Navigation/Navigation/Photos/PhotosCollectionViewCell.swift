//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alena Vasenina on 10.01.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var model: String? {
        didSet {
            guard let model = model else { return }
            imageView.image = UIImage(named: model)
        }
    }
    
    private var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
         
        imageView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}
