//
//  Note.swift
//  notebook
//
//  Created by Apple on 2017/6/19.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import Foundation
import UIKit
import os.log

class Note
{
    var note:UIImage
    var month:Int
    //用户信息保存路径
    /*static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("notes")

    struct PropertyKey {
        static let note="note"
        static let month="month"
    }*/
    
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
    init(note:UIImage,month:Int)
    {
        self.note=note
        self.month=month
    }
    //Mark:归解档
    /*func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(note,forKey:PropertyKey.note)
        aCoder.encode(month,forKey:PropertyKey.month)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        let note = aDecoder.decodeObject(forKey: PropertyKey.note) as! UIImage
        let month = aDecoder.decodeInteger(forKey: PropertyKey.month)
        self.init(note: note, month: month)
    }*/
    
}
