//
//  OtherNavView.swift
//  Garbage
//
//  Created by Bingo on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class OtherNavView: UIView {

  

    private let titleLabel = UILabel()
    
    func configUi(titleString:String)  {
        
        titleLabel.text = titleString
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.addSubview(titleLabel)
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 20, y: kDeviceStatusHeight + 5, width: 100, height: 30)
    }

}
extension OtherNavView{
    convenience  init(frame: CGRect,title:String) {
        self.init(frame:frame)

        self.configUi(titleString:title)
    }
}
