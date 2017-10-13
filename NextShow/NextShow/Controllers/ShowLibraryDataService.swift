//
//  ShowLibraryDataService.swift
//  NextShow
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit

enum LibrarySection: Int {
    case ShowsToSee, ShowsSeen
}

class ShowLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var showManager: ShowManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let showManager = showManager else { return 0 }
        
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
        case .ShowsToSee:
            return showManager.showsToSeeCount
        case .ShowsSeen:
            return showManager.showsSeenCount
        }
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCellID", for: indexPath) as! ShowCell
        
        guard let showManager = showManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        let currentShow = librarySection.rawValue == 0 ? showManager.showAtIndex(index: indexPath.row) : showManager.favoritedShowAtIndex(index: indexPath.row)
        
        cell.configShowCell(withShow: currentShow)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let showManager = showManager else { fatalError() }
        guard let librarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        if librarySection  == .ShowsToSee {
            showManager.favoriteShowAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        let sectionTitle: String
        switch librarySection {
        case .ShowsToSee:
            sectionTitle = "Shows To See"
        case .ShowsSeen:
            sectionTitle = "Shows Seen"
        }
        return sectionTitle
    }
    
    
    

}

