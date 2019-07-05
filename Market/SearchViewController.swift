//
//  MarketViewController.swift
//  Market
//
//  Created by Bingo on 2019/7/4.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
//import Alamofire
open class SearchViewController: BaseHiddenBarViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    override open func viewDidLoad() {
        super.viewDidLoad()

     
        self.view.backgroundColor = UIColor(r: 35, g: 173, b: 235, a: 1)
        
        
   
        let btn = UIButton()

        btn.setBackgroundImage(UIImage(named: "imgBtn"), for: .normal)
        

        btn.frame = CGRect(x:0, y: 0, width: kDeviceWidth * 0.6, height: kDeviceWidth * 0.6)
        btn.centerX = self.view.centerX
        btn.centerY = self.view.centerY - 40
        btn.addTarget(self, action: #selector(clickBtn(btn:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
        
    }


    @objc func clickBtn(btn:UIButton)
    {
        let pickerCamera = UIImagePickerController()
        pickerCamera.sourceType = .camera
        pickerCamera.delegate = self
        self.present(pickerCamera, animated: true, completion: nil)
    }
    
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       UIApplication.shared.keyWindow?.rootViewController?.view.makeToastActivity(.center)
        var img = UIImage()
        
        
        if let chosenImage =  info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            picker.dismiss(animated: true) {
                img = chosenImage
                
                let imageData = img.pngData()
                
               
                // 将Data转化成 base64的字符串
                let imageBase64String = imageData?.base64EncodedString()
      
                SearchModel().getData(base: imageBase64String ?? "", dataBlock: { (data) in
                    UIApplication.shared.keyWindow?.rootViewController?.view.hideToastActivity()
                 
                    let alert = UIAlertController(title: "暂无该垃圾分类", message: "点击确定返回", preferredStyle: .alert)
                    
                    
                    let action = UIAlertAction.init(title: "确定", style: .default, handler: nil)
                    
                    alert.addAction(action)
                    
                    
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                })
//
                
            }
            
        }

    }
    

}
