//
//  GarbageModel.swift
//  Garbage
//
//  Created by LonelyTown on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class GarbageModel: NSObject {
    
    public func colorGroup() -> NSArray{
        let color1 = UIColor.init(r: 78, g: 49, b: 44, a: 1.0)
        let color2 = UIColor.init(r: 35, g: 33, b: 31, a: 1.0)
        let color3 = UIColor.init(r: 26, g: 63, b: 116, a: 1.0)
        let color4 = UIColor.init(r: 225, g: 37, b: 37, a: 1.0)
        
        return [color1,color2,color3,color4]
        
    }
    
    public func titleArray() -> NSArray {
        return ["湿垃圾是指：","干垃圾是指：","可回收物是指：","有害垃圾是指："]
    }
    
    public func contentArray() -> NSArray {
        let content1 = "即易腐垃圾，是指食材废料、剩菜剩饭、过期食品、瓜果皮核、花卉绿植、中药药渣等生物质生活废弃物"
        let content2 = "即其他垃圾，是指可回收物、有害垃圾、湿垃圾以外的其他生活废弃物"
        let content3 = "废纸张、废塑料、废玻璃制品、废金属、废织物等适宜回收、可循环利用的生活废弃物"
        let content4 = "废电池、废灯管、废药品、废油漆及其容器等对人体健康或者自然环境造成直接或者潜在危害的生活废弃物"
        
        return [content1,content2,content3,content4]
    }
}
