//
//  userinfo.swift
//  notebook
//
//  Created by Apple on 2017/6/4.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import Foundation


class user
{
    var username:String
    var password:String
    
    init()
    {
        self.username="username"
        self.password="password"
    }
    
    init(username:String,password:String)
    {
        self.username=username
        self.password=password
    }
}
