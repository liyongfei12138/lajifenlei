//
//  SearchResultController.swift
//  CHGP
//
//  Created by LonelyTown on 2019/6/26.
//  Copyright © 2019 LonelyTown. All rights reserved.
//

import UIKit

protocol searchResultDelegate {
    func searchResultCallBack(info:NSDictionary)
}

class SearchResultController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    let resultArray = NSMutableArray.init()
    
    var delegate : searchResultDelegate?
    
    lazy var tableView:UITableView = {
        let table = UITableView.init(frame: self.view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UINib.init(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        var rect = table.contentOffset
        rect.y = -100
        table.contentOffset = rect
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "搜索结果"
        self.view.addSubview(tableView)
//        tableView.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalToSuperview()
//            make.top.equalToSuperview().offset(kNavBarHeight() + 55)
//        }
    }
    
    func updateSearchResult(dataArray:NSMutableArray){
        resultArray.removeAllObjects()
        resultArray.addObjects(from: dataArray as! [Any])
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        let futureDic : NSDictionary = resultArray.object(at: indexPath.row) as! NSDictionary
//
//        self.delegate?.searchResultCallBack(info: futureDic)

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        
        
        let futureDic : NSDictionary = resultArray.object(at: indexPath.row) as! NSDictionary
        
        cell.futureNameLabel.text = futureDic.object(forKey: "name") as? String
        cell.futureCodeLabel.text = futureDic.object(forKey: "code") as? String
        cell.selectionStyle = .none
        return cell
    }
    

}
