//
//  WalkBGView.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 18/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

class WalkBGView: UIView {
    enum BackgroundType {
        case normal, paralax
    }
    
    var imageView: UIImageView
    var walkView: WalkView?
    var leadingConstraint: NSLayoutConstraint!
    
    var type: BackgroundType = .normal
    
    var contentSize = 0.0
    var paralaxWidth = 0.0
    
    var initialOffset = 50.0
    
    var paralaxDelta = 0.5
    
    var contentOffset = 0.0 {
        didSet {
            paralaxOffset = contentOffset * paralaxDelta
        }
    }
    
    var paralaxOffset = 0.0 {
        didSet {
            leadingConstraint.constant = CGFloat(paralaxOffset + initialOffset) * -1
            print("paralax offset: \(paralaxOffset)")
        }
    }
    
    init(image: UIImage, walkView: WalkView? = nil, type: BackgroundType = .normal) {
        self.imageView = UIImageView(image: image)
        self.paralaxWidth = Double(image.size.width)
        self.walkView = walkView
        self.type = type
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.addSubview(imageView)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.leadingConstraint =  imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(self.initialOffset * -1))
        self.leadingConstraint.isActive = true
        
        // if type is normal then bind the image with trailing anchor.
        if type == .normal {
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
        
        if let walkView = self.walkView {
            self.addSubview(walkView)
            walkView.translatesAutoresizingMaskIntoConstraints = false
            
            walkView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            walkView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            walkView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            walkView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
    }
    
    func addBlur(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blur = UIVisualEffectView(effect: blurEffect)
        blur.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(blur)
        
        blur.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blur.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blur.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blur.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
