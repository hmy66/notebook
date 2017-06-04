//
//  signViewController.swift
//  notebook
//
//  Created by Apple on 2017/6/4.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class signViewController: UIViewController {

    var lists=[user]()
    @IBOutlet weak var navibar: UINavigationBar!
    @IBOutlet weak var backbutton: UIBarButtonItem!
    
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
    //Mark:signup
    @IBAction func signup(_ sender: UIButton) {
        var newuser=user(username:username.text!,password:password.text!)
        lists.append(newuser)
        UIAlertView(title:nil, message: "注册成功", delegate: nil, cancelButtonTitle: "确定").show()
    }
    //Mark:cancel signup
    @IBAction func cancel(_ sender: UIButton) {
     username.text="用户名"
     password.text="密码"
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
