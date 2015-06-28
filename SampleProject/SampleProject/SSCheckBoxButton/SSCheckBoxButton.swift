//
//  SSCheckBoxButton.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 03/06/2015.
//  Copyright (c) 2015 Shamas Shahid. All rights reserved.
//

import UIKit

@IBDesignable class SSCheckBoxButton: UIButton {

    private var tickLayer = CAShapeLayer()
    private var backLayer = CAShapeLayer()
    @IBInspectable var checkBoxColor: UIColor = UIColor.redColor()
    @IBInspectable var insetEdge: CGFloat = 2 {
        didSet {
            self.layoutIfNeeded()
        }
    }
    @IBInspectable var lineWidth: CGFloat = 2
    @IBInspectable var tickLineWidth: CGFloat = 4
    var animationDuration = 0.25

    override var selected: Bool {
        didSet {
            self.updateState()
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    private func initialize() {
        var aRect = rectForSquare()
        backLayer.frame = aRect
        backLayer.lineWidth = lineWidth
        backLayer.fillColor = UIColor.clearColor().CGColor
        backLayer.strokeColor = checkBoxColor.CGColor
        layer.addSublayer(backLayer)
        backLayer.path = UIBezierPath(roundedRect: rectForSquare(), cornerRadius: 1).CGPath

        self.titleEdgeInsets = UIEdgeInsetsMake(0, (aRect.size.width), 0, 0)
        self.addTarget(self, action: "pressed:", forControlEvents: UIControlEvents.TouchUpInside)
        updateState()
    }

    func pressed(button: UIButton) {
        if self.selected {
            self.selected = false
        } else {
            self.selected = true
        }
    }

    private func updateState() {
        if selected {
            var boundingRect = rectForSquare()
            backLayer.lineWidth = lineWidth
            backLayer.path = UIBezierPath(roundedRect: boundingRect, cornerRadius: 1).CGPath
            backLayer.frame = boundingRect
            backLayer.strokeColor = checkBoxColor.CGColor
            var path = UIBezierPath()
            path.moveToPoint(CGPointMake(tickLineWidth + boundingRect.origin.x + (boundingRect.size.width*0.1), boundingRect.origin.y + boundingRect.size.height/2))
            path.addLineToPoint(CGPointMake(boundingRect.origin.x + boundingRect.size.width/2, boundingRect.origin.y + (boundingRect.size.height * 0.9)))
            path.addLineToPoint(CGPointMake(boundingRect.origin.x + (boundingRect.size.width * 1.2),
            boundingRect.origin.y + boundingRect.size.height * 0.2))
            tickLayer.fillColor = UIColor.clearColor().CGColor
            tickLayer.path = path.CGPath
            tickLayer.frame = bounds
            tickLayer.strokeColor = UIColor.blackColor().CGColor
            tickLayer.lineWidth = tickLineWidth
            tickLayer.lineJoin = kCALineJoinBevel
            layer.addSublayer(tickLayer)
            var pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
            pathAnimation.duration = animationDuration
            pathAnimation.fromValue = NSNumber(float: 0.0)
            pathAnimation.toValue = NSNumber(float: 1.0)
            tickLayer.addAnimation(pathAnimation, forKey: "strokeEndAnimation")
        } else {
            tickLayer.removeFromSuperlayer()
        }
    }

    private func rectForSquare() ->CGRect {
        var rect = CGRectMake(insetEdge, insetEdge, (frame.size.width > frame.size.height ? frame.size.height : frame.size.width) - (4 * insetEdge) , (frame.size.width > frame.size.height ? frame.size.height : frame.size.width) - (4 * insetEdge))
        return rect
    }

    override func prepareForInterfaceBuilder() {
        initialize()
    }
}
