//
//  WalkSlider.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 19/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

protocol SliderDelegate {
    func didContentOffsetChange(contentOffset: Double)
}

class WalkSlider: UIView {
    let stackView = UIStackView()
    let pageControl = UIPageControl(frame: .zero)
    let scrollView = UIScrollView(frame: .zero)
    let skipButton = UIButton(type: .custom)
    let containerView = UIView()
    
    var backgroundView: WalkBGView?
    var milestones = [UIView]()

    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
        }
    }
    var totalPages: Int {
        return Int(scrollView.contentSize.width/scrollView.bounds.width)
    }
    
    var pageWidth: Double {
        return Double(scrollView.bounds.width)
    }

    init(backgroundView: WalkBGView? = nil, milestones: [UIView]) {
        self.milestones.append(contentsOf: milestones)
        self.backgroundView = backgroundView
        
        super.init(frame: .zero)
        setup()
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        if backgroundView?.type == .paralax {
            configureParalax()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureParalax() {
        if let backgroundView = self.backgroundView {
            backgroundView.contentSize = Double(self.scrollView.contentSize.width)
            backgroundView.paralaxDelta = 0.2
        }
    }
    
    func setup() {
        // if background view is present add it
        if let backgroundView = self.backgroundView {
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(backgroundView)
            
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
        
        // Add stackview
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        // configure scrollview
        scrollView.backgroundColor = .clear
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self

        // ass scrollview to stackview
        stackView.addArrangedSubview(scrollView)

        // add container view to scrollview
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        
        // Add views to container view
        addMileStones(views: milestones, to: containerView)
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
    
    func addSkipButton() {
        skipButton.setTitle("Skip", for: .normal)
        skipButton.backgroundColor = .orange
        
        stackView.addArrangedSubview(skipButton)
    }
    
    func addPageControl() {
        pageControl.numberOfPages = milestones.count
        stackView.addArrangedSubview(pageControl)
    }

    func showPageControl() {
        self.pageControl.isHidden = false
    }
    
    func hidePageControl() {
        self.pageControl.isHidden = true
    }
    
    func configurePageControl(_ block: (_ pageControl: UIPageControl) -> Void) {
        block(pageControl)
    }
    
    func configureButton(_ block: (_ button: UIButton) -> Void) {
        block(skipButton)
    }
}

extension WalkSlider: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        
        // if background view is present and supports paralax
        // inform the view about offset changes (to allow paralax)
        if backgroundView?.type == .paralax {
            backgroundView?.contentOffset = Double(scrollView.contentOffset.x)
        }
        
        // inform individual views about the offset change
        for (index, milestone) in milestones.enumerated() {
            if let bg = milestone as? WalkBGView {
                let offset = Double(scrollView.contentOffset.x) - (pageWidth * Double(index))
                
                bg.didContentOffsetChange(contentOffset: offset)
            }
        }
    }
}
