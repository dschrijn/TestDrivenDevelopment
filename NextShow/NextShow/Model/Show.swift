//
//  Shows.swift
//  NextShow
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import Foundation

struct Show: Equatable {
    var title: String
    var releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
    
}

func==(lhs: Show, rhs: Show) -> Bool {
    if lhs.title != rhs.title {
        return false
    }
   
    if lhs.releaseDate != rhs.releaseDate {
        return false
    }
    
    return true

}
