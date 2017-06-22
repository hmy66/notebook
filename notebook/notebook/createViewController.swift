//
//  createViewController.swift
//  notebook
//
//  Created by Apple on 2017/5/15.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class createViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //Mark:6Buttons Outlets
    @IBOutlet weak var Btnback: UIButton!
    @IBOutlet weak var Btnsave: UIButton!
    @IBOutlet weak var BtnPenceil: UIButton!
    @IBOutlet weak var Btnrubber: UIButton!
    @IBOutlet weak var Btntext: UIButton!
    @IBOutlet weak var BtnPicture: UIButton!
    
    //var toolbarEditingItems: [UIBarButtonItem]?
    //var currentSettingsView: UIView?
    
    //@IBOutlet weak var toolbar: UIToolbar!

    var text:String = "默认文本" //用来在屏幕上绘制文本
    
    //@IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var DrawingBoard: board!
    var lastScale:CGFloat=1
    var flag:Int=1
    var tmpImage:UIImage?
    //var image:UIImage=#imageLiteral(resourceName: "defaultNote")
    let imageview=UIImageView(frame:CGRect(x: 250, y: 250, width: 100, height: 100))
    //抬头文字
    let datelabel=UILabel(frame: CGRect(x: 20, y: 20, width: 150, height: 40))
    let weatherlabel=UILabel(frame: CGRect(x: 200, y: 20, width: 50, height: 40))
    let inputweather=UITextField(frame: CGRect(x: 250, y: 20, width: 50, height: 40))
    let inputtext=UITextView(frame: CGRect(x: 300, y: 300, width: 100, height: 100))
    //var textpoint:CGPoint!
    
    var brushes = [PencilBrush(),EraserBrush()]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DrawingBoard.brush=brushes[1]
        //添加抬头文字
        let calendar=Calendar(identifier: .gregorian)
        let com=calendar.dateComponents([.month,.day], from: Date())
        let month=com.month!
        let day=com.day!
        datelabel.text="日期:\(month)月\(day)日"
        weatherlabel.text="天气:"
        //inputweather.backgroundColor=UIColor.black
        //inputweather.tintColor=UIColor.black
        //inputtext.backgroundColor=UIColor.black
        inputtext.layer.borderWidth=1
        //inputtext.layer.borderColor=UIColor.blue as! CGColor
        self.DrawingBoard.addSubview(datelabel)
        self.DrawingBoard.addSubview(weatherlabel)
        self.DrawingBoard.addSubview(inputweather)
        //self.DrawingBoard.addSubview(inputtext)
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
        self.imageview.image = selectedImage
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
    /*@IBAction func switchBrush(_ sender:UISegmentedControl) {
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

    }*/
    //Mark: 6 buttons' actions
    //不用segment control是因为它必须先点别的按钮才可以响应
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("here")
        let touch = ((touches as NSSet).anyObject() as AnyObject)
        textpoint=touch.location(in: self.DrawingBoard)
    }*/
    
    @IBAction func Actback(_ sender: UIButton) {
        Btnback.backgroundColor=UIColor.cyan
        Btnsave.backgroundColor=UIColor.clear
        BtnPenceil.backgroundColor=UIColor.clear
        Btnrubber.backgroundColor=UIColor.clear
        Btntext.backgroundColor=UIColor.clear
        BtnPicture.backgroundColor=UIColor.clear
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func ActSave(_ sender: UIButton) {
        Btnback.backgroundColor=UIColor.clear
        Btnsave.backgroundColor=UIColor.cyan
        BtnPenceil.backgroundColor=UIColor.clear
        Btnrubber.backgroundColor=UIColor.clear
        Btntext.backgroundColor=UIColor.clear
        BtnPicture.backgroundColor=UIColor.clear
        tmpImage=self.DrawingBoard.takeImage()
        UIAlertView(title:nil, message: "保存成功！", delegate: nil, cancelButtonTitle: "确定").show()
    }
    
    @IBAction func ActPencil(_ sender: UIButton) {
        Btnback.backgroundColor=UIColor.clear
        Btnsave.backgroundColor=UIColor.clear
        BtnPenceil.backgroundColor=UIColor.cyan
        Btnrubber.backgroundColor=UIColor.clear
        Btntext.backgroundColor=UIColor.clear
        BtnPicture.backgroundColor=UIColor.clear
        self.DrawingBoard.brush=self.brushes[0]

    }
    @IBAction func ActEraser(_ sender: UIButton) {
        Btnback.backgroundColor=UIColor.clear
        Btnsave.backgroundColor=UIColor.clear
        BtnPenceil.backgroundColor=UIColor.clear
        Btnrubber.backgroundColor=UIColor.cyan
        Btntext.backgroundColor=UIColor.clear
        BtnPicture.backgroundColor=UIColor.clear
        self.DrawingBoard.brush=self.brushes[1]
    }
    //拖手势
    func handlePanGesture(sender: UIPanGestureRecognizer){
        //得到拖的过程中的xy坐标
        print("xy")
        let translation : CGPoint = sender.translation(in: inputtext)
        //let desx=translation.x+300
        //let desy=translation.y+300
        inputtext.transform=CGAffineTransform(translationX: translation.x, y: translation.y)
        //let input=UITextField(frame: CGRect(x: desx, y: desy, width: 100, height: 100))
        //input.backgroundColor=UIColor.black
        //self.DrawingBoard.addSubview(input)
        //平移图片CGAffineTransformMakeTranslation
        /*inputtext.transform = CGAffineTransform(translationX: translation.x+translation.x, y: translation.y+translation.y)*/
       // if sender.state == UIGestureRecognizerState.ended{
            //let input=UITextView(frame: CGRect(x: desx, y: desy, width: 100, height: 100))
            //input.layer.borderWidth=1
            self.DrawingBoard.addSubview(inputtext)
            //self.DrawingBoard.addSubview(inputtext)
        //}
    }
    
    @IBAction func ActText(_ sender: UIButton) {
        Btnback.backgroundColor=UIColor.clear
        Btnsave.backgroundColor=UIColor.clear
        BtnPenceil.backgroundColor=UIColor.clear
        Btnrubber.backgroundColor=UIColor.clear
        Btntext.backgroundColor=UIColor.cyan
        BtnPicture.backgroundColor=UIColor.clear
        //拖手势
        //let inputtext=UITextField(frame: CGRect(x: 250, y: 20, width: 100, height: 100))
        inputtext.isUserInteractionEnabled=true
        let panges=UIPanGestureRecognizer()
        panges.addTarget(self, action: #selector(createViewController.handlePanGesture(sender:)))
        //let panGesture=UIPanGestureRecognizer(target:self,action:"handlePanGesture:")
        inputtext.addGestureRecognizer(panges)
        //在文本框中输入想输入的文本
       /*let alertController = UIAlertController(title: "添加文本", message: "请输入文本", preferredStyle: UIAlertControllerStyle.alert)
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
        print(text)*/
        //let nstext=NSString(string: text)
        //let font=UIFont.boldSystemFont(ofSize: 15)
        //nstext.draw(at: CGPoint(x:10,y:10), withAttributes: [NSFontAttributeName:font,NSForegroundColorAttributeName:UIColor.black.cgColor])
        //self.DrawingBoard.drawText(text: text)
       //let textfield=self.DrawingBoard.brush?.place()
        //textfield?.backgroundColor=UIColor.black
        //self.DrawingBoard.addSubview(textfield!)
        self.DrawingBoard.addSubview(inputtext)

    }
    
    @IBAction func actpicture(_ sender: UIButton) {
        Btnback.backgroundColor=UIColor.clear
        Btnsave.backgroundColor=UIColor.clear
        BtnPenceil.backgroundColor=UIColor.clear
        Btnrubber.backgroundColor=UIColor.clear
        Btntext.backgroundColor=UIColor.clear
        BtnPicture.backgroundColor=UIColor.cyan
        //let imageview=UIImageView(frame:CGRect(x: 250, y: 250, width: 100, height: 100))
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        self.DrawingBoard.addSubview(imageview)
        imageview.isUserInteractionEnabled=true
        print("inter")
        var panges=UIPanGestureRecognizer()
        var rotateges=UIRotationGestureRecognizer()
        var tapges=UITapGestureRecognizer()
        var pinchges=UIPinchGestureRecognizer()
        rotateges.addTarget(self, action: #selector(createViewController.handleRotateGesture(sender:)))
        tapges.addTarget(self, action: #selector(createViewController.handleTapGesture(sender:)))
        tapges.numberOfTapsRequired=2
        panges.addTarget(self, action: #selector(createViewController.handleMyPanGesture(sender:)))
        pinchges.addTarget(self, action: #selector(createViewController.handlePinchGesture(sender:)))
        self.imageview.addGestureRecognizer(rotateges)
        self.imageview.addGestureRecognizer(tapges)
        self.imageview.addGestureRecognizer(panges)
        self.imageview.addGestureRecognizer(pinchges)
    }
    
    func handlePinchGesture(sender:UIPinchGestureRecognizer)
    {
        print("pinches")
        let factor=sender.scale
        if factor > 1{
            //图片放大
            imageview.transform = CGAffineTransform(scaleX: lastScale+factor-1, y: lastScale+factor-1)
        }else{
            //缩小
            imageview.transform = CGAffineTransform(scaleX:lastScale*factor,y:lastScale*factor)
        }
        //状态是否结束，如果结束保存数据
        if sender.state == UIGestureRecognizerState.ended{
            if factor > 1{
                lastScale = lastScale + factor - 1
            }else{
                lastScale = lastScale * factor
            }
        }
        
    }
    func handleMyPanGesture(sender:UIPanGestureRecognizer)
    {
        print("panges")
        //self.imageview.transform=CGAffineTransform(scaleX: lastScale, y: lastScale)
        let translation : CGPoint = sender.translation(in: imageview)
        imageview.transform=CGAffineTransform(translationX: translation.x, y: translation.y)
        self.DrawingBoard.addSubview(imageview)
        //self.imageview.transform=CGAffineTransform(scaleX: lastScale, y: lastScale)
        //self.DrawingBoard.addSubview(imageview)
    }
    
    func handleTapGesture(sender:UITapGestureRecognizer)
    {
        if(flag==1)
        {
            flag=0
            lastScale*=2
        }
        else if(flag==0)
        {
            flag=1
            lastScale/=2
        }
        self.imageview.transform=CGAffineTransform(scaleX: lastScale, y: lastScale)
        self.DrawingBoard.addSubview(imageview)
    }
    
    func handleRotateGesture(sender: UIRotationGestureRecognizer){
    //浮点类型，得到sender的旋转度数
    print("rotate")
    //self.imageview.transform=CGAffineTransform(scaleX: lastScale, y: lastScale)
    var rotation : CGFloat = sender.rotation
    //旋转角度CGAffineTransformMakeRotation,改变图像角度
    imageview.transform = CGAffineTransform(rotationAngle: rotation)
    //状态结束，保存数据
    if sender.state == UIGestureRecognizerState.ended{
        self.DrawingBoard.addSubview(imageview)
    }
}
    
}
