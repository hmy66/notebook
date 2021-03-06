//
//  board.swift
//  notebook
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//
//draw paintings
import UIKit
enum DrawingState{
    case Began,Moved,Ended
}

class board: UIImageView{
    private var drawingState:DrawingState!
    var brush:BaseBrush?
    private var realImage:UIImage?
    //Mark:init
    //var textPoint:CGPoint=CGPoint(x: 0, y: 0)
    var strokeWidth: CGFloat
    var strokeColor: UIColor
    //let textlabel=UILabel(frame: CGRect(x: 100, y: 20, width: 100, height: 100))
    
    override init(image:UIImage!) {
        //self.backgroundColor=UIColor.white
        self.strokeColor = UIColor.black
        self.strokeWidth = 1
        super.init(image:image)
        print("in init")
        self.backgroundColor=UIColor.white
        //self.textlabel.text="today is here"
        //self.textlabel.backgroundColor=UIColor.blue
        //self.addSubview(textlabel)
    }
    
    required init?(coder : NSCoder) {
        //self.backgroundColor=UIColor.white
        self.strokeColor = UIColor.black
        self.strokeWidth = 1
        super.init(coder:coder)
        self.backgroundColor=UIColor.white
    }
    
    //Mark:touches method
     override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)  {
        if let brush = self.brush {
            brush.lastPoint = nil
            
            let touch = ((touches as NSSet).anyObject() as AnyObject)
            brush.beginPoint=touch.location(in:self)
            //textPoint=touch.location(in:self)
            brush.endPoint = brush.beginPoint
            
            self.drawingState = .Began
            self.drawingImage()
        }
    }
    
   override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let brush = self.brush {
            let touch = ((touches as NSSet).anyObject() as AnyObject)
            brush.endPoint = touch.location(in:self)
            self.drawingState = .Moved
            self.drawingImage()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let brush = self.brush {
            brush.endPoint = nil
        }
    }
    
   override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let brush = self.brush {
        let touch = ((touches as NSSet).anyObject() as AnyObject)
        brush.endPoint = touch.location(in:self)
        self.drawingState = .Ended
        self.drawingImage()
        }
    }
    //Mark:获取当前board上的图片
    func takeImage() -> UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        
        //self.backgroundColor?.setFill()
        //UIRectFill(self.bounds)
        
        self.image?.draw(in: self.bounds)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    /*func drawText(text:String)
    {
        //print(textPoint.x)
        //let font=UIFont.boldSystemFont(ofSize: 12)
        //text.draw(at: textPoint, withAttributes: [NSFontAttributeName:font,NSForegroundColorAttributeName:UIColor.black.cgColor] )
        let textlabel=UILabel(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        textlabel.text=text
        self.addSubview(textlabel)
    }*/
    
    // MARK:drawing
    func drawingImage() {
        if let brush = self.brush {
            
            //开启一个新的ImageContext，为保存每次的绘图状态作准备。
            UIGraphicsBeginImageContext(self.bounds.size)
            
            //初始化context，进行基本设置（画笔宽度、画笔颜色、画笔的圆润度等）。
            let context = UIGraphicsGetCurrentContext()
            
            UIColor.clear.setFill()
            UIRectFill(self.bounds)
            
            context!.setLineCap(CGLineCap.round)
            context!.setLineWidth(self.strokeWidth)
            context!.setStrokeColor(
                self.strokeColor.cgColor)
            
            //把之前保存的图片绘制进context中。
            if let realImage = self.realImage {
                realImage.draw(in: self.bounds)
            }
            
            //设置brush的基本属性，以便子类更方便的绘图；调用具体的绘图方法，并最终添加到context中。
            brush.strokeWidth = self.strokeWidth
            brush.drawInContext(context: context!);
            context!.strokePath()
            
            //从当前的context中，得到Image，如果是ended状态或者需要支持连续不断的绘图，则将Image保存到realImage中。
            let previewImage = UIGraphicsGetImageFromCurrentImageContext()
            if self.drawingState == .Ended || brush.supportedContinuousDrawing() {
                self.realImage = previewImage
            }
            
            UIGraphicsEndImageContext()
            
            //实时显示当前的绘制状态，并记录绘制的最后一个点。
            self.image = previewImage;
            
            brush.lastPoint = brush.endPoint
        }
    }
    
}
