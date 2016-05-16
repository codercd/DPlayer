//
//  File.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/21.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import Foundation

public func valueFrom(object: Any, key: String) -> Any? {
    let mirror = Mirror(reflecting: object)
    
    for i in mirror.children.startIndex..<mirror.children.endIndex {
        let (targetKey, targetMirror) = mirror.children[i]
        
        print(key)
        print(targetKey)
        print(targetMirror)
        
        if "app_lol" == targetKey {
            return targetMirror
        }
    }
    
    return nil
}