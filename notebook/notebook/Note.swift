//
//  Note.swift
//  notebook
//
//  Created by Apple on 2017/6/19.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import Foundation
import UIKit

class Note
{
    var note:UIImage
    var month:Int
    
    init() {
        let calendar=Calendar(identifier: .gregorian)
        let com=calendar.dateComponents([.month], from: Date())
        month=com.month!
        note=#imageLiteral(resourceName: "defaultNote")
    }
    
    init(note:UIImage){
        let calendar=Calendar(identifier: .gregorian)
        let com=calendar.dateComponents([.month], from: Date())
        month=com.month!
        self.note=note
    }
    
}
