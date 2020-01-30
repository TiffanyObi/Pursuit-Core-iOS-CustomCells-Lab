//
//  UserDetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Tiffany Obi on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

import ImageKit

class UserDetailViewController: UIViewController {
    
    let detailView = DetailView()

    var randomUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = detailView
        view.backgroundColor = .white
        updateUI()
    }
    
    private func updateUI() {
        detailView.imageView.getImage(with: randomUser.picture.large) { [weak self](result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.detailView.imageView.image = UIImage(named: "circle")
                }
            case .success(let image):
                
                DispatchQueue.main.async {
                    self?.detailView.imageView.image = image
                }
                
            }
        }
        
        detailView.nameLabel.text = "\(randomUser.name.first) \(randomUser.name.last)"
        
        
    }

}

