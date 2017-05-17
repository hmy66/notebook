//
//  EraserBrush.swift
//  notebook
//
//  Created by Apple on 2017/5/17.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class EraserBrush: PencilBrush {

    override func drawInContext(context: CGContext) {
        context.clear(CGRect(origin: CGPoint(x: min(beginPoint.x, endPoint.x), y: min(beginPoint.y, endPoint.y)),size: CGSize(width: abs(endPoint.x - beginPoint.x), height: abs(endPoint.y - beginPoint.y))))
    }
}
