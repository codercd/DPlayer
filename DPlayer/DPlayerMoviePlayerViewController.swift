//
//  DPlayerMovieViewController.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/6.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit
import SnapKit
import IJKMediaFramework
//import RxSwift

class DPlayerMoviePlayerViewController: UIViewController {
    var url = NSURL()
    var player:IJKMediaPlayback
    var isPlaying = false
    
//    let mediaControl = DPlayerMediaControl()
    @IBOutlet var mediaControl: DPlayerMediaControl!
    
    init(url:NSURL) {
        self.url = url
        let options:IJKFFOptions = IJKFFOptions.optionsByDefault()
        self.player = IJKFFMoviePlayerController(contentURL: self.url, withOptions: options)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        IJKFFMoviePlayerController.setLogReport(false)
        IJKFFMoviePlayerController.checkIfFFmpegVersionMatch(true)

        self.player.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.player.view.frame = self.view.bounds;
        self.player.scalingMode = IJKMPMovieScalingMode.AspectFit
        self.player.shouldAutoplay = true

        self.view.autoresizesSubviews = true
        self.view.addSubview(self.player.view)
        
        self.view.addSubview(self.mediaControl)
        self.mediaControl.snp_makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self.view)
        }
        self.mediaControl.delegatePlayer = self.player;
        self.player.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -IBAction
    
    @IBAction func onClickMediaControl(sender: AnyObject) {
        print("onClickMediaControl")
        self.mediaControl.showNoFade()
    }

    @IBAction func onClickMediaControlPanel(sender: AnyObject) {
        print("onClickMediaControlPanel")
        self.mediaControl.hide()
    }
    
    @IBAction func onClickPause(sender: AnyObject) {
        self.isPlaying = self.player.isPlaying()
        if self.isPlaying {
            self.player.pause()
            self.isPlaying = false
            self.mediaControl.pauseButton.setTitle("播放", forState: .Normal)
        }else {
            self.player.play()
            self.isPlaying = true
            self.mediaControl.pauseButton.setTitle("暂停", forState: .Normal)
        }
    }

    @IBAction func onClickBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didSliderTouchDown(sender: AnyObject) {
        self.mediaControl.beginDragMediaSlider()
    }
    
    @IBAction func didSliderTouchCancel(sender: AnyObject) {
        self.mediaControl.endDragMediaSlider()
    }
    
    @IBAction func didSliderTouchOutside(sender: AnyObject) {
        self.mediaControl.endDragMediaSlider()
    }
    
    @IBAction func didSliderTouchInside(sender: AnyObject) {
        self.player.currentPlaybackTime = Double(self.mediaControl.mediaProgressSlider.value)
        self.mediaControl.endDragMediaSlider()
    }
    
    @IBAction func didSliderValueChanged(sender: AnyObject) {
        self.mediaControl.continueDragMediaSlider()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.player.prepareToPlay()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.player.shutdown()
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
