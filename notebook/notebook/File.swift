//
//  File.swift
//  notebook
//
//  Created by Apple on 2017/5/18.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class File{
    var name:String
    var photo:UIImage?
    init?(name:String,photo:UIImage?)
    {
        self.name=name
        self.photo=photo
    if name.isEmpty{
        return nil
    }
    }

}
