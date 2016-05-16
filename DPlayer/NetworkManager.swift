//
//  NetworkManager.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/20.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class NetworkManager: NSObject {
    
    func getHomepageJson(block:(HomepageModel->Void)) {
        Alamofire.request(.GET, "http://www.quanmin.tv/json/page/appv2-index/info.json").responseJSON() {
            response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    
                    let homepageModel = HomepageModel()
                    var dic =  JSON(value).dictionary!
                    homepageModel.mapTable = dic["list"]!.array!
                    dic.removeValueForKey("list")
                    homepageModel.homepageItems = dic
                    block(homepageModel)
                    
                }
            case .Failure(let error):
                print(error)
            }
            
        }
    }
    
    
    func getHomeInfo(roomID:String, block: (RMRoomModel ->Void)) {
        Alamofire.request(.GET, "http://www.quanmin.tv/json/rooms/\(roomID)/info.json").responseJSON() {
            response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let roomModel = RMRoomModel(json: JSON(value))
                    block(roomModel)
                }
            case .Failure(let error):
                print(error)
            }
            
        }
    }
}
