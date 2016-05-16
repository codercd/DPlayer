//
//  AlbumViewController.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/6.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit
import Photos
class AlbumViewController: UITableViewController,PHPhotoLibraryChangeObserver {

    var  sectionFetchResults = Array<PHFetchResult>()
    var  sectionLocalizedTitles = Array<AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let allPhotosOptions = PHFetchOptions()
        
        allPhotosOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        let allPhotos = PHAsset.fetchAssetsWithOptions(allPhotosOptions)
        
        let smartAlbums = PHAsset.fetchAssetsWithOptions(allPhotosOptions)
        
        let topLevelUserCollections = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .AlbumRegular, options: nil)
        
        sectionFetchResults = [allPhotos,smartAlbums,topLevelUserCollections]
        sectionLocalizedTitles = ["",NSLocalizedString("Smart Albums", comment: ""),NSLocalizedString("Albums", comment: "")]
        
        PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)
        self.tableView.reloadData()

//         self.clearsSelectionOnViewWillAppear = false

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
        return self.sectionFetchResults.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var numberOfRows = 0;
        
        if (section == 0) {
            // The "All Photos" section only ever has a single row.
            numberOfRows = 1;
        } else {
            let fetchResult = self.sectionFetchResults[section];
            numberOfRows = fetchResult.count;
        }
        
        return numberOfRows
    }

    
    func photoLibraryDidChange(changeInstance: PHChange) {

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
//        let fetchResult = sectionFetchResults[indexPath.row]

        // Configure the cell...
        cell.textLabel?.text = String(indexPath.row)
        
        
        if (indexPath.section == 0) {
//            cell = [tableView dequeueReusableCellWithIdentifier:AllPhotosReuseIdentifier forIndexPath:indexPath];
            cell.textLabel?.text = NSLocalizedString("All Photos", comment: "")
        } else {
            let fetchResult:PHFetchResult = self.sectionFetchResults[indexPath.section] //as! PHFetchResult
            let collection = fetchResult[indexPath.row];
//            cell = [tableView dequeueReusableCellWithIdentifier:CollectionCellReuseIdentifier forIndexPath:indexPath];
            cell.textLabel?.text = collection.localizedTitle;
        }

        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let fetchResult = self.sectionFetchResults[indexPath.section];
//        if ([segue.identifier isEqualToString:AllPhotosSegue]) {
//            assetGridViewController.assetsFetchResults = fetchResult;
//        } else if ([segue.identifier isEqualToString:CollectionSegue]) {
            // Get the PHAssetCollection for the selected row.
        let collection:PHCollection = fetchResult[indexPath.row] as! PHCollection;
//            if (![collection isKindOfClass:[PHAssetCollection class]]) {
//                return;
//            }
        let assetCollection = collection as! PHAssetCollection
        let assetsFetchResult = PHAsset.fetchAssetsInAssetCollection(assetCollection, options: nil)
            // Configure the AAPLAssetGridViewController with the asset collection.
//            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
//            PHFetchResult *assetsFetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
//       
        let noname = NoNameViewController()
        noname.assetsFetchResults = assetsFetchResult;
        noname.assetCollection = assetCollection;
//        noname.title = assetsFetchResult[indexPath.row] as! String
        self.navigationController?.pushViewController(noname, animated: true)
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
