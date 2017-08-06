//
//  DrawableCircleView.swift
//  SwiftL8
//
//  Created by Martin Kuvandzhiev on 8/2/17.
//  Copyright © 2017 Rapid Development Crew. All rights reserved.
//

import UIKit

class DrawableCircleView: UIView {

    var angle:CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        drawCanvas1(frame: rect, angle: angle)
    }
    
    func drawCanvas1(frame: CGRect = CGRect(x: 0, y: 0, width: 300, height: 300), angle: CGFloat = 90) {
        
        //// Oval Drawing
        let ovalRect = CGRect(x: frame.minX + 53, y: frame.minY + 53, width: frame.width - 106, height: frame.height - 106)
        let ovalPath = UIBezierPath()
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY), radius: ovalRect.width / 2, startAngle: -angle * CGFloat.pi/180, endAngle: 0 * CGFloat.pi/180, clockwise: true)
        ovalPath.addLine(to: CGPoint(x: ovalRect.midX, y: ovalRect.midY))
        ovalPath.close()
        
        UIColor.red.setFill()
        ovalPath.fill()
        UIColor.green.setStroke()
        ovalPath.lineWidth = 3
        ovalPath.stroke()
    }


}
