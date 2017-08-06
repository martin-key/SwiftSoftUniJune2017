//
//  MARoundButton.swift
//  
//
//  MIT License
//  Copyright (c) 2016 Tyler Miller
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import UIKit

@IBDesignable open class MARoundButton: UIButton {
    
    @IBInspectable open var corner: CGFloat = 0
    @IBInspectable open var border: CGFloat = 0
    @IBInspectable open var borderColor: UIColor?
    @IBInspectable open var borderAlpha: CGFloat = 1.0
    
    override open func draw(_ rect: CGRect) {
        
        self.layer.cornerRadius = corner
        self.layer.borderWidth = border
        self.layer.masksToBounds = true
        guard let color = borderColor else {
            print("Use no color")
            // Sets borderWidth to 0 if no color is picked, in order to prevent unwanted black borders.
            self.layer.borderWidth = 0
            return
        }
        self.layer.borderColor = color.withAlphaComponent(borderAlpha).cgColor
            
        
    }
    
    
}

