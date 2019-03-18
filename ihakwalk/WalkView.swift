//
//  WalkView.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 15/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

class WalkView: UIView {
    var title: String?
    var descriptionText: String?
    var image: UIImage?
    
    var titleLabel: UILabel?
    var descriptionLabel: UILabel?
    var imageView: UIImageView?
    var sequence: [DisplayItem]
    
    typealias Configuration = (_ title: UILabel?,_ description: UILabel?,_ image: UIImageView?) -> Void
    
    enum DisplayItem {
        case title, description, image
    }
    
    var defaultConfiguration: Configuration
    var configuration: Configuration?
    
    init(title:String? = nil,
         descriptionText:String? = nil,
         image:UIImage? = nil,
         sequence: [DisplayItem] = [.title, .description, .image],
         _ configuration: Configuration? = nil) {
        self.title = title
        self.descriptionText = descriptionText
        self.image = image
        self.sequence = sequence
        
        defaultConfiguration = { (title, _, image) in
            title?.textColor = .white
            title?.font = UIFont.boldSystemFont(ofSize: 20)
            title?.numberOfLines = 2
        }
        
        self.configuration = configuration
        super.init(frame: .zero)
        setup()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func correspondingView(displayItem: DisplayItem) -> UIView? {
        switch displayItem {
        case .title:
            return titleLabel
        case .description:
            return descriptionLabel
        case .image:
            return imageView
        }
    }

    func configure() {
        defaultConfiguration(titleLabel, descriptionLabel, imageView)
        configuration?(titleLabel, descriptionLabel, imageView)
    }

    func setup() {
        
        titleLabel = UILabel()
        titleLabel?.text = self.title

        descriptionLabel = UILabel()
        descriptionLabel?.text = self.descriptionText

        imageView = UIImageView(image: self.image)

        let stackView = UIStackView()
        stackView.axis = .vertical
        
        for item in sequence {
            if let view = correspondingView(displayItem: item) {
                stackView.addArrangedSubview(view)
            }
        }
        
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
