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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addType6Walk()
    }
    /**
     *  A common background for every view.
     */
    func addType1Walk() {
        let walk1 = WalkView(title: "Title 1", descriptionText: "Description for title 1.", image: UIImage(named: "title2"))
        
        let walk2 = WalkView(title: "Title 2", descriptionText: "Description for title 2.", image: UIImage(named: "title2"), sequence: [.title, .image, .description])
        
        let walk3 = WalkView(title: "Title 3", descriptionText: "Description for title 3.", image: UIImage(named: "title2"), sequence: [.image, .title, .description])
        
        let background = WalkBGView(image: UIImage(named: "2"))
        
        let walkslider = WalkSlider(backgroundView: background, milestones: [walk1, walk2, walk3])
        
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    /**
     *  Every view has its own background.
     */
    func addType2Walk() {
        let walk1 = WalkBGView(image: UIImage(named: "1"), walkView: WalkView(title: "Title 1", descriptionText: "Description for title 1.", image: UIImage(named: "title2")))
        
        let walk2 = WalkBGView(image: UIImage(named: "2"), walkView: WalkView(title: "Title 2", descriptionText: "Description for title 2.", image: UIImage(named: "title2"), sequence: [.title, .image, .description]))
        
        let walk3 = WalkBGView(image: UIImage(named: "3"), walkView: WalkView(title: "Title 3", descriptionText: "Description for title 3.", image: UIImage(named: "title2"), sequence: [.image, .title, .description]))
        
        let walkslider = WalkSlider(milestones: [walk1, walk2, walk3])
        
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    /**
     *  A common background for every view with paralax.
    */
    func addType3Walk() {
        let walk1 = WalkView(title: "Title 1", descriptionText: "Description for title 1.", image: UIImage(named: "title2"))
        
        let walk2 = WalkView(title: "Title 2", descriptionText: "Description for title 2.", image: UIImage(named: "title2"), sequence: [.title, .image, .description])
        
        let walk3 = WalkView(title: "Title 3", descriptionText: "Description for title 3.", image: UIImage(named: "title2"), sequence: [.image, .title, .description])
        
        let background = WalkBGView(image: UIImage(named: "bg_wide_1"), type: .paralax)
        
        let walkslider = WalkSlider(backgroundView: background, milestones: [walk1, walk2, walk3])
        
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    /**
     *  Every view has its own background and paralax
     */
    func addType4Walk() {
        let walk1 = WalkBGView(image: UIImage(named: "bg_wide_2"), walkView: WalkView(title: "Title 1", descriptionText: "Description for title 1.", image: UIImage(named: "title2")), type: .paralax)
        
        let walk2 = WalkBGView(image: UIImage(named: "bg_wide_3"), walkView: WalkView(title: "Title 2", descriptionText: "Description for title 2.", image: UIImage(named: "title2"), sequence: [.title, .image, .description]), type: .paralax)
        
        let walk3 = WalkBGView(image: UIImage(named: "bg_wide_4"), walkView: WalkView(title: "Title 3", descriptionText: "Description for title 3.", image: UIImage(named: "title2"), sequence: [.image, .title, .description]), type: .paralax)
        
        let walkslider = WalkSlider(milestones: [walk1, walk2, walk3])
        
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    /**
     *  A common background with blur effect
     */
    
    func addType5Walk() {
        let walk1 = WalkView(title: "Title 1", descriptionText: "Description for title 1.", image: UIImage(named: "title2"))
        
        let walk2 = WalkView(title: "Title 2", descriptionText: "Description for title 2.", image: UIImage(named: "title2"), sequence: [.title, .image, .description])
        
        let walk3 = WalkView(title: "Title 3", descriptionText: "Description for title 3.", image: UIImage(named: "title2"), sequence: [.image, .title, .description])
        
        let background = WalkBGView(image: UIImage(named: "2"))
        background.addBlur(style: .light)
        
        let walkslider = WalkSlider(backgroundView: background, milestones: [walk1, walk2, walk3])
        
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    /**
     *  Every view has its own blurred backgrounds.
     */
    
    func addType6Walk() {
        let walk1 = WalkBGView(image: UIImage(named: "bg_wide_3"), walkView: WalkView(title: "Title 1", descriptionText: "Description for title 1.", image: UIImage(named: "title2")), type: .paralax)
        walk1.addBlur(style: .light)
        
        let walk2 = WalkBGView(image: UIImage(named: "2"), walkView: WalkView(title: "Title 2", descriptionText: "Description for title 2.", image: UIImage(named: "title2"), sequence: [.title, .image, .description]))
        walk2.addBlur(style: .extraLight)
        
        let walk3 = WalkBGView(image: UIImage(named: "3"), walkView: WalkView(title: "Title 3", descriptionText: "Description for title 3.", image: UIImage(named: "title2"), sequence: [.image, .title, .description]))
        walk3.addBlur(style: .prominent)
        
        let walkslider = WalkSlider(milestones: [walk1, walk2, walk3])
        
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func addScrollView() {
        
        let milestone1 = WalkView(title: "Title 1", descriptionText: "Some description related to title 1.", image: UIImage(named: "ticket-office"), sequence: [.image, .description, .title])
        
        let milestone2 = WalkView(title: "Title 2", descriptionText: "Some description related to title 2.", image: UIImage(named: "title2"), sequence: [.image, .title, .description])
        
        let milestone3 = WalkView(title: "Title 3", descriptionText: "Some description related to title 3.", image: UIImage(named: "ticket-office"), sequence: [.image, .title, .description])
        
        let milestone4 = WalkBGView(image: UIImage(named: "12"), walkView: WalkView(title: "Title 4", descriptionText: "Some description related to title 4.", image: UIImage(named: "ticket-office"), sequence: [.image, .description, .title]))
        
        let milestone5 = WalkBGView(image: UIImage(named: "11"), walkView: WalkView(title: "Title 5", descriptionText: "Some description related to title 5.", image: UIImage(named: "title2"), sequence: [.image, .title, .description]))
        
        let milestone6 = WalkBGView(image: UIImage(named: "10"), walkView: WalkView(title: "Title 6", descriptionText: "Some description related to title 6.", image: UIImage(named: "ticket-office"), sequence: [.image, .title, .description]))

        let walkslider = WalkSlider(milestones: [WalkBGView(image: UIImage(named: "15"), walkView: milestone1),
                                                 WalkBGView(image: UIImage(named: "14"), walkView: milestone2),
                                                 WalkBGView(image: UIImage(named: "13"), walkView: milestone3),
                                                 milestone4,
                                                 milestone5,
                                                 milestone6])
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func addScrollInternalParalax() {
        let milestone1 = WalkView(title: "Title 1", descriptionText: "Some description related to title 1.", image: UIImage(named: "ticket-office"), sequence: [.image, .description, .title])
        
        let milestone2 = WalkView(title: "Title 2", descriptionText: "Some description related to title 2.", image: UIImage(named: "title2"), sequence: [.image, .title, .description])
        
        let milestone3 = WalkView(title: "Title 3", descriptionText: "Some description related to title 3.", image: UIImage(named: "ticket-office"), sequence: [.image, .title, .description])
        
        let milestone4 = WalkBGView(image: UIImage(named: "bg_wide_2"), walkView: WalkView(title: "Title 4", descriptionText: "Some description related to title 4.", image: UIImage(named: "ticket-office"), sequence: [.image, .description, .title]), type: .paralax)
        milestone4.initialOffset = 300.0

        let walkslider = WalkSlider(milestones: [WalkBGView(image: UIImage(named: "bg_wide_5"), walkView: milestone1, type: .paralax),
                                                 WalkBGView(image: UIImage(named: "bg_wide_4"), walkView: milestone2, type: .paralax),
                                                 WalkBGView(image: UIImage(named: "bg_wide_3"), walkView: milestone3, type: .paralax), milestone4])
        
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
