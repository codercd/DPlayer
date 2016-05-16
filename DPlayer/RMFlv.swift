//
//  RMFlv.swift
//
//  Created by LiChendi on 16/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class RMFlv: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kRMFlvMainMobileKey: String = "main_mobile"
	internal let kRMFlvMainPcKey: String = "main_pc"
    internal let kLiveListKey: String = "0"


    // MARK: Properties
	public var mainMobile: Int?
	public var mainPc: Int?
    public var liveList:Dictionary<String,String>?
    public var liveURL:String?

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
		mainMobile = json[kRMFlvMainMobileKey].int
		mainPc = json[kRMFlvMainPcKey].int
        let mainMobileStr = mainMobile!.description
        liveList = json.dictionaryObject?[mainMobileStr] as? Dictionary<String,String>
        liveURL = liveList?["src"]
        print("flv --   \(json)")
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
		mainMobile <- map[kRMFlvMainMobileKey]
		mainPc <- map[kRMFlvMainPcKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if mainMobile != nil {
			dictionary.updateValue(mainMobile!, forKey: kRMFlvMainMobileKey)
		}
		if mainPc != nil {
			dictionary.updateValue(mainPc!, forKey: kRMFlvMainPcKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.mainMobile = aDecoder.decodeObjectForKey(kRMFlvMainMobileKey) as? Int
		self.mainPc = aDecoder.decodeObjectForKey(kRMFlvMainPcKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(mainMobile, forKey: kRMFlvMainMobileKey)
		aCoder.encodeObject(mainPc, forKey: kRMFlvMainPcKey)

    }

}
