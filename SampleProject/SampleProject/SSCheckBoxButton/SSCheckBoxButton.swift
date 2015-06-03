//
//  SSCheckBoxButton.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 03/06/2015.
//  Copyright (c) 2015 Shamas Shahid. All rights reserved.
//

import UIKit

@IBDesignable class SSCheckBoxButton: UIButton {

    var tickLayer = CAShapeLayer()
    var backLayer = CAShapeLayer()
    var lineWidth: CGFloat = 2
    var checkBoxWidth: CGFloat = 20

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    func initialize() {
        backLayer.frame = rectForSquare()
        backLayer.backgroundColor = UIColor.redColor().CGColor
        backLayer.lineWidth = lineWidth
        backLayer.fillColor = UIColor.clearColor().CGColor
        backLayer.strokeColor = UIColor.blackColor().CGColor
        layer.addSublayer(backLayer)
        backLayer.path = UIBezierPath(roundedRect: rectForSquare(), cornerRadius: 1).CGPath

//        self.titleEdgeInsets = UIEdgeInsetsMake(0, (2*circleRadius + 4*circleLayer.lineWidth), 0, 0)

    }

    func rectForSquare() ->CGRect {
        var rect = CGRectMake(lineWidth, lineWidth, checkBoxWidth, checkBoxWidth)
        return rect
    }
    override func prepareForInterfaceBuilder() {
        initialize()
    }
}
