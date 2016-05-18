//
//  DPlayerMediaControl.swift
//  DPlayer
//
//  Created by LiChendi on 16/4/6.
//  Copyright © 2016年 LiChendi. All rights reserved.
//

import UIKit

class DPlayerMediaControl: UIControl {

    weak var delegatePlayer:IJKMediaPlayback?

    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var mediaControlPanel: UIView!
    @IBOutlet weak var mediaProgressSlider: UISlider!
    private var isMediaSliderBeingDragged = false
    private var timer:NSTimer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        self.refreshMediaControl()
    }
    
    func showNoFade() {
        self.mediaControlPanel.hidden = false
//        self.mediaControlPanel.hidden = false
//        self.refreshMediaControl()
        
    }
    
    func showAndFade() {
//        self.showNoFade()
//        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector(hide()), userInfo: nil, repeats: false)
//        self.performSelector(Selector(hide()), withObject: nil, afterDelay: 5)
    }
    
    func hide() {
        self.mediaControlPanel.hidden = true
    
        self.refreshMediaControl()
//        self.mediaControlPanel.hidden = true
//        self.cancelDelayedHide();
    }
    
    func beginDragMediaSlider() {
        isMediaSliderBeingDragged = true
    }
    
    func endDragMediaSlider() {
        isMediaSliderBeingDragged = false
    }
    
    func continueDragMediaSlider() {
//        self.refreshMediaControl()
    }
    
    func cancelDelayedHide() {
//        NSObject.cancelPreviousPerformRequestsWithTarget(self, selector: Selector(hide()), object: nil)
//        NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: "onFlip", userInfo: nil, repeats: false)
        
    }
    
    func refreshMediaControl() {
        
        guard let delegateplayer = self.delegatePlayer else { return }
        let duration = Int(delegateplayer.duration + 0.5)
        if duration > 0 {
            self.mediaProgressSlider.maximumValue = Float(duration)
            print(1111111)
            // TODO: LABEL 文字
//            self.
        } else {
            self.mediaProgressSlider.maximumValue = 1.0
        }
        
        var postion:NSTimeInterval = 0.0;
        if self.isMediaSliderBeingDragged {
            postion = Double(self.mediaProgressSlider.value)
        }else {
            postion = delegateplayer.currentPlaybackTime
        }
        
        let intPosition = Int(postion + 0.5)
        if duration > 0 {
            self.mediaProgressSlider.value = Float(postion)
        }else {
            self.mediaProgressSlider.value = 0.0
        }
        print("time  time  time  \(intPosition)")
        

        
        let isPlaying = delegateplayer.isPlaying()
        print(isPlaying)
//        playButton.hidden = isPlaying
        pauseButton.hidden = !isPlaying
        
        print("0.0")
        if !self.mediaControlPanel.hidden {
            print("1.1")
            
        }

    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
