//
//  Model.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/19.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class Model: NSObject {

}

enum LiveBaseURL:String {
    case rtmp = "rtmp://live.quanmin.tv/live/1456011"
    case hls = "http://hls.quanmin.tv/live/1456011/playlist.m3u8"
    case flv = "http://flv.quanmin.tv/live/1456011.flv"
}

//struct HomepageModel {
//    var homepageCategories = Array<HomepageCategory>()
//    
//    
//    var list = Array<AnyObject>() {
//        willSet {
////            print("will - list---- \(newValue)")
//        }
//    }
//    var homepageItems = Dictionary<String, AnyObject>() {
//        willSet {
//            for categories in newValue {
//                var homepageCategory = HomepageCategory()
//                homepageCategory.name = categories.0
//                homepageCategory.detail = categories.1 as! Array<AnyObject>
//                homepageCategories.append(homepageCategory)
//            }
//        }
//    }
//}

//struct HomepageCategory {
//    var name = "" {
//        willSet {
//            print("name----\(newValue)")
//        }
//    }
//    var detail = Array<AnyObject>() {
//        willSet {
//            print("detail----\(newValue)")
////            RoomDetail().
//        }
//    }
//}

struct recommendList {
//    var
}

struct RoomDetail {
    var stateus = 0
    var follow = 0
    var avatar = ""
    var view = 0
    var intro = ""
    var slug = ""
    var category_id = 0
    var category_name = ""
    var category_slug = ""
    var recommend_image = ""
    var nick = ""
    var play_at = ""
    var announcement = ""
    var title = ""
    var uid = ""
    var thumb = ""
    
}


