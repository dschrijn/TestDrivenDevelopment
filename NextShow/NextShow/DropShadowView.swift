//
//  DropShadowView.swift
//  NextShow
//
//  Created by David A. Schrijn on 10/10/17.
//  Copyright © 2017 David A. Schrijn. All rights reserved.
//

import UIKit
@IBDesignable // Makes the vars below editable in Storyboard Inspectors.

class DropShadowView: UIView {
    
    
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    
    @IBInspectable var shadowOpacity: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUp()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setUp()
    }
    
    func setUp() {
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = Float(shadowOpacity)
    }

}
