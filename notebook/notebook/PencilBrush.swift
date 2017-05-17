//
//  PencilBrush.swift
//  notebook
//
//  Created by Apple on 2017/5/17.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class PencilBrush: BaseBrush {
    
    override func drawInContext(context: CGContext) {
        if let lastPoint = self.lastPoint {
            context.move(to: lastPoint)
            context.addLine(to:endPoint)
        } else {
            context.move(to: beginPoint)
            context.addLine(to: endPoint)
        }
    }
    
    override func supportedContinuousDrawing() -> Bool {
        return true
    }

}
