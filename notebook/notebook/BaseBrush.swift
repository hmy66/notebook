//
//  BaseBrush.swift
//  notebook
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import CoreGraphics
import UIKit

protocol PaintBrush {
    func supportedContinuousDrawing() -> Bool;
    func drawInContext(context: CGContext)
}

class BaseBrush: NSObject,PaintBrush {
    var beginPoint: CGPoint!
    var endPoint: CGPoint!
    var lastPoint: CGPoint?
    
    var strokeWidth: CGFloat!
    //表示是否是连续不断的绘图
    func supportedContinuousDrawing() -> Bool {
        return false
    }
    
    //Context的绘图方法，子类必须实现具体的绘图
    func drawInContext(context: CGContext) {
        assert(false, "must implements in subclass.")
    }
    
    /*func place()->UITextField{
        let textfield=UITextField(frame: CGRect(x:beginPoint.x, y:beginPoint.y, width: 100, height: 100))
        return textfield
    }*/

    
}
