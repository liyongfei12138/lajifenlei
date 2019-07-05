//
//  SearchViewController.swift
//  CHGP
//
//  Created by LonelyTown on 2019/6/25.
//  Copyright © 2019 LonelyTown. All rights reserved.
//

import UIKit

protocol searchViewControlDelegate {
    func searchVCCallBack(info:NSDictionary)
}

class KindSearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,searchResultDelegate {
    
    var delegate : searchViewControlDelegate?
    
    var dataArray  = NSArray()
    
    lazy var allDataArray : NSMutableArray = {
        
        let allData : NSMutableArray = NSMutableArray.init()
        
        for dict in dataArray {
            let dataDic = dict as! NSDictionary
            
            let allValue : NSArray = dataDic.object(forKey: "items") as! NSArray
            
            allData.addObjects(from: allValue as! [Any])
            
        }
        
        return allData
    }()
    
    lazy var searchController : UISearchController = {
        let searchResultVC = SearchResultController.init()
        searchResultVC.delegate = self
        
        let search = UISearchController.init(searchResultsController: searchResultVC)
        search.searchResultsUpdater = self
        search.searchBar.returnKeyType = UIReturnKeyType.done
        return search
    }()
    
    lazy var tableView:UITableView = {
        let table = UITableView.init(frame: self.view.bounds, style: .plain)
        table.delegate = self
        table.dataSource = self
        table.register(UINib.init(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        table.tableHeaderView = searchController.searchBar
        table.rowHeight = 50.0
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "搜索"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "main_back"), style: .plain, target: self, action: #selector(backAction))
        definesPresentationContext = true
        
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
        
        view.addSubview(self.tableView)
        
    }
    
    @objc func backAction(){
        navigationController?.popViewController(animated: true)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let reusltVC : SearchResultController = searchController.searchResultsController as! SearchResultController
        
        let searchText : String = searchController.searchBar.text!
        
        let mutableArray = NSMutableArray()
        
        for dict in allDataArray {
            let futureDict = dict as! NSDictionary
            let codeStr = futureDict.object(forKey: "shortcut") as! String
            let name = futureDict.object(forKey: "name") as! String
            
            if name.contains(searchText) || codeStr.contains(searchText) {
                mutableArray.add(dict)
            }
        }
        
        reusltVC.updateSearchResult(dataArray: mutableArray)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dict : NSDictionary = dataArray.object(at: section) as! NSDictionary
        let valueArray : NSArray = dict.object(forKey: "items") as! NSArray
        return valueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : SearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SearchTableViewCell
        
        
        let dict : NSDictionary = dataArray.object(at: indexPath.section) as! NSDictionary
        let valueArray : NSArray = dict.object(forKey: "items") as! NSArray
        let futureDic : NSDictionary = valueArray.object(at: indexPath.row) as! NSDictionary
        
        cell.futureNameLabel.text = futureDic.object(forKey: "name") as? String
        cell.selectionStyle = .none
        
        if futureDic.object(forKey: "category") as! String == "0" {
            cell.futureCodeLabel.text = "[湿垃圾]"
        }
        if futureDic.object(forKey: "category") as! String == "1" {
            cell.futureCodeLabel.text = "[干垃圾]"
        }
        if futureDic.object(forKey: "category") as! String == "2" {
            cell.futureCodeLabel.text = "[可回收物]"
        }
        if futureDic.object(forKey: "category") as! String == "3" {
            cell.futureCodeLabel.text = "[有害垃圾]"
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func searchResultCallBack(info: NSDictionary) {
        self.delegate?.searchVCCallBack(info: info)
    }
}

