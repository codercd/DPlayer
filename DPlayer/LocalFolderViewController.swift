//
//  LocalFloderViewController.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/6.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class LocalFolderViewController: UITableViewController {
    let path: NSString
    var subFolders = Array<String>()
    var files = Array<String>()
 
    init(path: String) {
        self.path = path
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView .registerClass(UITableViewCell.self, forCellReuseIdentifier: "LocalFloderViewController")
        
        guard let fileArray = try? NSFileManager.defaultManager().contentsOfDirectoryAtPath(path as String) else {
            subFolders = Array<String>()
            files = Array<String>()
            return
        }
        
        var isDirectory = ObjCBool(true)
        for fileName in fileArray {
            if fileName.hasPrefix(".") {
                continue
            }
            let fullFileName = path.stringByAppendingPathComponent(fileName)
            NSFileManager.defaultManager().fileExistsAtPath(fullFileName, isDirectory: &isDirectory)
            if (isDirectory) {
                subFolders.append(fileName)
            } else {
                files.append(fileName)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return subFolders.count
        case 1:
            return files.count
        default:
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LocalFloderViewController", forIndexPath: indexPath)
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = subFolders[indexPath.row]
        case 1:
            cell.textLabel?.text = files[indexPath.row]
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            let folderPath = path.stringByAppendingPathComponent(subFolders[indexPath.row])
            let localFolderViewController = LocalFolderViewController(path:folderPath)
            self.navigationController?.pushViewController(localFolderViewController, animated: true)
//            self .presentViewController(localFolderViewController, animated: true, completion: nil)
        case 1:
            let filePath = path.stringByAppendingPathComponent(files[indexPath.row])
            let moviePlayerController = DPlayerMoviePlayerViewController(url: NSURL(fileURLWithPath: filePath))
//            self.navigationController?.pushViewController(playerCon, animated: true)
            self.presentViewController(moviePlayerController, animated: true, completion: nil)
        default:
            return
        }
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
