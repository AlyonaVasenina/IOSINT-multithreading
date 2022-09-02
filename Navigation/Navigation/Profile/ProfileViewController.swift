//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alena Vasenina on 04.11.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var model: [Post] = Post.testPosts
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        return tableView
    }()
    
    lazy var gesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
    
    lazy var coverView: UIView = {
        let cover = UIView()
        cover.isHidden = true
        cover.backgroundColor = .white.withAlphaComponent(0.9)
        cover.addSubviews(closeButton, avatarView)
        return cover
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var avatarView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cat"))
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var savedFrameAvatar = CGRect.zero
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Profile"
        navigationItem.backButtonTitle = "Back"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(tableView, coverView)
        setupConstraints()
    }
    
    func setupConstraints(){
        
        tableView.toAutoLayout()
        coverView.toAutoLayout()
        closeButton.toAutoLayout()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            coverView.topAnchor.constraint(equalTo: view.topAnchor),
            coverView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coverView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coverView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: coverView.trailingAnchor, constant: -16),
            
        ])
    }
    
    
    
    @objc private func handleTapGesture (gesture: UITapGestureRecognizer) {
        print("tap location: \(gesture.location(in: self.view)), state: \(gesture.state.rawValue)")
        coverView.alpha = 0
        coverView.isHidden = false
        closeButton.alpha = 0
        avatarView.frame = gesture.view!.convert(gesture.view!.bounds, to: coverView)
        savedFrameAvatar = avatarView.frame
        let imageSize = avatarView.image!.size
        var height = (coverView.bounds.width * imageSize.height) / imageSize.width
        var y: CGFloat = (coverView.bounds.height / 2.0 - height / 2.0)
        let newFrame = CGRect(x: 0, y: y, width: coverView.bounds.width, height: height)
        UIView.animate(withDuration: 0.5, animations: { self.coverView.alpha = 1; self.avatarView.frame = newFrame; self.avatarView.layer.cornerRadius = 0 }, completion: { _ in
            UIView.animate(withDuration: 0.3, animations: { self.closeButton.alpha = 1 })
        })
    }
    
    @objc private func closeButtonPressed() {
        UIView.animate(withDuration: 0.3, animations: { self.closeButton.alpha = 0 }, completion: { _ in
            UIView.animate(withDuration: 0.5, animations: { self.coverView.alpha = 0; self.avatarView.frame = self.savedFrameAvatar}, completion: { _ in self.coverView.isHidden = true })
            
        })
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return model.count + 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            cell.onTapSeeMore = { [weak self] in self?.showPhotoGallery() }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.post = model[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        header.avatarImageView.addGestureRecognizer(gesture)
        header.avatarImageView.isUserInteractionEnabled = true
        return header
    }
    
    func tableView(_: UITableView, estimatedHeightForHeaderInSection: Int) -> CGFloat {
        170
    }
    
    private func showPhotoGallery() {
        let photoVC = PhotosViewController()
        navigationController!.pushViewController(photoVC, animated: true)
    }
}

