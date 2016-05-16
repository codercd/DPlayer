//
//  LocalViewController.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/6.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class LocalViewController: UITableViewController {

    var menuArray = Array<String>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let menuPlistPath =  NSBundle.mainBundle().pathForResource("Menu", ofType: "plist")
        menuArray = NSDictionary(contentsOfFile: menuPlistPath!)! ["本地"] as! Array<String>
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "LocalViewCell")
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
        return menuArray.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LocalViewCell", forIndexPath: indexPath)
        let string = menuArray[indexPath.row]
//        cell.backgroundColor = UIColor.redColor()
        cell.textLabel?.text = string

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let homePath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
            let localFolderViewcontroller = LocalFolderViewController(path: homePath)
            self.navigationController?.pushViewController(localFolderViewcontroller, animated: true)
        case 1:
            let albumViewController = AlbumViewController()
            self.navigationController?.pushViewController(albumViewController, animated: true)
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
