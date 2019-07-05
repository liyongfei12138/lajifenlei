//
//  UIView+Frame.swift
//  QCStock
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

public extension UIView {
    var width : CGFloat {
        get{
            return self.bounds.size.width
        }
        set(width) {

            self.frame.size = CGSize(width: width, height: self.frame.height)
        }
    }
    
    var height : CGFloat {
        get{
            return self.bounds.size.height
        }
        set(height) {
            
            self.frame.size = CGSize(width: width, height: self.frame.height)
        }
    }
    var x : CGFloat {
        get{
            return self.frame.origin.x
        }
        set(x) {
            
            self.frame = CGRect(x: x, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height)
        }
    }
    
    var y : CGFloat {
        get{
            return self.frame.origin.y
        }
        set(y) {
            
            self.frame = CGRect(x: self.frame.origin.x, y:y , width: self.frame.width, height: self.frame.height)
        }
    }
    
    var centerX : CGFloat {
        get{
            return self.center.x
        }
        set(centerX) {
            
            self.center = CGPoint(x: centerX, y: self.center.y)
        }
    }
    
    var centerY : CGFloat {
        get{
            return self.center.y
        }
        set(centerY) {
            
            self.center = CGPoint(x: self.center.x, y:centerY)
        }
    }
    
}
