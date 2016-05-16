//
//  HomepageModel.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/21.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class HomepageModel: NSObject {
//    var categories = Array<HomepageCategory>()
//    var slug = ""
//    var list = Dictionary<String, HomepageCategories>()
    var lists = Dictionary<String, HomepageCategory>()
    var homepageItems = Dictionary<String,JSON>(){
        willSet {
            for item in newValue {
                let homepageCategory = HomepageCategory(json: item.1)
//                list = [item.0 : homepageCategories]
                lists[item.0] = homepageCategory
    
            }
        }
    }
    var mapTable = Array<JSON>() {
        willSet {
//            print(newValue)
        }
    }
    
    func homepageCategoryForSection(section:Int) -> HomepageCategory? {
        let slug = self.mapTable[section]["slug"].description
//        print(self.mapTable)
        for item in self.lists {
            if item.0 == slug {
                return item.1
            }
        }
        return nil
    }
    
    func slugForSection(section:Int) -> String {
        return self.mapTable[section].description
    }
    
    
}
