//
//  OtherButton.swift
//  Garbage
//
//  Created by Bingo on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit


protocol clickDelegate {
    func clickButtonWithTag(tag:Int)
}

class OtherButton: UIView {


    var delegate :clickDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUi() {
        
        let arr = ["other_1","other_2","other_3","other_4"]
        
        
        let btnW = kDeviceWidth * 0.2
        let space = kDeviceWidth * 0.2 * 0.2
        
        
        for i in 1...arr.count{
            
            let btn = UIButton()
            btn.tag = i - 1
            btn.setImage(UIImage(named: arr[i-1]), for: .normal)
            btn.frame = CGRect(x: space + (CGFloat(i-1) * (space + btnW)), y: 0, width: btnW, height: btnW)
            btn.addTarget(self, action: #selector(clickBtn(btn:)), for: .touchUpInside)
            self.addSubview(btn)

        }
    }
    
    @objc func clickBtn(btn:UIButton)
    {

        self.delegate?.clickButtonWithTag(tag: btn.tag)
    }
}



