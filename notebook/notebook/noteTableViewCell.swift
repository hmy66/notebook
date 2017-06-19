//
//  noteTableViewCell.swift
//  notebook
//
//  Created by Apple on 2017/6/19.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class noteTableViewCell: UITableViewCell {

    @IBOutlet weak var fileIcon: UIImageView!
    @IBOutlet weak var time: UILabel!
    
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
