//
//  TaskViewController.swift
//  Task
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import SnapKit
import Segmentio

struct garbageType {
    
    var color:UIColor?
    var title:String?
    var content:String?
    var imageName:String?
    var dataArray:NSArray?
    
    init(color:UIColor,title:String,content:String,imageName:String,dataArray:NSArray) {
        self.color = color
        self.title = title
        self.content = content
        self.imageName = imageName
        self.dataArray = dataArray
    }
}


//屏幕宽度
let screen_width = UIScreen.main.bounds.width

//屏幕高度
let screen_height = UIScreen.main.bounds.height

let navBar_Height = UIApplication.shared.statusBarFrame.height + 44


open class KindViewController: UIViewController {
    
    var garbageParam: garbageType?

    var dataArray  = NSArray()
    
    
    //湿垃圾  干垃圾   可回收物  有害垃圾
    lazy var tableView:UITableView = {
        let table = UITableView.init(frame: self.view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UINib.init(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        table.rowHeight = 50.0
        table.tableHeaderView = GarbageCateHeaderView.configHeaderView(frame: CGRect(x: 0, y: 0, width: screen_width, height: 150), color: garbageParam!.color!, imageName: garbageParam!.imageName!, title: garbageParam!.title!, content: garbageParam!.content!)
        return table
    }()
    
    
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        initRightItem()
        
        print(garbageParam as Any)
        
        dataArray = garbageParam!.dataArray!
        
        self.view.addSubview(tableView)
        
    }

    func initRightItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: #selector(searchAction))
        
    }
    
    @objc func searchAction(){
        navigationController?.pushViewController(KindSearchViewController.init(), animated: true)
    }

}

extension KindViewController:UITableViewDelegate,UITableViewDataSource{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        
//
//        let dict : NSDictionary = dataArray.object(at: indexPath.section) as! NSDictionary
//        let valueArray : NSArray = dict.object(forKey: "items") as! NSArray
        let futureDic : NSDictionary = dataArray.object(at: indexPath.row) as! NSDictionary
        
        cell.futureNameLabel.text = futureDic.object(forKey: "name") as? String
        cell.futureCodeLabel.text = ""
        cell.selectionStyle = .none
        return cell
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
