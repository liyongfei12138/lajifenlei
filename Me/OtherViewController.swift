//
//  MeViewController.swift
//  Me
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

open class OtherViewController: BaseHiddenBarViewController,clickDelegate {
   
    
    lazy var infoImg: Array<String> = {
        
        return ["other_img1","other_img2","other_img3","other_img4"]
    }()

    lazy var infoTitle: Array<String> = {
        
        return ["可回收物","有害垃圾","湿垃圾","干垃圾"]
    }()
    
    
    let nav = OtherNavView(frame: CGRect(x: 0, y: 0, width: kDeviceWidth, height: kDeviceNavHeight), title: "其他")
    
    let btnView = OtherButton(frame: CGRect(x: 0, y: kDeviceNavHeight + 20, width: kDeviceWidth, height: kDeviceWidth * 0.2))
    
    let detailLabel = UILabel()
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.addSubview(nav)

        btnView.delegate = self
        self.view.addSubview(btnView)
        
        
        detailLabel.frame = CGRect(x: 20, y: btnView.y + btnView.height + 30, width: kDeviceWidth - 40, height: 300)
        detailLabel.font = UIFont.systemFont(ofSize: 17)
        detailLabel.textColor = UIColor(r: 81, g: 81, b: 81, a: 1)
        detailLabel.text = "鼓励将可回收物卖入废品回收系统，或交投至两网融合服务点，或投放至可回收物收集容器；严禁将有害垃圾投放到其他的生活垃圾收集容器；日常家庭生活垃圾要做到干、湿垃圾两分开。 \n\n 本系统仅供参考，具体分类要求以属地专业管理部门为准。"
        detailLabel.numberOfLines = 0
        detailLabel.sizeToFit()
        self.view.addSubview(detailLabel)
        
        
    }
    func clickButtonWithTag(tag: Int) {
        
        let detail = OtherDetailViewController(img: infoImg[tag], title: infoTitle[tag])
        detail.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(detail, animated: true)
        
    }


}
