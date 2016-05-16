//
//  RMRoomLines.swift
//
//  Created by LiChendi on 16/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class RMRoomLines: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kRMRoomLinesRtmpKey: String = "rtmp"
	internal let kRMRoomLinesFlvKey: String = "flv"
	internal let kRMRoomLinesDefMobileKey: String = "def_mobile"
	internal let kRMRoomLinesNameKey: String = "name"
	internal let kRMRoomLinesDefPcKey: String = "def_pc"
	internal let kRMRoomLinesHlsKey: String = "hls"


    // MARK: Properties
	public var rtmp: RMRtmp?
	public var flv: RMFlv?
	public var defMobile: String?
	public var name: String?
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
		rtmp = RMRtmp(json: json[kRMRoomLinesRtmpKey])
		flv = RMFlv(json: json[kRMRoomLinesFlvKey])
		defMobile = json[kRMRoomLinesDefMobileKey].string
		name = json[kRMRoomLinesNameKey].string
		defPc = json[kRMRoomLinesDefPcKey].string
		hls = RMHls(json: json[kRMRoomLinesHlsKey])

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
		rtmp <- map[kRMRoomLinesRtmpKey]
		flv <- map[kRMRoomLinesFlvKey]
		defMobile <- map[kRMRoomLinesDefMobileKey]
		name <- map[kRMRoomLinesNameKey]
		defPc <- map[kRMRoomLinesDefPcKey]
		hls <- map[kRMRoomLinesHlsKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if rtmp != nil {
			dictionary.updateValue(rtmp!.dictionaryRepresentation(), forKey: kRMRoomLinesRtmpKey)
		}
		if flv != nil {
			dictionary.updateValue(flv!.dictionaryRepresentation(), forKey: kRMRoomLinesFlvKey)
		}
		if defMobile != nil {
			dictionary.updateValue(defMobile!, forKey: kRMRoomLinesDefMobileKey)
		}
		if name != nil {
			dictionary.updateValue(name!, forKey: kRMRoomLinesNameKey)
		}
		if defPc != nil {
			dictionary.updateValue(defPc!, forKey: kRMRoomLinesDefPcKey)
		}
		if hls != nil {
			dictionary.updateValue(hls!.dictionaryRepresentation(), forKey: kRMRoomLinesHlsKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.rtmp = aDecoder.decodeObjectForKey(kRMRoomLinesRtmpKey) as? RMRtmp
		self.flv = aDecoder.decodeObjectForKey(kRMRoomLinesFlvKey) as? RMFlv
		self.defMobile = aDecoder.decodeObjectForKey(kRMRoomLinesDefMobileKey) as? String
		self.name = aDecoder.decodeObjectForKey(kRMRoomLinesNameKey) as? String
		self.defPc = aDecoder.decodeObjectForKey(kRMRoomLinesDefPcKey) as? String
		self.hls = aDecoder.decodeObjectForKey(kRMRoomLinesHlsKey) as? RMHls

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(rtmp, forKey: kRMRoomLinesRtmpKey)
		aCoder.encodeObject(flv, forKey: kRMRoomLinesFlvKey)
		aCoder.encodeObject(defMobile, forKey: kRMRoomLinesDefMobileKey)
		aCoder.encodeObject(name, forKey: kRMRoomLinesNameKey)
		aCoder.encodeObject(defPc, forKey: kRMRoomLinesDefPcKey)
		aCoder.encodeObject(hls, forKey: kRMRoomLinesHlsKey)

    }

}
