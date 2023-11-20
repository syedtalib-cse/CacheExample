//
//  SecondViewController.swift
//  CacheExample
//
//  Created by Talib on 15/06/23.
//

import UIKit

class SecondViewController: UIViewController {
    private let imageView:UIImageView = {
        let imageView  = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGray4
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            
            imageView.widthAnchor.constraint(equalToConstant:300),
            imageView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo:view.centerYAnchor)
            
            
        ])
        ImageProvider.shared.fetchImage {[weak self] image in
            self?.imageView.image = image
        }
    }
    

}
