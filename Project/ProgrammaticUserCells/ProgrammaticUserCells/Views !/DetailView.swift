//
//  DetailView.swift
//  ProgrammaticUserCells
//
//  Created by Tiffany Obi on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailView: UIView {

     var userName = ""
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemOrange
        return imageView
    }()
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemPink
        label.text = userName
        label.font = UIFont(name: "Didot", size: 40 )
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    override init(frame: CGRect) {
      super.init(frame: UIScreen.main.bounds)
      commonInit()
    }
    
    required init?(coder: NSCoder) {
      super.init(coder: coder)
      commonInit()
    }
    
    private func commonInit() {
    setupImageViewConstraints()
        setUpLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
addSubview(imageView)
           
imageView.translatesAutoresizingMaskIntoConstraints = false
           
NSLayoutConstraint.activate([
    
imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
               
imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
               
imageView.trailingAnchor.constraint(equalTo: trailingAnchor),

imageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
           ])
       }
    
    private func setUpLabelConstraints() {
        addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
    nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        
        
        ])
    }

}
