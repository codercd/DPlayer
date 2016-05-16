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
        
//        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: (test), userInfo: nil, repeats: true)
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #, userInfo: <#T##AnyObject?#>, repeats: <#T##Bool#>)
        let currentQueue = dispatch_queue_create("com.gcd.timeout", nil)
        let timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, currentQueue)
        dispatch_source_set_timer(timer!, dispatch_walltime(nil, 0), 1*NSEC_PER_SEC, 0)
        dispatch_source_set_event_handler(timer!, { () -> Void in
//            if (timeOut <= 0) {
//                dispatch_source_cancel(self.timer!)
//                self.content = "未开启"
//                self.status = false
//                dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                    //暂停播放器
//                    AudioPlayerViewController.pausePlayer()
//                })
//            } else {
//                var minutes = timeOut / 60
//                var seconds = timeOut % 60
//                self.content = "\(minutes)分\(seconds)秒后, 将暂停播放广播"
//                --timeOut
//            }
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                //每秒发送一次通知, 用于更新要显示的倒计时时间(在制定控制器监听该通知)
//                NSNotificationCenter.defaultCenter().postNotificationName("startTimeOut", object: nil, userInfo: nil)
//            })
            print("1111")
        })
        
    }
    
    func showNoFade() {
        self.mediaControlPanel.hidden = false
//        self.mediaControlPanel.hidden = false
//        self.refreshMediaControl()
        
    }
    
    func test()  {
        print("1gsdfbvdsfb")
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
        print(intPosition)
        

        
        let isPlaying = delegateplayer.isPlaying()
        print(isPlaying)
//        playButton.hidden = isPlaying
        pauseButton.hidden = !isPlaying
        
        print("0.0")
        if !self.mediaControlPanel.hidden {
            print("1.1")
//            timer = NSTimer.scheduledTimerWithTimeInterval(0,5, invocation: <#T##NSInvocation#>, repeats: <#T##Bool#>)
//            timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector(refreshMediaControl()), userInfo: nil, repeats: false);
//            self.performSelector(Selector(refreshMediaControl()), withObject: nil, afterDelay: 0.5)
//            self.performSelector(Selector(refreshMediaControl()), withObject: nil, afterDelay: 0.5)
//            NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector(refreshMediaControl()), userInfo: nil, repeats: false)
            
        }

    }
    
    
    
    typealias Task = (cancel : Bool) -> Void
    
    func delay(time:NSTimeInterval, task:()->()) ->  Task? {
        
        func dispatch_later(block:()->()) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(time * Double(NSEC_PER_SEC))),
                dispatch_get_main_queue(),
                block)
        }
        
        var closure: dispatch_block_t? = task
        var result: Task?
        
        let delayedClosure: Task = {
            cancel in
            if let internalClosure = closure {
                if (cancel == false) {
                    dispatch_async(dispatch_get_main_queue(), internalClosure);
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(cancel: false)
            }
        }
        
        return result;
    }
    
    func cancel(task:Task?) {
        task?(cancel: true)
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
