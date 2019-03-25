//
//  ViewController.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 14/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label = UILabel()
        label.text = "Hello World"
        label.backgroundColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        view.layoutMargins = .init(top: 0.0, left: 64.0, bottom: 0.0, right: 0.0)
//        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 64, bottom: 0, trailing: 0)
        self.viewRespectsSystemMinimumLayoutMargins = false
        let margins = self.view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            ])
    }
    
    override func viewDidLayoutSubviews() {
        // For each layout guide object in the view
        // Add a layer with the same frame with a border
        // to make layout guide visible
        for guide in self.view.layoutGuides {
            print(guide.layoutFrame)
            let view = UIView(frame: guide.layoutFrame)
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1.0
            self.view.addSubview(view)
        }
        
        print("system minimum layout margins of vc: \(self.systemMinimumLayoutMargins)")
        print("directionalLayoutMargins of view: \(self.view.directionalLayoutMargins)")

    }
}

