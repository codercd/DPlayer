//
//  NoNameViewController.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/12.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit
import Photos

class NoNameViewController: UITableViewController,PHPhotoLibraryChangeObserver {
    var assetsFetchResults = PHFetchResult()
    var assetCollection = PHAssetCollection()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")

        PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    deinit {
        PHPhotoLibrary.sharedPhotoLibrary().unregisterChangeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.assetsFetchResults.count
    }
    
    func photoLibraryDidChange(changeInstance: PHChange) {
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        let asset:PHAsset = self.assetsFetchResults[indexPath.row] as! PHAsset
        
        print(asset.localIdentifier)
        cell.textLabel?.text = asset.localIdentifier
        
//        if (asset.mediaSubtypes & PHAssetMediaSubtype.PhotoLive) {
//            // Add Badge Image to the cell to denote that the asset is a Live Photo.
//            UIImage *badge = [PHLivePhotoView livePhotoBadgeImageWithOptions:PHLivePhotoBadgeOptionsOverContent];
//            cell.livePhotoBadgeImage = badge;
//        }
//        
//        // Request an image for the asset from the PHCachingImageManager.
//        [self.imageManager requestImageForAsset:asset
//            targetSize:AssetGridThumbnailSize
//            contentMode:PHImageContentModeAspectFill
//            options:nil
//            resultHandler:^(UIImage *result, NSDictionary *info) {
//            // Set the cell's thumbnail image if it's still showing the same asset.
//            if ([cell.representedAssetIdentifier isEqualToString:asset.localIdentifier]) {
//            cell.thumbnailImage = result;
//            }
//            }];
        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
