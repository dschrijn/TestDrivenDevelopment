//
//  ShowManager.swift
//  NextShow
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

class ShowManager {
    var showsToSeeCount: Int { return showsToSeeArray.count }
    var showsSeenCount: Int { return showsSeenArray.count }
    
    private var showsToSeeArray = [Show]()
    private var showsSeenArray = [Show]()
    
    func addShowToLibrary(show: Show) {
        showsToSeeArray.append(show)
    }
    
    func showAtIndex(index: Int) -> Show {
        return showsToSeeArray[index]
    }
    
    func favoriteShowAtIndex(index: Int) {
        guard index < showsToSeeCount else { return }
        
        let favoritedShow = showsToSeeArray.remove(at: index)
        showsSeenArray.append(favoritedShow)
    }
    
    func favoritedShowAtIndex(index: Int) -> Show {
        return showsSeenArray[index]
    }
    
    func clearArrays() {
        showsSeenArray.removeAll()
        showsToSeeArray.removeAll()
    }
}
