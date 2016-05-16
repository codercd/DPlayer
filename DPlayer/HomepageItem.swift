//
//  HomepageItem.swift
//
//  Created by LiChendi on 16/4/21
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class HomepageItem: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kHomepageItemTitleKey: String = "title"
	internal let kHomepageItemContentKey: String = "content"
	internal let kHomepageItemFkKey: String = "fk"
	internal let kHomepageItemPriorityKey: String = "priority"
	internal let kHomepageItemLinkObjectKey: String = "link_object"
	internal let kHomepageItemSlotIdKey: String = "slot_id"
	internal let kHomepageItemLinkKey: String = "link"
	internal let kHomepageItemInternalIdentifierKey: String = "id"
	internal let kHomepageItemExtKey: String = "ext"
	internal let kHomepageItemSubtitleKey: String = "subtitle"
	internal let kHomepageItemCreateAtKey: String = "create_at"
	internal let kHomepageItemStatusKey: String = "status"
	internal let kHomepageItemThumbKey: String = "thumb"


    // MARK: Properties
	public var title: String?
	public var content: String?
	public var fk: String?
	public var priority: Int?
	public var linkObject: LinkObject?
	public var slotId: Int?
	public var link: String?
	public var internalIdentifier: Int?
	public var ext: String?
	public var subtitle: String?
	public var createAt: String?
	public var status: Int?
	public var thumb: String?


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
		title = json[kHomepageItemTitleKey].string
		content = json[kHomepageItemContentKey].string
		fk = json[kHomepageItemFkKey].string
		priority = json[kHomepageItemPriorityKey].int
		linkObject = LinkObject(json: json[kHomepageItemLinkObjectKey])
		slotId = json[kHomepageItemSlotIdKey].int
		link = json[kHomepageItemLinkKey].string
		internalIdentifier = json[kHomepageItemInternalIdentifierKey].int
		ext = json[kHomepageItemExtKey].string
		subtitle = json[kHomepageItemSubtitleKey].string
		createAt = json[kHomepageItemCreateAtKey].string
		status = json[kHomepageItemStatusKey].int
		thumb = json[kHomepageItemThumbKey].string

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
		title <- map[kHomepageItemTitleKey]
		content <- map[kHomepageItemContentKey]
		fk <- map[kHomepageItemFkKey]
		priority <- map[kHomepageItemPriorityKey]
		linkObject <- map[kHomepageItemLinkObjectKey]
		slotId <- map[kHomepageItemSlotIdKey]
		link <- map[kHomepageItemLinkKey]
		internalIdentifier <- map[kHomepageItemInternalIdentifierKey]
		ext <- map[kHomepageItemExtKey]
		subtitle <- map[kHomepageItemSubtitleKey]
		createAt <- map[kHomepageItemCreateAtKey]
		status <- map[kHomepageItemStatusKey]
		thumb <- map[kHomepageItemThumbKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title!, forKey: kHomepageItemTitleKey)
		}
		if content != nil {
			dictionary.updateValue(content!, forKey: kHomepageItemContentKey)
		}
		if fk != nil {
			dictionary.updateValue(fk!, forKey: kHomepageItemFkKey)
		}
		if priority != nil {
			dictionary.updateValue(priority!, forKey: kHomepageItemPriorityKey)
		}
		if linkObject != nil {
			dictionary.updateValue(linkObject!.dictionaryRepresentation(), forKey: kHomepageItemLinkObjectKey)
		}
		if slotId != nil {
			dictionary.updateValue(slotId!, forKey: kHomepageItemSlotIdKey)
		}
		if link != nil {
			dictionary.updateValue(link!, forKey: kHomepageItemLinkKey)
		}
		if internalIdentifier != nil {
			dictionary.updateValue(internalIdentifier!, forKey: kHomepageItemInternalIdentifierKey)
		}
		if ext != nil {
			dictionary.updateValue(ext!, forKey: kHomepageItemExtKey)
		}
		if subtitle != nil {
			dictionary.updateValue(subtitle!, forKey: kHomepageItemSubtitleKey)
		}
		if createAt != nil {
			dictionary.updateValue(createAt!, forKey: kHomepageItemCreateAtKey)
		}
		if status != nil {
			dictionary.updateValue(status!, forKey: kHomepageItemStatusKey)
		}
		if thumb != nil {
			dictionary.updateValue(thumb!, forKey: kHomepageItemThumbKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObjectForKey(kHomepageItemTitleKey) as? String
		self.content = aDecoder.decodeObjectForKey(kHomepageItemContentKey) as? String
		self.fk = aDecoder.decodeObjectForKey(kHomepageItemFkKey) as? String
		self.priority = aDecoder.decodeObjectForKey(kHomepageItemPriorityKey) as? Int
		self.linkObject = aDecoder.decodeObjectForKey(kHomepageItemLinkObjectKey) as? LinkObject
		self.slotId = aDecoder.decodeObjectForKey(kHomepageItemSlotIdKey) as? Int
		self.link = aDecoder.decodeObjectForKey(kHomepageItemLinkKey) as? String
		self.internalIdentifier = aDecoder.decodeObjectForKey(kHomepageItemInternalIdentifierKey) as? Int
		self.ext = aDecoder.decodeObjectForKey(kHomepageItemExtKey) as? String
		self.subtitle = aDecoder.decodeObjectForKey(kHomepageItemSubtitleKey) as? String
		self.createAt = aDecoder.decodeObjectForKey(kHomepageItemCreateAtKey) as? String
		self.status = aDecoder.decodeObjectForKey(kHomepageItemStatusKey) as? Int
		self.thumb = aDecoder.decodeObjectForKey(kHomepageItemThumbKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(title, forKey: kHomepageItemTitleKey)
		aCoder.encodeObject(content, forKey: kHomepageItemContentKey)
		aCoder.encodeObject(fk, forKey: kHomepageItemFkKey)
		aCoder.encodeObject(priority, forKey: kHomepageItemPriorityKey)
		aCoder.encodeObject(linkObject, forKey: kHomepageItemLinkObjectKey)
		aCoder.encodeObject(slotId, forKey: kHomepageItemSlotIdKey)
		aCoder.encodeObject(link, forKey: kHomepageItemLinkKey)
		aCoder.encodeObject(internalIdentifier, forKey: kHomepageItemInternalIdentifierKey)
		aCoder.encodeObject(ext, forKey: kHomepageItemExtKey)
		aCoder.encodeObject(subtitle, forKey: kHomepageItemSubtitleKey)
		aCoder.encodeObject(createAt, forKey: kHomepageItemCreateAtKey)
		aCoder.encodeObject(status, forKey: kHomepageItemStatusKey)
		aCoder.encodeObject(thumb, forKey: kHomepageItemThumbKey)

    }

}
