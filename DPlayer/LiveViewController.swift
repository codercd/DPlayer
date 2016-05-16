//
//  LiveViewController.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/19.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    @IBOutlet weak var recommendView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.recommendView.contentSize = CGSize(width: self.view.bounds.size.width * 3, height: 0)
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width:  self.view.bounds.size.width, height: 200))
        self.view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width * 3, height: 0)
        scrollView.backgroundColor = UIColor.lightGrayColor()
        
        let colors = [UIColor.redColor(),UIColor.orangeColor(),UIColor.blueColor()]
        for i in 0...2 {
            let view0 = UIView(frame: CGRect(x: CGFloat(i) * self.view.bounds.size.width, y: 0, width: self.view.bounds.size.width, height: 200))
            view0.backgroundColor = colors[i]
            scrollView.addSubview(view0)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
