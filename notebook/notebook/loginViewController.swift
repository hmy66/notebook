//
//  loginViewController.swift
//  notebook
//
//  Created by Apple on 2017/6/18.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit
import os.log
//protocol ValueBackDelegate {
   // func valueBack(value1:String,value2:String)
//}

class loginViewController: UIViewController{

    var lists=[user]()
   
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    /*func valueBack(value1:String,value2:String)
    {
        userName.text=value1
        passWord.text=value2
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedusers=loadUsers()
        {
            lists+=savedusers
        }
        else
        {
        userName.text="username"
        passWord.text="password"
        lists.append(user(username: "username", password: "password"))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //注册
    @IBAction func signUp(_ sender: UIButton) {
        self.performSegue(withIdentifier: "signup", sender: self)
    }

    //登录
    @IBAction func logIn(_ sender: AnyObject) {
        var i:Int=0
        var flag:Bool=false
        
        while(i<lists.count){
            if(lists[i].match(value1: userName.text!,value2: passWord.text!))
            {
                flag=true
                break
            }
            i+=1
        }
        print(flag)
        if(flag==true)
        {
            self.performSegue(withIdentifier: "login", sender: self)
        }
        else
        {
             UIAlertView(title:nil, message: "登录失败", delegate: nil, cancelButtonTitle: "确定").show()
        }
    }
    
    @IBAction func unwindTologinPage(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? signViewController, let newuser = sourceViewController.newuser {
            lists.append(newuser)
            print(newuser.username)
            //saveUsers()
        }
    }
   //Mark:user的归档和解档
    private func saveUsers()
    {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(lists, toFile: user.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Users successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadUsers()->[user]?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: user.ArchiveURL.path) as? [user]
    }
    
    //重写prepare方法将username的值传给homepage
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="login"
        {
            if let secondView=segue.destination as? ViewController{
                //print("hhhh")
                let tmp:String=self.userName.text!
                secondView.receivedstr=tmp
            }
        }
    }
}
