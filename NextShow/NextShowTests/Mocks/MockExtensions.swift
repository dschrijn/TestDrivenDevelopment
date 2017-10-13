//
//  MockExtensions.swift
//  NextShowTests
//
//  Created by David A. Schrijn on 10/12/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit

@testable import NextShow 

extension ShowLibraryDataServiceTests {
    class TableViewMock: UITableView {
        var cellDequeuedProperly: Bool = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
        
        class func initializeTableViewMock() -> TableViewMock{
            let tableViewMock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 300), style: .plain)
            tableViewMock.register(ShowCellMock.self, forCellReuseIdentifier: "showCellID")
            return tableViewMock
            
        }
    }
    
    
    class ShowCellMock: ShowCell {
        var show: Show?
        
        override func configShowCell(withShow: Show) {
            show = withShow
        }
    }
    
}


extension ShowCellTests {
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
