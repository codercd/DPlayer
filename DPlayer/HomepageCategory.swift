//
//  HomepageCategories.swift
//
//  Created by LiChendi on 16/4/21
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class HomepageCategory: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kHomepageCategoriesHomepageItemKey: String = "homepageItem"


    // MARK: Properties
	public var homepageItem: [HomepageItem]?
//    var slug = ""
//    var list = Dictionary<String, Array<HomepageItem>>()
    

    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		homepageItem = []
        

//        print("arrrrr \(json[kHomepageCategoriesHomepageItemKey].array)")
//		if let items = json[kHomepageCategoriesHomepageItemKey].array {
//			for item in items {
//				homepageItem?.append(HomepageItem(json: item))
//			}
//		} else {
//			homepageItem = nil
//		}
        for item in json {
//
            homepageItem?.append(HomepageItem(json: item.1))
//            list = [slug : homepageItem!]
//            print("---------------\(list)")
        }

    }

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required public init?(_ map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    public func mapping(map: Map) {
		homepageItem <- map[kHomepageCategoriesHomepageItemKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if homepageItem?.count > 0 {
			var temp: [AnyObject] = []
			for item in homepageItem! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kHomepageCategoriesHomepageItemKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.homepageItem = aDecoder.decodeObjectForKey(kHomepageCategoriesHomepageItemKey) as? [HomepageItem]

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(homepageItem, forKey: kHomepageCategoriesHomepageItemKey)

    }

}
