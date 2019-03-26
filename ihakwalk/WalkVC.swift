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
        addSurfboardWalk()
        
        print("system minimum layout margins of vc: \(self.systemMinimumLayoutMargins)")
        print("directionalLayoutMargins of view: \(self.view.directionalLayoutMargins)")
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
        
        walkslider.addSkipButton()
        walkslider.addPageControl()
        
        walkslider.configurePageControl { (pagecontrol) in
            pagecontrol.currentPageIndicatorTintColor = .orange
        }
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
    
    func addButton() {
        let button = UIButton(type: .custom)
        button.setTitle("Skip", for: .normal)
        button.backgroundColor = .orange
//        button.contentEdgeInsets = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
//        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    
    func addSurfboardWalk() {
        let walk1 = WalkView(descriptionText: "Welcome to Surfboard.", image: UIImage(named: "iPhone"), sequence: [.description, .image, .title]) { (walkView, _, description, imageView) in
            description?.font = UIFont(name: "AvenirNext-Regular", size: 17.0)
            description?.textColor = .white
            description?.layoutMargins = UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
            imageView?.tintColor = .white
            walkView.addCustomSpacing(spacing: 20.0, after: description!)
        }
        
        let walk2 = WalkView(descriptionText: "Surfboard makes it delightfully easy to craft onboarding experiences.", image: UIImage(named: "surfer"), sequence: [.description, .image]) { (walkView, _, description, imageView) in
            description?.font = UIFont(name: "AvenirNext-Regular", size: 17.0)
            description?.textColor = .white
            imageView?.tintColor = .white
            walkView.addCustomSpacing(spacing: 20.0, after: description!)
        }
        
        let walk3 = WalkView(descriptionText: "You provide an array of panels and Surfboard figures out the rest.", image: UIImage(named: "panels"), sequence: [.description, .image]) { (walkView, _, description, imageView) in
            description?.font = UIFont(name: "AvenirNext-Regular", size: 17.0)
            description?.textColor = .white
            imageView?.tintColor = .white
            walkView.addCustomSpacing(spacing: 20.0, after: description!)
        }
        
        let walk4 = WalkView(descriptionText: "See the documentation on GitHub for more information.", image: UIImage(named: "github"), sequence: [.description, .image]) { (walkView, _, description, imageView) in
            description?.font = UIFont(name: "AvenirNext-Regular", size: 17.0)
            description?.textColor = .white
            imageView?.tintColor = .white
            walkView.addCustomSpacing(spacing: 20.0, after: description!)
        }
        
        let walk5 = WalkView(descriptionText: "If you like Surfboard give me a shoutout on Twitter. I'm @bermaniasstudios.", image: UIImage(named: "twitter"), sequence: [.description, .image]) { (walkView, _, description, imageView) in
            description?.font = UIFont(name: "AvenirNext-Regular", size: 17.0)
            description?.textColor = .white
            imageView?.tintColor = .white
            walkView.addCustomSpacing(spacing: 20.0, after: description!)
        }
        
        let bgView = WalkBGView(color: UIColor(red: 12.0/256.0, green: 18.0/256.0, blue: 148.0/256.0, alpha: 1.0))
        
        let walkslider = WalkSlider(backgroundView: bgView, milestones: [walk1, walk2, walk3, walk4, walk5])
        walkslider.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(walkslider)
        
        walkslider.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        walkslider.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        walkslider.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        walkslider.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        walkslider.addPageControl()
    }
}
