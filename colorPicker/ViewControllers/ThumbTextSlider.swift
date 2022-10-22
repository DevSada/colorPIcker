//
//  ThumbTextSlider.swift
//  colorPicker
//
//  Created by Alexander Petrenko on 13.10.2022.
//

import UIKit

class ThumbTextSlider: UISlider {
    
    private var thumbTextLabel: UILabel = UILabel()
    private lazy var thumbView: UIView = UIView()
    
    private var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        thumbTextLabel.frame = CGRect(x: thumbFrame.origin.x, y: thumbFrame.origin.y, width: thumbFrame.size.width, height: thumbFrame.size.height)
        self.setValue()
    }
    
    private func setValue() {
        thumbTextLabel.text = String(Int(self.value))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(thumbTextLabel)
        thumbTextLabel.textAlignment = .center
        thumbTextLabel.adjustsFontSizeToFitWidth = true
        thumbTextLabel.font = thumbTextLabel.font.withSize(25)
        thumbTextLabel.layer.zPosition = layer.zPosition + 1
       
        let thumb = thumbImage()
        setThumbImage(thumb, for: .normal)
    }
    
    private func thumbImage() -> UIImage {
        let width = 50
        thumbView.frame = CGRect(x: 0, y: 15, width: width, height: 30)
        
        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { rendererContext in
            thumbView.backgroundColor = .white
            thumbView.layer.cornerRadius = 10
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: 5))
    }

}
