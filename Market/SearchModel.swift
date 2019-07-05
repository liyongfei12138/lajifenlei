//
//  SearchModel.swift
//  Garbage
//
//  Created by Bingo on 2019/7/5.
//  Copyright © 2019 Bingo. All rights reserved.
//

import UIKit
import Alamofire
class SearchModel: NSObject {
    
    
    let url = "https://aip.baidubce.com/rest/2.0/image-classify/v2/advanced_general?access_token=24.0f9d822071a10669b50c05b855cda6f5.2592000.1564886326.282335-16593598"
    
    typealias dictionaryRequestBlock = (Dictionary<String,Any>)->()
    
    
    
    func getData(base:String,dataBlock:@escaping dictionaryRequestBlock)  {
        
        
        let param = ["image":base]
        
        
        Alamofire.request(url, method: .post, parameters: param).responseData(completionHandler: { (data) in
            
          
            dataBlock(Dictionary<String,Any>())
            
        })
    }

}
