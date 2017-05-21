//
//  fileCell.swift
//  notebook
//
//  Created by Apple on 2017/5/18.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class fileCell: UITableViewCell {

    @IBOutlet weak var fileIcon: UIImageView!
    @IBOutlet weak var fileName: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //cell最边的箭头
        self.accessoryType=UITableViewCellAccessoryType.disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
       print("selected")
        
    }
    
}
