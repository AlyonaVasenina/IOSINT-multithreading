//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alena Vasenina on 23.12.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            titlePostLabel.text = post.title
            imagePostView.image = UIImage(named: post.image)
            textPostLabel.text = post.description
            likesLabel.text = "Likes: \(post.likes)"
            viewsLabel.text = "Views: \(post.views)"
        }
    }
        
    private var titlePostLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    
    private var imagePostView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var textPostLabel: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 14, weight: .regular)
        text.textColor = .systemGray
        text.numberOfLines = 0
        return text
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.addArrangedSubviews(likesLabel, viewsLabel)
        stack.axis = .horizontal
        stack.distribution = .fill
        return stack
    }()
    
    private var likesLabel: UILabel = {
        let likes = UILabel()
        likes.font = .systemFont(ofSize: 16, weight: .regular)
        likes.textColor = .black
        return likes
    }()
    
    private var viewsLabel: UILabel = {
        let views = UILabel()
        views.font = .systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        return views
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubviews(titlePostLabel, imagePostView, textPostLabel, stackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        titlePostLabel.toAutoLayout()
        imagePostView.toAutoLayout()
        textPostLabel.toAutoLayout()
        stackView.toAutoLayout()
        
        NSLayoutConstraint.activate([
            titlePostLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titlePostLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            titlePostLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        
            imagePostView.topAnchor.constraint(equalTo: titlePostLabel.bottomAnchor, constant: 12),
            imagePostView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imagePostView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imagePostView.heightAnchor.constraint(equalTo: imagePostView.widthAnchor),
        
            textPostLabel.topAnchor.constraint(equalTo: imagePostView.bottomAnchor, constant: 16),
            textPostLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            textPostLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -16),
        
            stackView.topAnchor.constraint(equalTo: textPostLabel.bottomAnchor, constant: 16),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
