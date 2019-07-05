//
//  ColorPalette.swift
//  CHGP
//
//  Created by LonelyTown on 2019/6/28.
//  Copyright © 2019 LonelyTown. All rights reserved.
//

import UIKit

struct ColorPalette {
    
    static let white = RGBA(255, g: 255, b: 255, a: 1)
    static let black = RGBA(3, g: 3, b: 3, a: 1)
    static let coral = RGBA(244, g: 111, b: 96, a: 1)
    static let whiteSmoke = RGBA(245, g: 245, b: 245, a: 1)
    static let grayChateau = RGBA(163, g: 164, b: 168, a: 1)

}

func RGBA (_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)-> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
