//
//  ShowCell.swift
//  NextShow
//
//  Created by David A. Schrijn on 10/12/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit

class ShowCell: UITableViewCell {

    func configShowCell(withShow: Show) {
        self.textLabel?.text = withShow.title
        self.detailTextLabel?.text = withShow.releaseDate
    }

}
