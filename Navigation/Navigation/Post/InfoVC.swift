//
//  InfoVC.swift
//  Navigation
//
//  Created by Alena Vasenina on 29.10.2021.
//

import UIKit

class InfoVC: UIViewController {
    
    private lazy var alertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 80, y: 100, width: 200, height: 50))
        button.setTitle("Show alert", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapAlert), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(alertButton)
    }

    @objc func didTapAlert() {
        let alertVC = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: { _ in print("Ok") })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in print("Cancel") })
        alertVC.addAction(ok)
        alertVC.addAction(cancel)
        present(alertVC, animated: true)
    }
}
