//
//  BaseHiddenBarViewController.swift
//  ConfigTools
//
//  Created by Bingo on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit

open class BaseHiddenBarViewController: UIViewController,UIGestureRecognizerDelegate {


    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (self.navigationController != nil) && self.navigationController?.viewControllers.count == 1{
            return false
        }
        
        return true
    }

}
