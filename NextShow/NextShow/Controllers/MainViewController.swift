//
//  ViewController.swift
//  NextShow
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit
import ChameleonFramework


class MainViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak  var titleLabel: UILabel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GradientColor(gradientStyle: .radial, frame: self.view.frame, colors: [UIColor.flatSkyBlueColorDark(), UIColor.flatNavyBlue()])
        
    }


}

