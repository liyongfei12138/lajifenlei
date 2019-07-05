//
//  UIFont+ExampleFonts.swift
//
//  Created by LonelyTown on 2019/6/28.
//  Copyright © 2019 LonelyTown. All rights reserved.
//
import UIKit

extension UIFont {
    
    class func avenirMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func avenirLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }

}
