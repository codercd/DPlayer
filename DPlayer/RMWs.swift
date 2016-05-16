//
//  RMWs.swift
//
//  Created by LiChendi on 16/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class RMWs: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kRMWsRtmpKey: String = "rtmp"
	internal let kRMWsFlvKey: String = "flv"
	internal let kRMWsDefMobileKey: String = "def_mobile"
	internal let kRMWsDefPcKey: String = "def_pc"
	internal let kRMWsHlsKey: String = "hls"


    // MARK: Properties
	public var rtmp: RMRtmp?
	public var flv: RMFlv?
	public var defMobile: String?
	public var defPc: String?
	public var hls: RMHls?


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
//        print(json)
		rtmp = RMRtmp(json: json[kRMWsRtmpKey])
		flv = RMFlv(json: json[kRMWsFlvKey])
		defMobile = json[kRMWsDefMobileKey].string
		defPc = json[kRMWsDefPcKey].string
		hls = RMHls(json: json[kRMWsHlsKey])

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
		rtmp <- map[kRMWsRtmpKey]
		flv <- map[kRMWsFlvKey]
		defMobile <- map[kRMWsDefMobileKey]
		defPc <- map[kRMWsDefPcKey]
		hls <- map[kRMWsHlsKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if rtmp != nil {
			dictionary.updateValue(rtmp!.dictionaryRepresentation(), forKey: kRMWsRtmpKey)
		}
		if flv != nil {
			dictionary.updateValue(flv!.dictionaryRepresentation(), forKey: kRMWsFlvKey)
		}
		if defMobile != nil {
			dictionary.updateValue(defMobile!, forKey: kRMWsDefMobileKey)
		}
		if defPc != nil {
			dictionary.updateValue(defPc!, forKey: kRMWsDefPcKey)
		}
		if hls != nil {
			dictionary.updateValue(hls!.dictionaryRepresentation(), forKey: kRMWsHlsKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.rtmp = aDecoder.decodeObjectForKey(kRMWsRtmpKey) as? RMRtmp
		self.flv = aDecoder.decodeObjectForKey(kRMWsFlvKey) as? RMFlv
		self.defMobile = aDecoder.decodeObjectForKey(kRMWsDefMobileKey) as? String
		self.defPc = aDecoder.decodeObjectForKey(kRMWsDefPcKey) as? String
		self.hls = aDecoder.decodeObjectForKey(kRMWsHlsKey) as? RMHls

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(rtmp, forKey: kRMWsRtmpKey)
		aCoder.encodeObject(flv, forKey: kRMWsFlvKey)
		aCoder.encodeObject(defMobile, forKey: kRMWsDefMobileKey)
		aCoder.encodeObject(defPc, forKey: kRMWsDefPcKey)
		aCoder.encodeObject(hls, forKey: kRMWsHlsKey)

    }

}
