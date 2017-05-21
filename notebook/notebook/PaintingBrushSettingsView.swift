//
//  PaintingBrushSettingsView.swift
//  notebook
//
//  Created by Apple on 2017/5/21.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit

class PaintingBrushSettingsView: UIView {
    
    var strokeWidthChangedBlock: ((_ strokeWidth: CGFloat) -> Void)?
    var strokeColorChangedBlock: ((_ strokeColor: UIColor) -> Void)?

    @IBOutlet weak var strokeWidthSlider: UISlider!
    @IBOutlet weak var strokeColorPreview: UIView!
    @IBOutlet weak var colorPicker: RGBColorPicker!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.strokeColorPreview.layer.borderColor = UIColor.black.cgColor
        self.strokeColorPreview.layer.borderWidth = 1
        
        self.colorPicker.colorChangedBlock = {
            [unowned self] (color: UIColor) in
            
            self.strokeColorPreview.backgroundColor = color
            if let strokeColorChangedBlock = self.strokeColorChangedBlock {
                strokeColorChangedBlock(color)
            }
        }
        self.strokeWidthSlider.addTarget(self, action: Selector(("strokeWidthChanged:")), for: .valueChanged)
    }
    
    func setBackgroundColor(color: UIColor) {
        self.strokeColorPreview.backgroundColor = color
        self.colorPicker.setCurrentColor(color: color)
    }
    
    func strokeWidthChanged(slider: UISlider) {
        if let strokeWidthChangedBlock = self.strokeWidthChangedBlock {
            strokeWidthChangedBlock(CGFloat(slider.value))
        }
    }
}
