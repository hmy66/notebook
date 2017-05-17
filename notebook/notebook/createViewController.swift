//
//  createViewController.swift
//  notebook
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class createViewController: UIViewController {

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
    //Mark:pencil好像关联在返回上
    @IBAction func switchBrush(_ sender:UISegmentedControl) {
        assert(sender.tag < self.brushes.count, "!!!")
        
        self.DrawingBoard.brush = self.brushes[sender.selectedSegmentIndex-3]

    }
}
