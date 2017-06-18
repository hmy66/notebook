//
//  createViewController.swift
//  notebook
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class createViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //var toolbarEditingItems: [UIBarButtonItem]?
    //var currentSettingsView: UIView?
    
    //@IBOutlet weak var toolbar: UIToolbar!

    var text:String = "默认文本" //用来在屏幕上绘制文本
    
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
    /*func addConstraintsToToolbarForSettingsView(view: UIView) {
        view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        self.toolbar.addSubview(view)
        self.toolbar.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[settingsView]-0-|",
                                                                                   options: .DirectionLeadingToTrailing,
                                                                                   metrics: nil,
                                                                                   views: ["settingsView" : view]))
        self.toolbar.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[settingsView(==height)]",
                                                                                   options: .DirectionLeadingToTrailing,
                                                                                   metrics: ["height" : view.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height],
                                                                                   views: ["settingsView" : view]))
    }*/
    
    
    //@IBAction func paintingBrushSettings(_ sender: UIBarButtonItem) {
        
    //}
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set ImageView to display the selected image.
        DrawingBoard.image = selectedImage
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
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
        case 1:
            let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
        case 2:
            let alertController = UIAlertController(title: "添加文本", message: "请输入文本", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField:UITextField) in
            textField.placeholder = "此处为文本"
            }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.default) { (UIAlertAction) in
            self.text = alertController.textFields![0].text!
            }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        print(text)
        var nstext=NSString(string: text)
        let font=UIFont.boldSystemFont(ofSize: 15)
        nstext.draw(at: CGPoint(x:10,y:10), withAttributes: [NSFontAttributeName:font,NSForegroundColorAttributeName:UIColor.black.cgColor])
        self.DrawingBoard.drawText(text: nstext)
            
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
