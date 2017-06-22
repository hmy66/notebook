//
//  ViewController.swift
//  notebook
//
//  Created by Apple on 2017/4/27.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    var receivedstr:String=""
    var tmpnote=Note()
    var flag:Int=0
    @IBOutlet weak var Portrait: UIImageView!
  
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let page=UIView()
        page.backgroundColor=UIColor.blue
        userName.text=receivedstr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*func getnote() -> Note {
        return tmpnote
    }
    func getstring() -> String {
        return "test string"
    }*/
    //Mark:change Portrait
    @IBAction func changePortrait(_ sender: UITapGestureRecognizer) {
        // Hide the keyboard.
        //username.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set ImageView to display the selected image.
        Portrait.image = selectedImage
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logout(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindFromDrawingBoard(sender:UIStoryboardSegue)
    {
        if let sourceViewController = sender.source as? createViewController, let tmp = sourceViewController.tmpImage {
            tmpnote=Note(note: tmp)
            //saveUsers()
            flag=1
            print("unwind success")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="view"
        {
            print("here")
            if let secondView=segue.destination.childViewControllers[0] as? viewTableViewController{
                print("segue to view table view")
                //let tmp:String=self.userName.text!
                secondView.tmpNote=tmpnote
                secondView.teststr="test string"
            }
        }
    }
    
    @IBAction func viewNote(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "view", sender: self)
    }
}

