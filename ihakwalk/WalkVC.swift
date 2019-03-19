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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addScrollView()
    }
    
    func addScrollView() {
        self.scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .purple
        self.view.addSubview(scrollView)
        
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(view)
        view.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        let milestone1 = WalkView(title: "Title 1", descriptionText: "Some description related to title 1.", image: UIImage(named: "ticket-office"), sequence: [.image, .description, .title])
        
        let milestone2 = WalkView(title: "Title 2", descriptionText: "Some description related to title 2.", image: UIImage(named: "title2"), sequence: [.image, .title, .description])
        addMileStones(views: [milestone1, milestone2], to: view)
    }
    
    func addMileStones(views: [UIView], to container:UIView) {
        var previousView: UIView!
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(view)
            view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            
            if previousView != nil {
                view.leadingAnchor.constraint(equalTo: previousView.trailingAnchor).isActive = true
            }
            else {
                view.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
            }
            
            if index == (views.count - 1) {
                view.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
            }
            previousView = view
        }
    }
}
