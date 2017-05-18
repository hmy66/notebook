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
    @IBOutlet weak var fileName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //cell最左边的箭头
        self.accessoryType=UITableViewCellAccessoryType.disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
           }
    
}
