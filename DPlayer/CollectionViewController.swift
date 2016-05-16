//
//  CollectionViewController.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/19.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
//    var list:Array<AnyObject> = []
    
//    var homepageModel = BaseClass(json: nil)
    var homepageModel = HomepageModel()

    
    private let CarouselViewCellIdentifier = "CarouselViewCell"
    private let ClassificationCellIdentifier = "ClassificationCell"
    private let LiveDetailCellIdentifier = "LiveDetailCell"
//    private let CollectionHeaderViewIndentifer = "CollectionHeaderView"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.lightGrayColor()
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView?.registerNib(UINib(nibName: "CarouselViewCell" ,bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: CarouselViewCellIdentifier)
        self.collectionView?.registerNib(UINib(nibName: "ClassificationCell" ,bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: ClassificationCellIdentifier)
        self.collectionView?.registerNib(UINib(nibName: "LiveDetailCell" ,bundle: NSBundle.mainBundle()), forCellWithReuseIdentifier: LiveDetailCellIdentifier)
        self.collectionView?.registerNib(UINib(nibName: "CollectionHeaderView" ,bundle: NSBundle.mainBundle()), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        

        NetworkManager().getHomepageJson { (model) in
            self.homepageModel = model
            self.collectionView?.reloadData()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.homepageModel.lists.count
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            let dictionary = self.homepageModel.mapTable[section]
            let slug = dictionary["slug"].description

            for item  in self.homepageModel.lists {
                if item.0 == slug {
                    return (item.1.homepageItem?.count)!
                }
            }
            return 0
        }
    }

    //cell
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CarouselViewCellIdentifier, forIndexPath: indexPath)
            
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ClassificationCellIdentifier, forIndexPath: indexPath)
            return cell
        default:
            let cell:LiveDetailCell = collectionView.dequeueReusableCellWithReuseIdentifier(LiveDetailCellIdentifier, forIndexPath: indexPath) as! LiveDetailCell
            
            let category = self.homepageModel.homepageCategoryForSection(indexPath.section)
            let homepageItem = category!.homepageItem![indexPath.row]
            
            guard let imageURLStr = homepageItem.linkObject?.thumb else { return cell }
            let imageURL = NSURL(string: imageURLStr)!
            cell.iconView.kf_setImageWithURL(imageURL)
            
//            cell.iconView.image = UIImage(
//            cell.iconView.backgroundColor = UIColor.greenColor()
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSizeMake(self.collectionView!.bounds.size.width, 200)
        case 1:
             return CGSizeMake(self.collectionView!.bounds.size.width, 80)
        default:
            return CGSizeMake((self.collectionView!.bounds.size.width - 24) / 2, (self.collectionView!.bounds.size.width - 24) / 2 / 16 * 9)
        }
    
    }
    
    // Section边距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 8, bottom: 10, right: 8)
        }
    }
    
    // Cell边距
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 8
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        return 8
    }

    // header size
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSizeZero
        case 1:
            return CGSizeZero
        default:
            return CGSize(width: 200, height: 50)
        }
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let header:CollectionHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as! CollectionHeaderView
        header.backgroundColor = UIColor.whiteColor()
        let dictionary = self.homepageModel.mapTable[indexPath.section]
        let slug = dictionary["name"].description
        header.titileLabel.text = slug
       
        return header
    }
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let category = self.homepageModel.homepageCategoryForSection(indexPath.section)
        let homepageItem = category!.homepageItem![indexPath.row]
        guard let roomID = homepageItem.linkObject?.uid else {return}
        print("roomID\(roomID)")
        NetworkManager().getHomeInfo(roomID) { (roomModel) in
//            print(roomModel.live?.ws?.flv?.liveList)
            guard let liveURL = roomModel.live?.ws?.flv?.liveURL else { return}
            
            let playViewController = DPlayerMoviePlayerViewController(url: NSURL(string: liveURL)!)
            print(liveURL)
            self.presentViewController(playViewController, animated: true, completion: nil)
            
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
