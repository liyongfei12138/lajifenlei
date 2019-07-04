//
//  MainViewController.swift
//  Config
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Market
import Task
import Opinion
import Interactive
import Me
import ConfigTools
open class MainViewController: UITabBarController {

    
    let market = "市场"
    let task = "任务"
    let opinion = "观点"
    let interactive = "互动"
    let me = "我的"
    


    let marketNorImg = UIImage(named: "") ?? UIImage()
    let taskNorImg  = UIImage(named: "") ?? UIImage()
    let opinionNorImg  = UIImage(named: "") ?? UIImage()
    let interactiveNorImg  = UIImage(named: "") ?? UIImage()
    let meNorImg  = UIImage(named: "") ?? UIImage()
    
    let marketSelImg = UIImage(named: "") ?? UIImage()
    let taskSelImg  = UIImage(named: "") ?? UIImage()
    let opinionSelImg  = UIImage(named: "") ?? UIImage()
    let interactiveSelImg  = UIImage(named: "") ?? UIImage()
    let meSelImg  = UIImage(named: "") ?? UIImage()
    
    open  override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        self.configUi()
    }
    
    func configUi() {
        
        let marketNav = self.configNav(titleString: market, norImg: marketNorImg, seleImg: marketSelImg, vc: MarketViewController())
        
        let taskNav = self.configNav(titleString: task, norImg: taskNorImg, seleImg: taskSelImg, vc: TaskViewController())
        
        let opinionNav = self.configNav(titleString: opinion, norImg: interactiveNorImg, seleImg: opinionSelImg, vc: OpinionViewController())
        
        let interactiveNav = self.configNav(titleString: interactive, norImg: interactiveNorImg, seleImg: interactiveSelImg, vc: InteractiveViewController())
        
        let meNav = self.configNav(titleString: me, norImg: meNorImg, seleImg: meSelImg, vc: MeViewController())
        
        viewControllers = [marketNav,taskNav,opinionNav,interactiveNav,meNav]
        
    }

    func configNav(titleString: String, norImg: UIImage, seleImg: UIImage, vc: UIViewController) -> UINavigationController {
    
        let nav = UINavigationController(rootViewController: vc)
        let norNattributes =  [NSAttributedString.Key.foregroundColor: KNorColor]
        let selNattributes =  [NSAttributedString.Key.foregroundColor: KMainColor]
    
        nav.tabBarController?.tabBar.tintColor = UIColor.white
        nav.tabBarItem.setTitleTextAttributes(norNattributes, for: .normal)
        nav.tabBarItem.setTitleTextAttributes(selNattributes, for: .selected)
        
        nav.title = titleString
        nav.tabBarItem.image = norImg
        nav.tabBarItem.selectedImage = seleImg
        //        nav.tabBarItem.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
        return nav
    
    }

}
