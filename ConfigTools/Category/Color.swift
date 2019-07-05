//
//  color.swift
//  QCStock
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor{

    convenience init(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat){
        
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)

    }
    
    func createImage(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? nil
    }
    
}
