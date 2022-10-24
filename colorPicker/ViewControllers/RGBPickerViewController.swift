//
//  RGBPickerViewController.swift
//  colorPicker
//
//  Created by Alexander Petrenko on 13.10.2022.
//

import UIKit


protocol ColorRGBDelegate: AnyObject {
    func getColorRGB(color: UIColor)
}

enum sliderType {
    case red
    case green
    case blue
}


class RGBPickerViewController: UIViewController {
    
    var redSpectr: CGFloat = 0
    var greenSpectr: CGFloat = 0
    var blueSpectr: CGFloat = 0
    var tag = 0
    
    weak var colorDelegate: ColorRGBDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addColorView()
        addBackButton()
        addSlider(sliderColor: .red)
        addSlider(sliderColor: .green)
        addSlider(sliderColor: .blue)
       
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setTitle("Back to..", for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }

    private func addColorView() {
        let colorView: UIView = UIView(frame: .zero)
        colorView.tag = 4
        colorView.backgroundColor = UIColor(red: redSpectr/255, green: greenSpectr/255, blue: blueSpectr/255, alpha: 1)
        colorView.layer.cornerRadius = 20
        self.view.addSubview(colorView)
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            colorView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            colorView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            colorView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            colorView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
    }
    
    
    private func addSlider(sliderColor color: sliderType){
        tag += 1
        
        let elementWidth = self.view.bounds.width - 16
        let elementHeight = 20
        let elementLeading = 16
        let elementTop: Int
        let elementColor: UIColor
        let elementText: String
        let elementValue: CGFloat
        
        
        switch color {
        case .red:
            elementColor = .red
            elementTop = 350
            elementText = "Red"
            elementValue = redSpectr
        case .green:
            elementColor = .green
            elementTop = 450
            elementText = "Green"
            elementValue = greenSpectr
        case .blue:
            elementColor = .blue
            elementTop = 550
            elementText = "Blue"
            elementValue = blueSpectr
        }
        
        let sliderRGB = ThumbTextSlider(frame: CGRect(x: elementLeading * 4, y: elementTop, width: Int(elementWidth) - elementLeading * 4, height: elementHeight))
        
        sliderRGB.minimumTrackTintColor = elementColor
        sliderRGB.maximumTrackTintColor = .white
        sliderRGB.minimumValue = 0
        sliderRGB.maximumValue = 255
        sliderRGB.value = Float(elementValue)
        sliderRGB.tag = tag
        sliderRGB.awakeFromNib()
        sliderRGB.addTarget(self, action: #selector(slide(_ :)), for: .allEvents)
        
        let labelRGB = UILabel(frame: CGRect(x: elementLeading, y: elementTop - 6, width: elementLeading * 3, height: elementHeight))
        labelRGB.text = elementText
        labelRGB.textColor = elementColor
        labelRGB.font = labelRGB.font.withSize(12)
        
        self.view.addSubview(sliderRGB)
        self.view.addSubview(labelRGB)
        
        
    }
    
    @objc func backButtonPressed() {
        self.navigationController?.popViewController(animated: true)
        colorDelegate?.getColorRGB(color: UIColor(red: redSpectr/255, green: greenSpectr/255, blue: blueSpectr/255, alpha: 1))
    }
    
    @objc func slide(_ sender: ThumbTextSlider) {
        if sender.value >= 0 {
            switch sender.tag{
            case 1: redSpectr = CGFloat(Int(sender.value))
            case 2: greenSpectr = CGFloat(Int(sender.value))
            case 3: blueSpectr = CGFloat(Int(sender.value))
            default:
                return
            }
            self.view.viewWithTag(4)?.backgroundColor = UIColor(red: redSpectr/255, green: greenSpectr/255, blue: blueSpectr/255, alpha: 1)
            
        }
    }
}


