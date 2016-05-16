//
//  LinkObject.swift
//
//  Created by LiChendi on 16/4/21
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class LinkObject: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kLinkObjectTitleKey: String = "title"
	internal let kLinkObjectDefaultImageKey: String = "default_image"
	internal let kLinkObjectLockedViewKey: String = "locked_view"
	internal let kLinkObjectRecommendImageKey: String = "recommend_image"
	internal let kLinkObjectCategorySlugKey: String = "category_slug"
	internal let kLinkObjectPlayAtKey: String = "play_at"
	internal let kLinkObjectCategoryNameKey: String = "category_name"
	internal let kLinkObjectWeightAddKey: String = "weight_add"
	internal let kLinkObjectFollowBakKey: String = "follow_bak"
	internal let kLinkObjectViewKey: String = "view"
	internal let kLinkObjectWeightKey: String = "weight"
	internal let kLinkObjectCoinAddKey: String = "coin_add"
	internal let kLinkObjectCheckKey: String = "check"
	internal let kLinkObjectStatusKey: String = "status"
	internal let kLinkObjectSlugKey: String = "slug"
	internal let kLinkObjectNickKey: String = "nick"
	internal let kLinkObjectLevelKey: String = "level"
	internal let kLinkObjectNegativeViewKey: String = "negative_view"
	internal let kLinkObjectGradeKey: String = "grade"
	internal let kLinkObjectCategoryIdKey: String = "category_id"
	internal let kLinkObjectAppShufflingImageKey: String = "app_shuffling_image"
	internal let kLinkObjectIntroKey: String = "intro"
	internal let kLinkObjectAnnouncementKey: String = "announcement"
	internal let kLinkObjectFollowAddKey: String = "follow_add"
	internal let kLinkObjectAvatarKey: String = "avatar"
	internal let kLinkObjectUidKey: String = "uid"
	internal let kLinkObjectFollowKey: String = "follow"
	internal let kLinkObjectPlayCountKey: String = "play_count"
	internal let kLinkObjectFirstPlayAtKey: String = "first_play_at"
	internal let kLinkObjectLastEndAtKey: String = "last_end_at"
	internal let kLinkObjectCoinKey: String = "coin"
	internal let kLinkObjectCreateAtKey: String = "create_at"
	internal let kLinkObjectThumbKey: String = "thumb"
	internal let kLinkObjectVideoQualityKey: String = "video_quality"


    // MARK: Properties
	public var title: String?
	public var defaultImage: String?
	public var lockedView: String?
	public var recommendImage: String?
	public var categorySlug: String?
	public var playAt: String?
	public var categoryName: String?
	public var weightAdd: String?
	public var followBak: String?
	public var view: String?
	public var weight: String?
	public var coinAdd: String?
	public var check: String?
	public var status: String?
	public var slug: String?
	public var nick: String?
	public var level: String?
	public var negativeView: String?
	public var grade: String?
	public var categoryId: String?
	public var appShufflingImage: String?
	public var intro: String?
	public var announcement: String?
	public var followAdd: String?
	public var avatar: String?
	public var uid: String?
	public var follow: String?
	public var playCount: String?
	public var firstPlayAt: String?
	public var lastEndAt: String?
	public var coin: String?
	public var createAt: String?
	public var thumb: String?
	public var videoQuality: String?


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
		title = json[kLinkObjectTitleKey].string
		defaultImage = json[kLinkObjectDefaultImageKey].string
		lockedView = json[kLinkObjectLockedViewKey].string
		recommendImage = json[kLinkObjectRecommendImageKey].string
		categorySlug = json[kLinkObjectCategorySlugKey].string
		playAt = json[kLinkObjectPlayAtKey].string
		categoryName = json[kLinkObjectCategoryNameKey].string
		weightAdd = json[kLinkObjectWeightAddKey].string
		followBak = json[kLinkObjectFollowBakKey].string
		view = json[kLinkObjectViewKey].string
		weight = json[kLinkObjectWeightKey].string
		coinAdd = json[kLinkObjectCoinAddKey].string
		check = json[kLinkObjectCheckKey].string
		status = json[kLinkObjectStatusKey].string
		slug = json[kLinkObjectSlugKey].string
		nick = json[kLinkObjectNickKey].string
		level = json[kLinkObjectLevelKey].string
		negativeView = json[kLinkObjectNegativeViewKey].string
		grade = json[kLinkObjectGradeKey].string
		categoryId = json[kLinkObjectCategoryIdKey].string
		appShufflingImage = json[kLinkObjectAppShufflingImageKey].string
		intro = json[kLinkObjectIntroKey].string
		announcement = json[kLinkObjectAnnouncementKey].string
		followAdd = json[kLinkObjectFollowAddKey].string
		avatar = json[kLinkObjectAvatarKey].string
		uid = json[kLinkObjectUidKey].string
		follow = json[kLinkObjectFollowKey].string
		playCount = json[kLinkObjectPlayCountKey].string
		firstPlayAt = json[kLinkObjectFirstPlayAtKey].string
		lastEndAt = json[kLinkObjectLastEndAtKey].string
		coin = json[kLinkObjectCoinKey].string
		createAt = json[kLinkObjectCreateAtKey].string
		thumb = json[kLinkObjectThumbKey].string
		videoQuality = json[kLinkObjectVideoQualityKey].string

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
		title <- map[kLinkObjectTitleKey]
		defaultImage <- map[kLinkObjectDefaultImageKey]
		lockedView <- map[kLinkObjectLockedViewKey]
		recommendImage <- map[kLinkObjectRecommendImageKey]
		categorySlug <- map[kLinkObjectCategorySlugKey]
		playAt <- map[kLinkObjectPlayAtKey]
		categoryName <- map[kLinkObjectCategoryNameKey]
		weightAdd <- map[kLinkObjectWeightAddKey]
		followBak <- map[kLinkObjectFollowBakKey]
		view <- map[kLinkObjectViewKey]
		weight <- map[kLinkObjectWeightKey]
		coinAdd <- map[kLinkObjectCoinAddKey]
		check <- map[kLinkObjectCheckKey]
		status <- map[kLinkObjectStatusKey]
		slug <- map[kLinkObjectSlugKey]
		nick <- map[kLinkObjectNickKey]
		level <- map[kLinkObjectLevelKey]
		negativeView <- map[kLinkObjectNegativeViewKey]
		grade <- map[kLinkObjectGradeKey]
		categoryId <- map[kLinkObjectCategoryIdKey]
		appShufflingImage <- map[kLinkObjectAppShufflingImageKey]
		intro <- map[kLinkObjectIntroKey]
		announcement <- map[kLinkObjectAnnouncementKey]
		followAdd <- map[kLinkObjectFollowAddKey]
		avatar <- map[kLinkObjectAvatarKey]
		uid <- map[kLinkObjectUidKey]
		follow <- map[kLinkObjectFollowKey]
		playCount <- map[kLinkObjectPlayCountKey]
		firstPlayAt <- map[kLinkObjectFirstPlayAtKey]
		lastEndAt <- map[kLinkObjectLastEndAtKey]
		coin <- map[kLinkObjectCoinKey]
		createAt <- map[kLinkObjectCreateAtKey]
		thumb <- map[kLinkObjectThumbKey]
		videoQuality <- map[kLinkObjectVideoQualityKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if title != nil {
			dictionary.updateValue(title!, forKey: kLinkObjectTitleKey)
		}
		if defaultImage != nil {
			dictionary.updateValue(defaultImage!, forKey: kLinkObjectDefaultImageKey)
		}
		if lockedView != nil {
			dictionary.updateValue(lockedView!, forKey: kLinkObjectLockedViewKey)
		}
		if recommendImage != nil {
			dictionary.updateValue(recommendImage!, forKey: kLinkObjectRecommendImageKey)
		}
		if categorySlug != nil {
			dictionary.updateValue(categorySlug!, forKey: kLinkObjectCategorySlugKey)
		}
		if playAt != nil {
			dictionary.updateValue(playAt!, forKey: kLinkObjectPlayAtKey)
		}
		if categoryName != nil {
			dictionary.updateValue(categoryName!, forKey: kLinkObjectCategoryNameKey)
		}
		if weightAdd != nil {
			dictionary.updateValue(weightAdd!, forKey: kLinkObjectWeightAddKey)
		}
		if followBak != nil {
			dictionary.updateValue(followBak!, forKey: kLinkObjectFollowBakKey)
		}
		if view != nil {
			dictionary.updateValue(view!, forKey: kLinkObjectViewKey)
		}
		if weight != nil {
			dictionary.updateValue(weight!, forKey: kLinkObjectWeightKey)
		}
		if coinAdd != nil {
			dictionary.updateValue(coinAdd!, forKey: kLinkObjectCoinAddKey)
		}
		if check != nil {
			dictionary.updateValue(check!, forKey: kLinkObjectCheckKey)
		}
		if status != nil {
			dictionary.updateValue(status!, forKey: kLinkObjectStatusKey)
		}
		if slug != nil {
			dictionary.updateValue(slug!, forKey: kLinkObjectSlugKey)
		}
		if nick != nil {
			dictionary.updateValue(nick!, forKey: kLinkObjectNickKey)
		}
		if level != nil {
			dictionary.updateValue(level!, forKey: kLinkObjectLevelKey)
		}
		if negativeView != nil {
			dictionary.updateValue(negativeView!, forKey: kLinkObjectNegativeViewKey)
		}
		if grade != nil {
			dictionary.updateValue(grade!, forKey: kLinkObjectGradeKey)
		}
		if categoryId != nil {
			dictionary.updateValue(categoryId!, forKey: kLinkObjectCategoryIdKey)
		}
		if appShufflingImage != nil {
			dictionary.updateValue(appShufflingImage!, forKey: kLinkObjectAppShufflingImageKey)
		}
		if intro != nil {
			dictionary.updateValue(intro!, forKey: kLinkObjectIntroKey)
		}
		if announcement != nil {
			dictionary.updateValue(announcement!, forKey: kLinkObjectAnnouncementKey)
		}
		if followAdd != nil {
			dictionary.updateValue(followAdd!, forKey: kLinkObjectFollowAddKey)
		}
		if avatar != nil {
			dictionary.updateValue(avatar!, forKey: kLinkObjectAvatarKey)
		}
		if uid != nil {
			dictionary.updateValue(uid!, forKey: kLinkObjectUidKey)
		}
		if follow != nil {
			dictionary.updateValue(follow!, forKey: kLinkObjectFollowKey)
		}
		if playCount != nil {
			dictionary.updateValue(playCount!, forKey: kLinkObjectPlayCountKey)
		}
		if firstPlayAt != nil {
			dictionary.updateValue(firstPlayAt!, forKey: kLinkObjectFirstPlayAtKey)
		}
		if lastEndAt != nil {
			dictionary.updateValue(lastEndAt!, forKey: kLinkObjectLastEndAtKey)
		}
		if coin != nil {
			dictionary.updateValue(coin!, forKey: kLinkObjectCoinKey)
		}
		if createAt != nil {
			dictionary.updateValue(createAt!, forKey: kLinkObjectCreateAtKey)
		}
		if thumb != nil {
			dictionary.updateValue(thumb!, forKey: kLinkObjectThumbKey)
		}
		if videoQuality != nil {
			dictionary.updateValue(videoQuality!, forKey: kLinkObjectVideoQualityKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.title = aDecoder.decodeObjectForKey(kLinkObjectTitleKey) as? String
		self.defaultImage = aDecoder.decodeObjectForKey(kLinkObjectDefaultImageKey) as? String
		self.lockedView = aDecoder.decodeObjectForKey(kLinkObjectLockedViewKey) as? String
		self.recommendImage = aDecoder.decodeObjectForKey(kLinkObjectRecommendImageKey) as? String
		self.categorySlug = aDecoder.decodeObjectForKey(kLinkObjectCategorySlugKey) as? String
		self.playAt = aDecoder.decodeObjectForKey(kLinkObjectPlayAtKey) as? String
		self.categoryName = aDecoder.decodeObjectForKey(kLinkObjectCategoryNameKey) as? String
		self.weightAdd = aDecoder.decodeObjectForKey(kLinkObjectWeightAddKey) as? String
		self.followBak = aDecoder.decodeObjectForKey(kLinkObjectFollowBakKey) as? String
		self.view = aDecoder.decodeObjectForKey(kLinkObjectViewKey) as? String
		self.weight = aDecoder.decodeObjectForKey(kLinkObjectWeightKey) as? String
		self.coinAdd = aDecoder.decodeObjectForKey(kLinkObjectCoinAddKey) as? String
		self.check = aDecoder.decodeObjectForKey(kLinkObjectCheckKey) as? String
		self.status = aDecoder.decodeObjectForKey(kLinkObjectStatusKey) as? String
		self.slug = aDecoder.decodeObjectForKey(kLinkObjectSlugKey) as? String
		self.nick = aDecoder.decodeObjectForKey(kLinkObjectNickKey) as? String
		self.level = aDecoder.decodeObjectForKey(kLinkObjectLevelKey) as? String
		self.negativeView = aDecoder.decodeObjectForKey(kLinkObjectNegativeViewKey) as? String
		self.grade = aDecoder.decodeObjectForKey(kLinkObjectGradeKey) as? String
		self.categoryId = aDecoder.decodeObjectForKey(kLinkObjectCategoryIdKey) as? String
		self.appShufflingImage = aDecoder.decodeObjectForKey(kLinkObjectAppShufflingImageKey) as? String
		self.intro = aDecoder.decodeObjectForKey(kLinkObjectIntroKey) as? String
		self.announcement = aDecoder.decodeObjectForKey(kLinkObjectAnnouncementKey) as? String
		self.followAdd = aDecoder.decodeObjectForKey(kLinkObjectFollowAddKey) as? String
		self.avatar = aDecoder.decodeObjectForKey(kLinkObjectAvatarKey) as? String
		self.uid = aDecoder.decodeObjectForKey(kLinkObjectUidKey) as? String
		self.follow = aDecoder.decodeObjectForKey(kLinkObjectFollowKey) as? String
		self.playCount = aDecoder.decodeObjectForKey(kLinkObjectPlayCountKey) as? String
		self.firstPlayAt = aDecoder.decodeObjectForKey(kLinkObjectFirstPlayAtKey) as? String
		self.lastEndAt = aDecoder.decodeObjectForKey(kLinkObjectLastEndAtKey) as? String
		self.coin = aDecoder.decodeObjectForKey(kLinkObjectCoinKey) as? String
		self.createAt = aDecoder.decodeObjectForKey(kLinkObjectCreateAtKey) as? String
		self.thumb = aDecoder.decodeObjectForKey(kLinkObjectThumbKey) as? String
		self.videoQuality = aDecoder.decodeObjectForKey(kLinkObjectVideoQualityKey) as? String

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(title, forKey: kLinkObjectTitleKey)
		aCoder.encodeObject(defaultImage, forKey: kLinkObjectDefaultImageKey)
		aCoder.encodeObject(lockedView, forKey: kLinkObjectLockedViewKey)
		aCoder.encodeObject(recommendImage, forKey: kLinkObjectRecommendImageKey)
		aCoder.encodeObject(categorySlug, forKey: kLinkObjectCategorySlugKey)
		aCoder.encodeObject(playAt, forKey: kLinkObjectPlayAtKey)
		aCoder.encodeObject(categoryName, forKey: kLinkObjectCategoryNameKey)
		aCoder.encodeObject(weightAdd, forKey: kLinkObjectWeightAddKey)
		aCoder.encodeObject(followBak, forKey: kLinkObjectFollowBakKey)
		aCoder.encodeObject(view, forKey: kLinkObjectViewKey)
		aCoder.encodeObject(weight, forKey: kLinkObjectWeightKey)
		aCoder.encodeObject(coinAdd, forKey: kLinkObjectCoinAddKey)
		aCoder.encodeObject(check, forKey: kLinkObjectCheckKey)
		aCoder.encodeObject(status, forKey: kLinkObjectStatusKey)
		aCoder.encodeObject(slug, forKey: kLinkObjectSlugKey)
		aCoder.encodeObject(nick, forKey: kLinkObjectNickKey)
		aCoder.encodeObject(level, forKey: kLinkObjectLevelKey)
		aCoder.encodeObject(negativeView, forKey: kLinkObjectNegativeViewKey)
		aCoder.encodeObject(grade, forKey: kLinkObjectGradeKey)
		aCoder.encodeObject(categoryId, forKey: kLinkObjectCategoryIdKey)
		aCoder.encodeObject(appShufflingImage, forKey: kLinkObjectAppShufflingImageKey)
		aCoder.encodeObject(intro, forKey: kLinkObjectIntroKey)
		aCoder.encodeObject(announcement, forKey: kLinkObjectAnnouncementKey)
		aCoder.encodeObject(followAdd, forKey: kLinkObjectFollowAddKey)
		aCoder.encodeObject(avatar, forKey: kLinkObjectAvatarKey)
		aCoder.encodeObject(uid, forKey: kLinkObjectUidKey)
		aCoder.encodeObject(follow, forKey: kLinkObjectFollowKey)
		aCoder.encodeObject(playCount, forKey: kLinkObjectPlayCountKey)
		aCoder.encodeObject(firstPlayAt, forKey: kLinkObjectFirstPlayAtKey)
		aCoder.encodeObject(lastEndAt, forKey: kLinkObjectLastEndAtKey)
		aCoder.encodeObject(coin, forKey: kLinkObjectCoinKey)
		aCoder.encodeObject(createAt, forKey: kLinkObjectCreateAtKey)
		aCoder.encodeObject(thumb, forKey: kLinkObjectThumbKey)
		aCoder.encodeObject(videoQuality, forKey: kLinkObjectVideoQualityKey)

    }

}
