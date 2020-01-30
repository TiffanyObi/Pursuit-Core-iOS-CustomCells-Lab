//
//  RandomUserCell.swift
//  ProgrammaticUserCells
//
//  Created by Tiffany Obi on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class RandomUserCell: UICollectionViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
        
        @IBOutlet weak var userNameLabel: UILabel!
        
        
        @IBOutlet weak var userPhoneNumberLabel: UILabel!
        
        @IBOutlet weak var userLocationLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.backgroundColor = .systemGreen
    }
        
        
    
        public func configureCell( for randomUser: User){
            
           
            
            userImageView.getImage(with: randomUser.picture.medium) { [weak self] (result) in
                switch result {
                case .failure:
                    
                    DispatchQueue.main.async {
                        self?.userImageView.image = UIImage(named: "circle")
                    }
                    
                case .success(let image):
                    
                    DispatchQueue.main.async {
                        self?.userImageView.image = image
                    }
                }
            }
            
            userNameLabel.text = "\(randomUser.name.first) \(randomUser.name.last)"
            
            userPhoneNumberLabel.text = randomUser.phone
            
            userLocationLabel.text = "\(randomUser.location.city), \(randomUser.location.state)"
            
            
        }
        
    }
