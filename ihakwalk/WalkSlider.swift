//
//  WalkSlider.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 19/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

/**
 *  A protocol that provides scrollview related updates
 *  to the interested views.
 */
protocol SliderDelegate {
    func didContentOffsetChange(contentOffset: Double)
}

/**
 *  A view that takes WalkView and WalkBGView and layout
 *  the slider accordingly.
 */
class WalkSlider: UIView {
    private lazy var stackView = UIStackView()
    private lazy var pageControl = UIPageControl(frame: .zero)
    private lazy var scrollView = UIScrollView(frame: .zero)
    private lazy var skipButton = UIButton(type: .custom)
    private lazy var containerView = UIView()
    
    private var backgroundView: WalkBGView?
    private var milestones = [UIView]()

    private var skipButtonAction: ((_ button: UIButton) -> Void)?
    
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
        
        super.init(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
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
    
    /**
     *  Perform paralax related configurations if background view is present.
     */
    private func configureParalax() {
        if let backgroundView = self.backgroundView {
            backgroundView.contentSize = Double(self.scrollView.contentSize.width)
            backgroundView.paralaxDelta = 0.2
        }
    }
    
    /**
     *  Performs basic setup of the view.
     */
    private func setup() {
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
        let margins = self.layoutMarginsGuide
        let topConstraint = stackView.topAnchor.constraint(equalTo: margins.topAnchor)
        topConstraint.priority = .init(rawValue: 999.0)
        topConstraint.isActive = true
        
        stackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        let trailingConstraint = stackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        trailingConstraint.priority = .init(rawValue: 999.0)
        trailingConstraint.isActive = true
        
        
        // configure scrollview
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self

        // aadd scrollview to stackview
        stackView.addArrangedSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        // add container view to scrollview
        containerView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor).isActive = true
        
        // Add views to container view
        addMileStones(views: milestones, to: containerView)
    }
    
    /**
     *  Adds WalkViews to the containerView which is added on the
     *  scrollview.
     */
    private func addMileStones(views: [UIView], to container:UIView) {
        var previousView: UIView!
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            container.addSubview(view)
            view.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
            view.widthAnchor.constraint(equalTo: self.stackView.widthAnchor).isActive = true
            
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
    
    /**
     *  Adds skip button to the stackview.
     */
    func addSkipButton() {
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(.white, for: .normal)
        skipButton.backgroundColor = .clear
        
        skipButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        skipButton.titleLabel?.adjustsFontForContentSizeCategory = true
        skipButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)

        skipButton.addTarget(self, action: #selector(skipButtonTapped(sender:)), for: .touchUpInside)
        
        stackView.addArrangedSubview(skipButton)
    }
    
    /**
     *  Adds page control to the stackview.
     */
    func addPageControl() {
        pageControl.numberOfPages = milestones.count
        stackView.addArrangedSubview(pageControl)
    }

    /**
     *  Shows page control.
     */
    func showPageControl() {
        self.pageControl.isHidden = false
    }
    
    /**
     *  Hides page control.
     */
    func hidePageControl() {
        self.pageControl.isHidden = true
    }
    
    /**
     *  Performs custom configurations on page control
     */
    func configurePageControl(_ block: (_ pageControl: UIPageControl) -> Void) {
        block(pageControl)
    }
    
    /**
     *  Performs custom configurations on skip button.
     */
    func configureSkipButton(_ block: (_ button: UIButton) -> Void) {
        block(skipButton)
    }
    
    func skipButtonAction(_ block: @escaping (_ button: UIButton) -> Void) {
        skipButtonAction = block
    }
    
    @objc func skipButtonTapped(sender: UIButton) {
        skipButtonAction?(skipButton)
    }
}

extension WalkSlider: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        guard scrollView.bounds.width > 0 else {
            print("Error: Scrollview width is <= zero.")
            return
        }
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
