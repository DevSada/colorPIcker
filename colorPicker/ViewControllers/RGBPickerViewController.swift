//
//  RGBPickerViewController.swift
//  colorPicker
//
//  Created by Alexander Petrenko on 13.10.2022.
//

import UIKit


enum sliderType {
    case red
    case green
    case blue
}

var redSpectr: CGFloat = 255
var greenSpectr: CGFloat = 255
var blueSpectr: CGFloat = 255

class RGBPickerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(getSlider(sliderColor: sliderType.red, tag: 1))
        self.view.addSubview(getSlider(sliderColor: sliderType.green, tag: 2))
        self.view.addSubview(getSlider(sliderColor: sliderType.blue, tag: 3))
        
        self.view.backgroundColor = UIColor(red: redSpectr/255, green: greenSpectr/255, blue: blueSpectr/255, alpha: 1)
    }
    

    
    private func getSlider(sliderColor color: sliderType, tag tagnumber: Int) -> ThumbTextSlider{
        
        let sliderWidth = self.view.bounds.width - 32
        let sliderHeight = 20
        let sliderLeading = 16
        let sliderTop: Int
        let tintColor: UIColor
        
        switch color {
        case .red:
            tintColor = .red
            sliderTop = 250
        case .green:
            tintColor = .green
            sliderTop = 350
        case .blue:
            tintColor = .blue
            sliderTop = 450
        }
        
        let sliderRGB = ThumbTextSlider(frame: CGRect(x: sliderLeading, y: sliderTop, width: Int(sliderWidth), height: sliderHeight))
        
        sliderRGB.minimumTrackTintColor = tintColor
        sliderRGB.maximumTrackTintColor = .white
        sliderRGB.minimumValue = 0
        sliderRGB.maximumValue = 255
        sliderRGB.tag = tagnumber
        sliderRGB.awakeFromNib()
        sliderRGB.addTarget(self, action: #selector(slide(_ :)), for: .allEvents)
        
        return sliderRGB
    }
    
    @objc func slide(_ sender: ThumbTextSlider) {
        if sender.value > 0 {
            switch sender.tag{
               case 1: redSpectr = CGFloat(Int(sender.value))
               case 2: greenSpectr = CGFloat(Int(sender.value))
               case 3: blueSpectr = CGFloat(Int(sender.value))
            default:
                return
            }
            self.view.backgroundColor = UIColor(red: redSpectr/255, green: greenSpectr/255, blue: blueSpectr/255, alpha: 1)
            
        }
    }


}


