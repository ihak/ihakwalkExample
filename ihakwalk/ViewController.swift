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
    }
    
    @IBAction func sliderButtonTapped(_ sender: Any) {
        self.addABCIntroView()
    }
    
    func addSurfboardSliderVC() {
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
//        walkslider.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 40.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
        walkslider.translatesAutoresizingMaskIntoConstraints = false
        
        walkslider.addPageControl()
        walkslider.addSkipButton()
        
        walkslider.configureSkipButton { (button) in
            button.backgroundColor = .clear
            button.tintColor = .white
        }
        
        let walkVC = WalkVC(walkSlider: walkslider)
        let navigationController = UINavigationController(rootViewController: walkVC)
        self.present(navigationController, animated: true
            , completion: nil)
    }
    
    func addABCIntroView() {
        let walk1 = WalkView(title: "Pixifly", descriptionText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: UIImage(named: "Intro_Screen_One"), sequence: [.title, .image, .description]) { (walkview, titleLabel, descriptionLabel, imageView) in
            walkview.addCustomSpacing(spacing: 20.0, after: imageView!)
        }
        
        let walk2 = WalkView(title: "DropShot", descriptionText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", image: UIImage(named: "Intro_Screen_Two"), sequence: [.title, .image, .description]) { (walkview, titleLabel, descriptionLabel, imageView) in
            walkview.addCustomSpacing(spacing: 20.0, after: imageView!)
        }
        
        
        let walk3 = WalkView(title: "Shaktaya", descriptionText: "Description for third screen.", image: UIImage(named: "Intro_Screen_Three"), sequence: [.title, .image, .description]) 
        
        let walk4 = WalkView(title: "Punctual", descriptionText: "Description for fourth screen.", image: UIImage(named: "Intro_Screen_Four"), sequence: [.title, .image, .description])
        
        let backgroundView = WalkBGView(color: UIColor(white: 0.149, alpha: 1.0))

        let walkSlider = WalkSlider(backgroundView: backgroundView, milestones: [walk1, walk2, walk3, walk4])
        
        walkSlider.addPageControl()
        walkSlider.addSkipButton()
        
        walkSlider.configureSkipButton { (button) in
            button.backgroundColor = UIColor(red: 0.129, green: 0.588, blue: 0.953, alpha: 1.0)
            button.setTitle("Let's Go", for: .normal)
        }
        
        walkSlider.configurePageControl { (pageControl) in
            pageControl.currentPageIndicatorTintColor = UIColor(red: 0.129, green: 0.588, blue: 0.953, alpha: 1.0)
        }
        
        let walkVC = WalkVC(walkSlider: walkSlider)
        let navigationController = UINavigationController(rootViewController: walkVC)
        navigationController.isNavigationBarHidden = true
        self.present(navigationController, animated: true
            , completion: nil)
    }
}

