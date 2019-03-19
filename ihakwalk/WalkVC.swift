//
//  WalkVC.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 14/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

class WalkVC: UIViewController {
    var scrollView: UIScrollView!
    var currentPage = 0
    var totalPages = 3

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addScrollView()
    }
    
    func addScrollView() {
        
        let milestone1 = WalkView(title: "Title 1", descriptionText: "Some description related to title 1.", image: UIImage(named: "ticket-office"), sequence: [.image, .description, .title])
        
        let milestone2 = WalkView(title: "Title 2", descriptionText: "Some description related to title 2.", image: UIImage(named: "title2"), sequence: [.image, .title, .description])
        
        let milestone3 = WalkView(title: "Title 3", descriptionText: "Some description related to title 3.", image: UIImage(named: "ticket-office"), sequence: [.image, .title, .description])
        
        let walkslider = WalkSlider(backgroundView: WalkBGView(image: UIImage(named: "bg_wide")!, type: .paralax), milestones: [milestone1, milestone2, milestone3])
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
