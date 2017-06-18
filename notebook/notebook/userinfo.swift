//
//  userinfo.swift
//  notebook
//
//  Created by Apple on 2017/6/4.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import Foundation
import UIKit
import os.log

class user
{
    var username:String
    var password:String
    //var myportrait:UIImage
   
    init()
    {
        self.username="username"
        self.password="password"
        //self.myportrait=#imageLiteral(resourceName: "portrait")
    }
    
    struct PropertyKey {
        static let username="username"
        static let password="password"
    }
    //用户信息保存路径
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("users")
    
    init(username:String,password:String)
    {
        self.username=username
        self.password=password
        //self.myportrait=#imageLiteral(resourceName: "portrait")
    }
    func match(value1:String,value2:String)->Bool
    {
        if(value1==username&&value2==password)
        {return true}
        else
        {return false}
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(username,forKey: PropertyKey.username)
        aCoder.encode(password, forKey: PropertyKey.password)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let name = aDecoder.decodeObject(forKey: PropertyKey.username) as! String
        let key = aDecoder.decodeObject(forKey: PropertyKey.password) as! String
        self.init(username: name, password: key)
    }

}
