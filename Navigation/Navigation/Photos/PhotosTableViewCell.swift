//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Alena Vasenina on 04.01.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
 
    
    private var titlePhotosLabel: UILabel = {
        let title = UILabel()
        title.text = "Photos"
        title.textColor = .black
        title.font = .systemFont(ofSize: 24, weight: .bold)
        return title
    }()
    
    private var seeMoreButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.addTarget(self, action: #selector(didTapPhotoGallery), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        UIImage.photos.prefix(4).map { makeImageView(imageName: $0) } .forEach { stack.addArrangedSubview($0) }
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()
    
    var onTapSeeMore: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(titlePhotosLabel, seeMoreButton, stackView)
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapPhotoGallery() { onTapSeeMore?() }
    
    func makeImageView(imageName: String) -> UIImageView {
        let photos = UIImageView(image: UIImage(named: imageName))
        photos.widthAnchor.constraint(equalTo: photos.heightAnchor).isActive = true
        photos.clipsToBounds = true
        photos.layer.cornerRadius = 6
        photos.contentMode = .scaleAspectFill
        return photos
    }
    
    func setupConstrains() {
        
        titlePhotosLabel.toAutoLayout()
        seeMoreButton.toAutoLayout()
        stackView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            titlePhotosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titlePhotosLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titlePhotosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        
            seeMoreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            seeMoreButton.centerYAnchor.constraint(equalTo: titlePhotosLabel.centerYAnchor),
        
            stackView.topAnchor.constraint(equalTo: titlePhotosLabel.bottomAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
        ])
    }
}
