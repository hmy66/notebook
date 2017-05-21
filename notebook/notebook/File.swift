//
//  File.swift
//  notebook
//
//  Created by Apple on 2017/5/18.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit
import os.log

class File:NSObject,NSCoding{
    var name:String
    var photo:UIImage?
    var pictures=[UIImage]()
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("pictures")
    
    struct key{
        static let name="name"
        static let photo="photo"
        static let pictures="pictures"
    }
    
    init?(name:String,photo:UIImage?)
    {
        self.name=name
        self.photo=photo
    if name.isEmpty{
        return nil
    }
    }

    //Mark:NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey:key.name)
        aCoder.encode(photo, forKey: key.photo)
        aCoder.encode(pictures, forKey: key.pictures)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: key.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: key.photo) as? UIImage
        
        let pictures = aDecoder.decodeInteger(forKey: key.pictures)
            as? UIImage
        
        // Must call designated initializer.
        self.init(name: name, photo: photo)
    }    
}


