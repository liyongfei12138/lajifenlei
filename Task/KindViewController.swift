//
//  TaskViewController.swift
//  Task
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

open class KindViewController: UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = .black
        initRightItem()
        
    }

    func initRightItem(){
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: #selector(searchAction))
    }
    
    @objc func searchAction(){
        navigationController?.pushViewController(KindSearchViewController.init(), animated: true)
    }

}
