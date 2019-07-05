//
//  GarbageCateHeaderView.swift
//  Garbage
//
//  Created by LonelyTown on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

class GarbageCateHeaderView: UIView {

    var imageName = ""
    
    var title = ""
    
    var content = ""
    
    var color = UIColor.white
    
    var selfFrame = CGRect.zero
   
    func initSubViews(){
        self.backgroundColor = color
        self.frame = selfFrame
        
        let imageView = UIImageView.init(image: UIImage.init(named: imageName))
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(60)
        }
        
        let titleLabel = UILabel.init()
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .black)
        titleLabel.text = title
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(imageView.snp_rightMargin).offset(30)
            make.top.equalToSuperview().offset(24)
            
        }
        
        let contentLabel = UILabel.init()
        contentLabel.textColor = .white
        contentLabel.textAlignment = .left
        contentLabel.text = content
        contentLabel.numberOfLines = 0
        self.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(15)
        }
        
    }
}

extension GarbageCateHeaderView{
    
    static func configHeaderView(frame:CGRect,color:UIColor,imageName:String, title:String,content:String) -> GarbageCateHeaderView{
        
        let headerView = GarbageCateHeaderView()
        
        headerView.title = title
        
        headerView.content = content
        
        headerView.imageName = imageName
        
        headerView.color = color
        
        headerView.selfFrame = frame

        headerView.initSubViews()
        
        return headerView
        
    }
}
