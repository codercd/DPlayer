//
//  RMRoomModel.swift
//
//  Created by LiChendi on 16/4/22
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class RMRoomModel: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kRMRoomModelTitleKey: String = "title"
	internal let kRMRoomModelThumbKey: String = "thumb"
	internal let kRMRoomModelSlugKey: String = "slug"
	internal let kRMRoomModelNickKey: String = "nick"
	internal let kRMRoomModelIntroKey: String = "intro"
	internal let kRMRoomModelLastPlayAtKey: String = "last_play_at"
	internal let kRMRoomModelPlayStatusKey: String = "play_status"
	internal let kRMRoomModelCategoryNameKey: String = "category_name"
	internal let kRMRoomModelAvatarKey: String = "avatar"
	internal let kRMRoomModelRoomLinesKey: String = "room_lines"
	internal let kRMRoomModelUidKey: String = "uid"
	internal let kRMRoomModelAnnouncementKey: String = "announcement"
	internal let kRMRoomModelForbidStatusKey: String = "forbid_status"
	internal let kRMRoomModelIsStarKey: String = "is_star"
	internal let kRMRoomModelViewKey: String = "view"
	internal let kRMRoomModelFollowKey: String = "follow"
	internal let kRMRoomModelWeightKey: String = "weight"
	internal let kRMRoomModelLiveKey: String = "live"
	internal let kRMRoomModelVideoQualityKey: String = "video_quality"
	internal let kRMRoomModelCategoryIdKey: String = "category_id"


    // MARK: Properties
	public var title: String?
	public var thumb: String?
	public var slug: String?
	public var nick: String?
	public var intro: String?
	public var lastPlayAt: String?
	public var playStatus: Bool = false
	public var categoryName: String?
	public var avatar: String?
	public var roomLines: [RMRoomLines]?
	public var uid: Int?
	public var announcement: String?
	public var forbidStatus: Bool = false
	public var isStar: Bool = false
	public var view: Int?
	public var follow: Int?
	public var weight: Int?
	public var live: RMLive?
	public var videoQuality: String?
	public var categoryId: Int?


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
		title = json[kRMRoomModelTitleKey].string
		thumb = json[kRMRoomModelThumbKey].string
		slug = json[kRMRoomModelSlugKey].string
		nick = json[kRMRoomModelNickKey].string
		intro = json[kRMRoomModelIntroKey].string
		lastPlayAt = json[kRMRoomModelLastPlayAtKey].string
		playStatus = json[kRMRoomModelPlayStatusKey].boolValue
		categoryName = json[kRMRoomModelCategoryNameKey].string
		avatar = json[kRMRoomModelAvatarKey].string
		roomLines = []
		if let items = json[kRMRoomModelRoomLinesKey].array {
			for item in items {
				roomLines?.append(RMRoomLines(json: item))
			}
		} else {
			roomLines = nil
		}
		uid = json[kRMRoomModelUidKey].int
		announcement = json[kRMRoomModelAnnouncementKey].string
		forbidStatus = json[kRMRoomModelForbidStatusKey].boolValue
		isStar = json[kRMRoomModelIsStarKey].boolValue
		view = json[kRMRoomModelViewKey].int
		follow = json[kRMRoomModelFollowKey].int
		weight = json[kRMRoomModelWeightKey].int
		live = RMLive(json: json[kRMRoomModelLiveKey])
		videoQuality = json[kRMRoomModelVideoQualityKey].string
		categoryId = json[kRMRoomModelCategoryIdKey].int

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
		title <- map[kRMRoomModelTitleKey]
		thumb <- map[kRMRoomModelThumbKey]
		slug <- map[kRMRoomModelSlugKey]
		nick <- map[kRMRoomModelNickKey]
		intro <- map[kRMRoomModelIntroKey]
		lastPlayAt <- map[kRMRoomModelLastPlayAtKey]
		playStatus <- map[kRMRoomModelPlayStatusKey]
		categoryName <- map[kRMRoomModelCategoryNameKey]
		avatar <- map[kRMRoomModelAvatarKey]
		roomLines <- map[kRMRoomModelRoomLinesKey]
		uid <- map[kRMRoomModelUidKey]
		announcement <- map[kRMRoomModelAnnouncementKey]
		forbidStatus <- map[kRMRoomModelForbidStatusKey]
		isStar <- map[kRMRoomModelIsStarKey]
		view <- map[kRMRoomModelViewKey]
		follow <- map[kRMRoomModelFollowKey]
		weight <- map[kRMRoomModelWeightKey]
		live <- map[kRMRoomModelLiveKey]
		videoQuality <- map[kRMRoomModelVideoQualityKey]
		categoryId <- map[kRMRoomModelCategoryIdKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title!, forKey: kRMRoomModelTitleKey)
		}
		if thumb != nil {
			dictionary.updateValue(thumb!, forKey: kRMRoomModelThumbKey)
		}
		if slug != nil {
			dictionary.updateValue(slug!, forKey: kRMRoomModelSlugKey)
		}
		if nick != nil {
			dictionary.updateValue(nick!, forKey: kRMRoomModelNickKey)
		}
		if intro != nil {
			dictionary.updateValue(intro!, forKey: kRMRoomModelIntroKey)
		}
		if lastPlayAt != nil {
			dictionary.updateValue(lastPlayAt!, forKey: kRMRoomModelLastPlayAtKey)
		}
		dictionary.updateValue(playStatus, forKey: kRMRoomModelPlayStatusKey)
		if categoryName != nil {
			dictionary.updateValue(categoryName!, forKey: kRMRoomModelCategoryNameKey)
		}
		if avatar != nil {
			dictionary.updateValue(avatar!, forKey: kRMRoomModelAvatarKey)
		}
		if roomLines?.count > 0 {
			var temp: [AnyObject] = []
			for item in roomLines! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kRMRoomModelRoomLinesKey)
		}
		if uid != nil {
			dictionary.updateValue(uid!, forKey: kRMRoomModelUidKey)
		}
		if announcement != nil {
			dictionary.updateValue(announcement!, forKey: kRMRoomModelAnnouncementKey)
		}
		dictionary.updateValue(forbidStatus, forKey: kRMRoomModelForbidStatusKey)
		dictionary.updateValue(isStar, forKey: kRMRoomModelIsStarKey)
		if view != nil {
			dictionary.updateValue(view!, forKey: kRMRoomModelViewKey)
		}
		if follow != nil {
			dictionary.updateValue(follow!, forKey: kRMRoomModelFollowKey)
		}
		if weight != nil {
			dictionary.updateValue(weight!, forKey: kRMRoomModelWeightKey)
		}
		if live != nil {
			dictionary.updateValue(live!.dictionaryRepresentation(), forKey: kRMRoomModelLiveKey)
		}
		if videoQuality != nil {
			dictionary.updateValue(videoQuality!, forKey: kRMRoomModelVideoQualityKey)
		}
		if categoryId != nil {
			dictionary.updateValue(categoryId!, forKey: kRMRoomModelCategoryIdKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObjectForKey(kRMRoomModelTitleKey) as? String
		self.thumb = aDecoder.decodeObjectForKey(kRMRoomModelThumbKey) as? String
		self.slug = aDecoder.decodeObjectForKey(kRMRoomModelSlugKey) as? String
		self.nick = aDecoder.decodeObjectForKey(kRMRoomModelNickKey) as? String
		self.intro = aDecoder.decodeObjectForKey(kRMRoomModelIntroKey) as? String
		self.lastPlayAt = aDecoder.decodeObjectForKey(kRMRoomModelLastPlayAtKey) as? String
		self.playStatus = aDecoder.decodeBoolForKey(kRMRoomModelPlayStatusKey)
		self.categoryName = aDecoder.decodeObjectForKey(kRMRoomModelCategoryNameKey) as? String
		self.avatar = aDecoder.decodeObjectForKey(kRMRoomModelAvatarKey) as? String
		self.roomLines = aDecoder.decodeObjectForKey(kRMRoomModelRoomLinesKey) as? [RMRoomLines]
		self.uid = aDecoder.decodeObjectForKey(kRMRoomModelUidKey) as? Int
		self.announcement = aDecoder.decodeObjectForKey(kRMRoomModelAnnouncementKey) as? String
		self.forbidStatus = aDecoder.decodeBoolForKey(kRMRoomModelForbidStatusKey)
		self.isStar = aDecoder.decodeBoolForKey(kRMRoomModelIsStarKey)
		self.view = aDecoder.decodeObjectForKey(kRMRoomModelViewKey) as? Int
		self.follow = aDecoder.decodeObjectForKey(kRMRoomModelFollowKey) as? Int
		self.weight = aDecoder.decodeObjectForKey(kRMRoomModelWeightKey) as? Int
		self.live = aDecoder.decodeObjectForKey(kRMRoomModelLiveKey) as? RMLive
		self.videoQuality = aDecoder.decodeObjectForKey(kRMRoomModelVideoQualityKey) as? String
		self.categoryId = aDecoder.decodeObjectForKey(kRMRoomModelCategoryIdKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(title, forKey: kRMRoomModelTitleKey)
		aCoder.encodeObject(thumb, forKey: kRMRoomModelThumbKey)
		aCoder.encodeObject(slug, forKey: kRMRoomModelSlugKey)
		aCoder.encodeObject(nick, forKey: kRMRoomModelNickKey)
		aCoder.encodeObject(intro, forKey: kRMRoomModelIntroKey)
		aCoder.encodeObject(lastPlayAt, forKey: kRMRoomModelLastPlayAtKey)
		aCoder.encodeBool(playStatus, forKey: kRMRoomModelPlayStatusKey)
		aCoder.encodeObject(categoryName, forKey: kRMRoomModelCategoryNameKey)
		aCoder.encodeObject(avatar, forKey: kRMRoomModelAvatarKey)
		aCoder.encodeObject(roomLines, forKey: kRMRoomModelRoomLinesKey)
		aCoder.encodeObject(uid, forKey: kRMRoomModelUidKey)
		aCoder.encodeObject(announcement, forKey: kRMRoomModelAnnouncementKey)
		aCoder.encodeBool(forbidStatus, forKey: kRMRoomModelForbidStatusKey)
		aCoder.encodeBool(isStar, forKey: kRMRoomModelIsStarKey)
		aCoder.encodeObject(view, forKey: kRMRoomModelViewKey)
		aCoder.encodeObject(follow, forKey: kRMRoomModelFollowKey)
		aCoder.encodeObject(weight, forKey: kRMRoomModelWeightKey)
		aCoder.encodeObject(live, forKey: kRMRoomModelLiveKey)
		aCoder.encodeObject(videoQuality, forKey: kRMRoomModelVideoQualityKey)
		aCoder.encodeObject(categoryId, forKey: kRMRoomModelCategoryIdKey)

    }

}
