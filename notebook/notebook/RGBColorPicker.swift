//
//  RGBColorPicker.swift
//  notebook
//
//  Created by Apple on 2017/5/21.
//  Copyright © 2017年 zhijian corporation. All rights reserved.
//

import UIKit
class RGBColorPicker: UIView {
        
        var colorChangedBlock: ((_ color: UIColor) -> Void)?
        
        private var sliders = [UISlider]()
        private var labels = [UILabel]()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.initial()
        }
        
        required init(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)!
            
            self.initial()
        }
        
        private func initial() {
            self.backgroundColor = UIColor.clear
            let trackColors = [UIColor.red, UIColor.green, UIColor.blue]
            
            for index in 1...3 {
                let slider = UISlider()
                slider.minimumValue = 0
                slider.value = 0
                slider.maximumValue = 255
                slider.minimumTrackTintColor = trackColors[index - 1]
                slider.addTarget(self, action: Selector("colorChanged:"), for: .valueChanged)
                self.addSubview(slider)
                self.sliders.append(slider)
                
                let label = UILabel()
                label.text = "0"
                self.addSubview(label)
                self.labels.append(label)
            }
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            let sliderHeight = CGFloat(31)
            let labelWidth = CGFloat(29)
            let yHeight = self.bounds.size.height / CGFloat(sliders.count)
            
            for index in 0..<self.sliders.count {
                let slider = self.sliders[index]
                slider.frame = CGRect(x: 0, y: CGFloat(index) * yHeight, width: self.bounds.size.width - labelWidth - 5.0, height: sliderHeight)
                
                let label = self.labels[index]
                label.frame = CGRect(x: slider.frame.maxX + 5, y: slider.frame.origin.y, width: labelWidth, height: sliderHeight)
            }
        }
        /*override func invalidateIntrinsicContentSize() {
            <#code#>
        }*/
        /*override func intrinsicContentSize() -> CGSize {
            return CGSize(width: UIViewNoIntrinsicMetric, height: 107)
        }*/
        
        @IBAction private func colorChanged(slider: UISlider) {
            let color = UIColor(
                red: CGFloat(self.sliders[0].value / 255.0),
                green: CGFloat(self.sliders[1].value / 255.0),
                blue: CGFloat(self.sliders[2].value / 255.0),
                alpha: 1)
            
            let index=self.sliders.index(of: slider)
            let label = self.labels[index!]
            label.text = NSString(format: "%.0f", slider.value) as String
            
            if let colorChangedBlock = self.colorChangedBlock {
                colorChangedBlock(color)
            }
        }
        
        func setCurrentColor(color: UIColor) {
            var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0
            color.getRed(&red, green: &green, blue: &blue, alpha: nil)
            let colors = [red, green, blue]
            
            for index in 0..<self.sliders.count {
                let slider = self.sliders[index]
                slider.value = Float(colors[index]) * 255
                
                let label = self.labels[index]
                label.text = NSString(format: "%.0f", slider.value) as String
            }
        }
}
