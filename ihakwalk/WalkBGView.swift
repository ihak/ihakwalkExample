//
//  WalkBGView.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 18/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

/**
 *  A view that works as a background view for individual slides
 *  as well as for the whole component. It supports an image or a
 *  color. Also provides paralax effect and blur.
 */
class WalkBGView: UIView {
    enum BackgroundType {
        case normal, paralax
    }
    
    private var imageView: UIImageView?
    private(set) var walkView: WalkView?
    private var leadingConstraint: NSLayoutConstraint!
    
    var type: BackgroundType = .normal
    
    public var contentSize = 0.0
    private var paralaxWidth = 0.0
    
    /**
     *  Offset the background to allow negative scroll.
     *  It reveals the image in bounce effect of scrollview.
     */
    public var initialOffset = 0.0
    
    /**
     *  Configures how much image is moved upon each pixel moved by the
     *  scrollview. Best results are achieved when its value is < 1.
     *  Keep into account your image width when setting this value.
     *  If the value is too large as compared to the width of the image
     *  blank background (or superview) is displayed when image ends.
     */
    public var paralaxDelta = 0.5
    
    /**
     *  Amount by which current page has moved.
     */
    public var contentOffset = 0.0 {
        didSet {
            paralaxOffset = contentOffset * paralaxDelta
        }
    }
    
    /**
     *  Amount by which background image has moved.
     */
    var paralaxOffset = 0.0 {
        didSet {
            leadingConstraint.constant = CGFloat(paralaxOffset + initialOffset) * -1
            print("paralax offset: \(paralaxOffset)")
        }
    }
    
    init(image: UIImage? = nil, walkView: WalkView? = nil, type: BackgroundType = .normal) {
        if let image = image {
            self.imageView = UIImageView(image: image)
            self.paralaxWidth = Double(image.size.width)
        }
        self.walkView = walkView
        self.type = type

        if type == .paralax {
            initialOffset = 160.0
        }
        
        super.init(frame: .zero)
        self.clipsToBounds = true
        setup()
    }
    
    init(color: UIColor, walkView: WalkView? = nil) {
        self.imageView = UIImageView(image: color.image().resizableImage(withCapInsets: .zero))
        self.walkView = walkView
        super.init(frame: .zero)
        self.clipsToBounds = true
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * Carries out the initialization of the subviews and add them
     *  to the superview.
     */
    private func setup() {
        if let imageView = self.imageView {
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
        }
        
//        if let walkView = self.walkView {
//            self.addSubview(walkView)
//            walkView.translatesAutoresizingMaskIntoConstraints = false
//
//            walkView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//            walkView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//            walkView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//            walkView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        }
    }
    /**
     *  Adds blur to the background.
     */
    public func addBlur(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        let blur = UIVisualEffectView(effect: blurEffect)
        blur.translatesAutoresizingMaskIntoConstraints = false
        
        if let walk = self.walkView {
            self.insertSubview(blur, belowSubview: walk)
        }
        else if let bg = self.imageView {
            self.insertSubview(blur, aboveSubview: bg)
        }
        
        blur.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blur.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blur.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blur.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}

extension WalkBGView: SliderDelegate {
    func didContentOffsetChange(contentOffset: Double) {
        // only work for paralax type
        guard type == .paralax else {
            return
        }
        
        self.contentOffset = contentOffset
    }
}
