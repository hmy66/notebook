//
//  signViewController.swift
//  notebook
//
//  Created by Apple on 2017/6/4.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit
import os.log

class signViewController: UIViewController{

    var newuser:user?
    @IBOutlet weak var navibar: UINavigationBar!
    @IBOutlet weak var backbutton: UIBarButtonItem!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIButton, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        newuser=user(username: username.text!, password: password.text!)
    }
    
    //Mark:signup
    /*@IBAction func signup(_ sender: UIButton) {
        //var newuser=user(username:username.text!,password:password.text!)
        //lists.append(newuser)
        UIAlertView(title:nil, message: "注册成功", delegate: nil, cancelButtonTitle: "确定").show()
    }*/
    //Mark:cancel signup
    @IBAction func cancel(_ sender: UIButton) {
     username.text="username"
     password.text="password"
    }
   
    @IBAction func exit(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
