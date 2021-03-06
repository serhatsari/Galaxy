/**
 This file is part of the CollectionViewSlantedLayout package.
 
 Copyright (c) 2016 Yassir Barchi <dev.yassir@gmail.com>
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

/**
 CollectionViewSlantedCell is a subclass of UICollectionViewCell. 
 Use it or subclass it to apply the slanting mask on your cells.
 */
@objc open class CollectionViewSlantedCell: UICollectionViewCell {
    
    /// :nodoc:
    fileprivate var slantedLayerMask: CAShapeLayer?
    
    /// :nodoc:
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard let mask = self.slantedLayerMask else {
            return super.point(inside: point, with: event)
        }
        
        let bezierPath = UIBezierPath()
        bezierPath.cgPath = mask.path!
        let result = bezierPath.contains(point)
        return result
    }
    
    /// :nodoc:
    override open func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        guard let layoutAttributes = layoutAttributes as? CollectionViewSlantedLayoutAttributes else {
            return
        }
        self.slantedLayerMask = layoutAttributes.slantedLayerMask
        self.layer.mask = layoutAttributes.slantedLayerMask
    }
}

