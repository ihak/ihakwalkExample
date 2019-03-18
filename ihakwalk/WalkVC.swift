//
//  WalkVC.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 14/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

class WalkVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let imageView = UIImageView(image: UIImage(named: "bg_03"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        self.view.setNeedsLayout()
        self.view.layoutIfNeeded()
        blur()
//        addWalkView()
        
        let view = UIView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1.0
        self.view.addSubview(view)

    }
    
    override func viewDidLayoutSubviews() {
        // For each layout guide object in the view
        // Add a layer with the same frame with a border
        // to make layout guide visible
        for guide in self.view.layoutGuides {
            print(guide.layoutFrame)
            let view = UIView(frame: guide.layoutFrame)
            view.layer.borderColor = UIColor.white.cgColor
            view.layer.borderWidth = 1.0
            self.view.addSubview(view)
        }
    }
    
    func blur() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blur = UIVisualEffectView(effect: blurEffect)
        blur.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blur)
        
        blur.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        blur.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        blur.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        blur.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        let vibrancy = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        vibrancy.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String(describing: "Hello World")
        vibrancy.contentView.addSubview(label)
        vibrancy.addConstraint(NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: vibrancy, attribute: .centerX, multiplier: 1.0, constant: 0.0))
        vibrancy.addConstraint(NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: vibrancy, attribute: .centerY, multiplier: 1.0, constant: 0.0))
        
        blur.contentView.addSubview(vibrancy)
        vibrancy.topAnchor.constraint(equalTo: blur.topAnchor).isActive = true
        vibrancy.bottomAnchor.constraint(equalTo: blur.bottomAnchor).isActive = true
        vibrancy.leadingAnchor.constraint(equalTo: blur.leadingAnchor).isActive = true
        vibrancy.trailingAnchor.constraint(equalTo: blur.trailingAnchor).isActive = true
    }

    func addWalkView() {
        let walkView = WalkView(title:"Title", descriptionText: "This is a long description text.", image: UIImage(named:"title2"), sequence:[.title, .image, .description]) { (title, description, image) in
            description?.textColor = .white
            description?.numberOfLines = 2
            description?.font = UIFont.systemFont(ofSize: 20)
            description?.textAlignment = .center
            description?.backgroundColor = .blue
            
            title?.textAlignment = .center
            title?.backgroundColor = .orange
            
            image?.backgroundColor = .brown
        }
        
        walkView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkView)

        walkView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
}
