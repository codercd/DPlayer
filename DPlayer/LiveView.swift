//
//  LiveView.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/19.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class LiveView: UIView {
    let remendedView = UIScrollView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews() {
        self.addSubview(remendedView)
        remendedView.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(64)
            make.left.right.equalTo(self)
            make.height.equalTo(200)
        }
        remendedView.contentSize = CGSize(width: self.bounds.size.width * 3, height: 0)
//        remendedView.backgroundColor = UIColor.orangeColor()

    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
