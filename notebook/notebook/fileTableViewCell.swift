//
//  fileTableViewCell.swift
//  notebook
//
//  Created by Apple on 2017/6/4.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class fileTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
