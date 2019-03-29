//
//  ProductSliderVC.swift
//  ihakwalk
//
//  Created by Hassan Ahmed on 29/03/2019.
//  Copyright © 2019 Hassan Ahmed. All rights reserved.
//

import UIKit

class ProductSliderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let headerImageView = UIImageView(image: UIImage(named: "header_placeholder")!)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.contentMode = .scaleAspectFill
        
        self.view.addSubview(headerImageView)
        headerImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        headerImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        headerImageView.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
        headerImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
