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
        
        let view = UIView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
        view.layer.borderColor = UIColor.red.cgColor
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
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1.0
            self.view.addSubview(view)
        }
    }
}

