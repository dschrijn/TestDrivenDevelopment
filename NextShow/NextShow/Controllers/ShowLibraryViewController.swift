//
//  ViewController.swift
//  NextShow
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit
import ChameleonFramework


class ShowLibraryViewController: UIViewController {
    
    var showManager: ShowManager = ShowManager()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @IBOutlet weak  var titleLabel: UILabel! 
    @IBOutlet weak var showTableView: UITableView!
    @IBOutlet var dataService: ShowLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = GradientColor(gradientStyle: .radial, frame: self.view.frame, colors: [UIColor.flatSkyBlueColorDark(), UIColor.flatNavyBlue()])
        
        self.showTableView.dataSource = dataService
        self.showTableView.delegate = dataService
        dataService.showManager = showManager
        
        dataService.showManager?.addShowToLibrary(show: Show(title: "The Flash", releaseDate: "10/10/17"))
        dataService.showManager?.addShowToLibrary(show: Show(title: "Legends Of Tomorrow", releaseDate: "10/10/17"))
        dataService.showManager?.addShowToLibrary(show: Show(title: "Arrow", releaseDate: "10/12/17"))
        dataService.showManager?.addShowToLibrary(show: Show(title: "SuperNatural", releaseDate: "10/12/17"))
        dataService.showManager?.addShowToLibrary(show: Show(title: "SuperGirl", releaseDate: "10/09/17"))
        self.showTableView.reloadData()
    }


}

