//
//  GarbageTypeViewController.swift
//  Garbage
//
//  Created by LonelyTown on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Segmentio

private let segmentView_Height : CGFloat = 55
private let scroll_height = screen_height - navBar_Height - 22

class GarbageTypeViewController: UIViewController {
    
    var segmentioStyle = SegmentioStyle.imageBeforeLabel
    
    private lazy var scrollView :UIScrollView = {
        let scroll = UIScrollView.init()
        scroll.frame = CGRect(x: 0, y: navBar_Height + segmentView_Height - 1, width: screen_width, height: scroll_height)
        scroll.contentSize = CGSize(width: screen_width * 4, height: 100 )
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = true
        scroll.bounces = false
        scroll.delegate = self
        return scroll
    }()
    
    private lazy var viewControllers: [UIViewController] = {
        return self.preparedViewControllers()
    }()
    
    lazy var segmentioView : Segmentio = {
        let segment = Segmentio.init(frame: .zero)
        segment.backgroundColor = .cyan
        segment.selectedSegmentioIndex = 0
        
        return segment
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        configNav(title: "实时行情", isHiddenNavbar: false, isHiddenBackItem: true,isHiddenRightItem: false)
        
        configSegmentView()
        self.view.addSubview(segmentioView)
        segmentioView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(segmentView_Height)
            make.top.equalToSuperview().offset(navBar_Height)
        }
        
        self.view.addSubview(self.scrollView)
        
        
        setupScrollView()
        
        initRightItem()
    }
    
    func initRightItem(){
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "search_black"), style: .plain, target: self, action: #selector(searchAction))
        
        let leftLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        leftLabel.text = "分类"
        leftLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftLabel)
    }
    
    @objc func searchAction(){
        let vc = KindSearchViewController.init()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configSegmentView(){
        
        SegmentioBuilder.buildSegmentioView(
            segmentioView: segmentioView,
            segmentioStyle: segmentioStyle
        )
        
        segmentioView.valueDidChange = { [weak self] _, segmentIndex in
            if let scrollViewWidth = self?.scrollView.frame.width {
                let contentOffsetX = scrollViewWidth * CGFloat(segmentIndex)
                self?.scrollView.setContentOffset(
                    CGPoint(x: contentOffsetX, y: 0),
                    animated: true
                )
            }
        }
    }
    
    private func setupScrollView() {
        
        
        for (index, viewController) in viewControllers.enumerated() {
            viewController.view.frame = CGRect(
                x: UIScreen.main.bounds.width * CGFloat(index),
                y: 0,
                width: screen_width,
                height: scroll_height
            )
            addChild(viewController)
            scrollView.addSubview(viewController.view)
            viewController.didMove(toParent: self)
        }
    }
    
    private func preparedViewControllers() -> [KindViewController] {
        
        var dataArray = NSArray()
        do {
            /*
             * try 和 try! 的区别
             * try 发生异常会跳到catch代码中
             * try! 发生异常程序会直接crash
             */
            
            let data = try Data.init(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "catalog", ofType: "json")!))
            
            let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            
            
            dataArray = (jsonData as! NSDictionary).object(forKey: "data") as! NSArray
            
            
        } catch {
            print("读取本地数据出现错误!")
        }
        
        
        let typeVC = KindViewController.init()
        let dataDict = dataArray.object(at: 0) as! NSDictionary
        typeVC.garbageParam = garbageType.init(color: colorGroup().object(at: 0) as! UIColor , title: titleArray().object(at: 0) as! String, content: contentArray().object(at: 0) as! String, imageName: "shilaji",dataArray: dataDict.object(forKey: "items") as! NSArray)
        
        let marketVC1 = KindViewController.init()
        let dataDict1 = dataArray.object(at: 1) as! NSDictionary

        marketVC1.garbageParam = garbageType.init(color: colorGroup().object(at: 1) as! UIColor, title: titleArray().object(at: 1) as! String, content: contentArray().object(at: 1) as! String, imageName: "ganlaji",dataArray: dataDict1.object(forKey: "items") as! NSArray)

        let marketVC2 = KindViewController.init()
        let dataDict2 = dataArray.object(at: 2) as! NSDictionary
        marketVC2.garbageParam = garbageType.init(color: colorGroup().object(at: 2) as! UIColor, title: titleArray().object(at: 2) as! String, content: contentArray().object(at: 2) as! String, imageName: "kehuishouwu",dataArray: dataDict2.object(forKey: "items") as! NSArray)

        let marketVC3 = KindViewController.init()
        let dataDict3 = dataArray.object(at: 3) as! NSDictionary
        marketVC3.garbageParam = garbageType.init(color: colorGroup().object(at: 3) as! UIColor, title: titleArray().object(at: 3) as! String, content: contentArray().object(at: 3) as! String, imageName: "youhailaji",dataArray: dataDict3.object(forKey: "items") as! NSArray)

        return [
            typeVC,
            marketVC1,
            marketVC2,
            marketVC3
        ]
    }
    
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

extension GarbageTypeViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = floor(scrollView.contentOffset.x / scrollView.frame.width)
        segmentioView.selectedSegmentioIndex = Int(currentPage)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: 0)
    }
}
