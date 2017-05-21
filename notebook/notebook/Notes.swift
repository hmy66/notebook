//
//  Notes.swift
//  notebook
//
//  Created by Apple on 2017/5/21.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import Foundation
import UIKit

class Notes{
    var note=UIImage()
    let date=DateComponents()
    init(note:UIImage)
    {
        self.note=note
    }
    func getYear()->Int
    {
        return date.year!
    }
    func getMonth()->Int
    {
        return date.month!
    }
}
