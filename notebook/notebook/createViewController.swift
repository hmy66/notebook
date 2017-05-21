//
//  createViewController.swift
//  notebook
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class createViewController: UIViewController {

    //var toolbarEditingItems: [UIBarButtonItem]?
    //var currentSettingsView: UIView?
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var DrawingBoard: board!
    var brushes = [PencilBrush(),EraserBrush()]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DrawingBoard.brush=brushes[1]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark:segmentConrol Action
    /*@IBAction func indexChanged(_ sender: AnyObject) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:print("1")
        case 1:print("2")
        case 2:print("3")
        case 3:self.DrawingBoard.brush=brushes[0]
        case 4:print("5")
        default: break
        }
    }*/
    /*func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:AnyObject){
                if (error as NSError?) != nil {
                   UIAlertView(title: "错误", message:"保存失败", delegate: nil, cancelButtonTitle: "确定").show()
                }
                else{
     
        }
    }*/
    
    /*func saveToAlbum() {
    UIImageWriteToSavedPhotosAlbum(self.DrawingBoard.takeImage(), self, Selector(("image:didFinishSavingWithError:contextInfo:")), nil)
    }*/
    
    //Mark:segment solutions 
    @IBAction func switchBrush(_ sender:UISegmentedControl) {
        assert(sender.tag < self.brushes.count, "!!!")
        switch segmentedControl.selectedSegmentIndex{
        case 0:dismiss(animated: true, completion: nil)
        case 1:break
        case 2:break
           // let textField=UITextField(CGRect(origin: CGPoint(x:10,y:10), size: CGSize(width: 100, height: 100)))
            //self.view.addSubview(UITextView)
        case 3:self.DrawingBoard.brush=self.brushes[0]
        case 4:self.DrawingBoard.brush=self.brushes[1]
        case 5:
            let tmpImage=self.DrawingBoard.takeImage()
            notes.append(tmpImage)
            let Date=NSDateComponents()
            dic[tmpImage]=Date
            UIAlertView(title:nil, message: "保存成功！", delegate: nil, cancelButtonTitle: "确定").show()
        default:break
        }

    }
}
