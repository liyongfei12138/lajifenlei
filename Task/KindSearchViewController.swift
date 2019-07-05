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
            
            let allValue : NSArray = dataDic.object(forKey: "value") as! NSArray
            
            allData.addObjects(from: allValue as! [Any])
            
        }
        
        return allData
    }()
    
    lazy var searchController : UISearchController = {
        let searchResultVC = SearchResultController.init()
        searchResultVC.delegate = self
        
        let search = UISearchController.init(searchResultsController: searchResultVC)
        search.searchBar.placeholder = "输入垃圾名称或首字母拼音"
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
            
            
        } catch let error as Error? {
            print("读取本地数据出现错误!")
        }
        
        view.addSubview(self.tableView)
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let reusltVC : SearchResultController = searchController.searchResultsController as! SearchResultController
        
        let searchText : String = searchController.searchBar.text!
        
        let mutableArray = NSMutableArray()
        
        for dict in allDataArray {
            let futureDict = dict as! NSDictionary
            let codeStr = futureDict.object(forKey: "code") as! String
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
//        cell.futureCodeLabel.text = futureDic.object(forKey: "shortcut") as? String
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: kDeviceWidth, height: 35))
        headerView.backgroundColor = .groupTableViewBackground
        
        let headerLabel = UILabel.init(frame: CGRect(x: 8, y: 0, width: kDeviceWidth - 8, height: 35))
        headerLabel.backgroundColor = .groupTableViewBackground
        headerLabel.textColor = .darkGray
        headerLabel.font = .systemFont(ofSize: 15.0, weight: .thin)
        let dict : NSDictionary = dataArray.object(at: section) as! NSDictionary
        headerLabel.text = dict.object(forKey: "name") as? String
        headerView.addSubview(headerLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func searchResultCallBack(info: NSDictionary) {
        self.delegate?.searchVCCallBack(info: info)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

